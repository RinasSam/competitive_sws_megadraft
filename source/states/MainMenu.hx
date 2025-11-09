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
 * MainMenu.hx: Main menu.
 */


package states;


import flixel.addons.ui.FlxUIButton;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

import util.UserInterfaceUtil;


class MainMenu extends FlxState
{

	private var buttonHelp:FlxUIButton;
	private var buttonGuide:FlxUIButton;
	private var buttonNew:FlxUIButton;

	private var textTitle:FlxText;
	private var spriteBackground:FlxSprite;
	private var spriteBackground2:FlxSprite;
	
	override public function create()
	{
		super.create();

		_initBackground();
		_initTexts();
		_initButtons();
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
		this.textTitle = new FlxText(0, 0, UserInterfaceUtil.SCREEN_WIDTH - UserInterfaceUtil.MARGIN * 4);
		this.textTitle.text = "CompetitiveSWS\nMEGADRAFT";
		this.textTitle.size = 60;
		this.textTitle.alignment = FlxTextAlign.CENTER;
		this.textTitle.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 5, 1);
		this.textTitle.screenCenter(X);
		this.textTitle.y += UserInterfaceUtil.MARGIN * 4;
		this.add(this.textTitle);
	}

	private function _initButtons()
	{	
		this.buttonNew = UserInterfaceUtil.createButton("NEW", 16, 2, _onClickNew); 
		this.buttonNew.y += UserInterfaceUtil.MARGIN * 5;
		this.add(this.buttonNew);

		this.buttonHelp = UserInterfaceUtil.createButton("HELP", 16, 2, _onClickHelp);
		this.buttonHelp.y = this.buttonNew.y + this.buttonNew.height + UserInterfaceUtil.MARGIN;
		this.add(this.buttonHelp);

		this.buttonGuide = UserInterfaceUtil.createButton("GUIDE", 16, 2, _onClickGuide);
		this.buttonGuide.y = this.buttonHelp.y + this.buttonHelp.height + UserInterfaceUtil.MARGIN;
		this.add(this.buttonGuide);
	}


	/* EVENT LISTENERS */
	
	private function _onClickHelp()
	{
		FlxG.switchState(() -> new HelpMenu());
	}
	
	private function _onClickNew()
	{
		FlxG.switchState(() -> new DraftMenu());
	}

	private function _onClickGuide()
	{
		FlxG.switchState(() -> new GuideMenu());
	}
}
