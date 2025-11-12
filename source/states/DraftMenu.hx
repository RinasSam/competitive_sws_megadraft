/*
 * Copyright 2025 RinasSam
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 *
 * DraftMenu.hx: The real draft menu.
 */


package states;


import cards.Card;
import cards.CardFactory;

import flixel.addons.ui.FlxUIButton;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.input.mouse.FlxMouseEvent;
import flixel.text.FlxText;
import flixel.util.FlxColor;

import haxe.ds.Vector;

import openfl.geom.ColorTransform;

import util.UserInterfaceUtil;


class DraftMenu extends FlxState
{

	private var buttonBack:FlxUIButton;

	private var textExplanation:FlxText;

	private var spriteBackground:FlxSprite;
	private var spriteBackground2:FlxSprite;

	private var p1Area:FlxSprite;
	private var p1Cards:Array<Card>;
	private var textP1:FlxText;

	private var p2Area:FlxSprite;
	private var p2Cards:Array<Card>;
	private var textP2:FlxText;

	private var currentPlayer:Int = 0;

	private var cards:Vector<Vector<Card>>;
	
	
	override public function create()
	{
		super.create();

		_initBackground();
		_initTexts();

		buttonBack = UserInterfaceUtil.createButton("BACK", 16, 2, _onClickBack);
		buttonBack.y = UserInterfaceUtil.SCREEN_HEIGHT - buttonBack.height - UserInterfaceUtil.MARGIN * 2;
		this.add(buttonBack);

		_initAreas();
		_switchPlayers();		
		_generateCards();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		this.spriteBackground.x -= 0.5;
		this.spriteBackground2.x -= 0.5;

		if (spriteBackground.x < spriteBackground.width * -1) {
			spriteBackground.x += spriteBackground.width;
			spriteBackground2.x += spriteBackground2.width;
		}
	}

	private function _initBackground()
	{
		this.spriteBackground = new FlxSprite();
		this.spriteBackground.loadGraphic(AssetPaths.low__png);
		this.spriteBackground.scale.set(20/3, 20/3);
		this.spriteBackground.updateHitbox();
		this.spriteBackground.screenCenter(Y);
		this.add(this.spriteBackground);

		this.spriteBackground2 = this.spriteBackground.clone();
		this.spriteBackground2.scale.set(20/3, 20/3);
		this.spriteBackground2.updateHitbox();
		this.spriteBackground2.screenCenter(Y);
		this.spriteBackground2.x = this.spriteBackground.x + this.spriteBackground.width;
		this.add(this.spriteBackground2);
	}

	private function _initTexts()
	{	
		this.textExplanation = new FlxText(0, 0, UserInterfaceUtil.SCREEN_WIDTH - UserInterfaceUtil.MARGIN * 4);
		this.textExplanation.text = "Click on a card to choose!\n(Green = P1, Red = P2, Black = Draft Complete)";
		this.textExplanation.size = 12;
		this.textExplanation.alignment = FlxTextAlign.CENTER;
		this.textExplanation.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2, 1);
		this.textExplanation.screenCenter(X);
		this.textExplanation.y += UserInterfaceUtil.MARGIN * 4;
		this.add(textExplanation);

		this.textP1 = new FlxText(0, 0, UserInterfaceUtil.MARGIN * 10);
		this.textP1.text = "P1";
		this.textP1.size = 20;
		this.textP1.alignment = FlxTextAlign.CENTER;
		this.textP1.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2, 1);
		this.textP1.setColorTransform(1, 1, 1, 1, 0, 200, 0, 0);
		this.textP1.x = textP1.y = UserInterfaceUtil.MARGIN;
		this.add(textP1);

		this.textP2 = new FlxText(0, 0, UserInterfaceUtil.MARGIN * 10);
		this.textP2.text = "P2";
		this.textP2.size = 20;
		this.textP2.alignment = FlxTextAlign.CENTER;
		this.textP2.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2, 1);
		this.textP2.setColorTransform(1, 1, 1, 1, 200, 0, 0, 0);
		this.textP2.x = UserInterfaceUtil.SCREEN_WIDTH - this.textP2.width - UserInterfaceUtil.MARGIN;
		this.textP2.y = textP1.y;
		this.add(textP2);
	}

	private function _initAreas()
	{
		this.p1Area = new FlxSprite(this.textP1.x, this.textP1.y + this.textP1.height + UserInterfaceUtil.MARGIN);
		this.p1Area.loadGraphic(AssetPaths.p1area__png);
		this.p1Area.setColorTransform(0.5, 1, 0.5, 1, 0, 100, 0, 0);
		this.add(this.p1Area);

		this.p2Area = new FlxSprite(this.textP2.x - this.textP2.width - UserInterfaceUtil.MARGIN, this.textP2.y + this.textP2.height + UserInterfaceUtil.MARGIN);
		this.p2Area.loadGraphic(AssetPaths.p2area__png);
		this.p2Area.setColorTransform(1, 0.5, 0.5, 1, 100, 0, 0, 0);
		this.add(this.p2Area);
	}

	private function _switchPlayers()
	{
		if (currentPlayer == 1) {
			FlxG.mouse.cursor.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 200, 0, 0, 0);
			currentPlayer = 2;
			return;
		}


		FlxG.mouse.cursor.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 0, 200, 0, 0);
		currentPlayer = 1;
		return;
	}


	private function _generateCards()
	{
		this.p1Cards = new Array<Card>();
		this.p2Cards = new Array<Card>();

		/* If we do not do this, nothing works for some reason. */
		Main.cardFactory.initCards();
		Main.cardFactory.generateCardPool();

		this.cards = new Vector<Vector<Card>>(6);
		
		for (i in 0 ... this.cards.length) {
			this.cards[i] = new Vector<Card>(6);
		}

		var baseX:Float = p1Area.width + p1Area.x + UserInterfaceUtil.MARGIN + (p2Area.x / 6);
		var baseY:Float = p1Area.y + textExplanation.height - UserInterfaceUtil.MARGIN * 3;

		for (i in 0 ... this.cards.length) {
			for (j in 0 ... this.cards[i].length) {
				var card = Main.cardFactory.chosenCards[i * this.cards[i].length + j];
				this.cards[i][j] = card;
				this.cards[i][j].moveSpriteToXY(baseX + this.cards[i][j].width * j, baseY + this.cards[i][j].height * i);

				FlxMouseEvent.add(this.cards[i][j], _onCardChoice);
				add(this.cards[i][j]);
			}
		}
	}


	/* EVENT LISTENERS */
	
	private function _onClickBack()
	{
		FlxG.mouse.cursor.transform.colorTransform = new ColorTransform();
		FlxG.switchState(() -> new MainMenu());
	}

	private function _onCardChoice(card:Card)
	{
		if (currentPlayer == 1)
		{
			if (p1Cards.length < 7) {
				p1Cards.push(card);

				card.y = p1Area.y + UserInterfaceUtil.MARGIN + ((p1Cards.length - 1) * card.height);
				card.x = textP1.x;
				_switchPlayers();
			}
		} else {
			if (p2Cards.length < 7) {
				p2Cards.push(card);

				card.y = p2Area.y + UserInterfaceUtil.MARGIN + ((p2Cards.length - 1) * card.height);
				card.x = textP2.x;
				_switchPlayers();
			} 
		}

			
		if (p1Cards.length >= 7 && p2Cards.length >= 7) {
			FlxG.mouse.cursor.transform.colorTransform = new ColorTransform();
			FlxMouseEvent.removeAll();
		}
	}
}
