/*
 * Copyright 2025 RinasSam
 * 
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 *
 * GuideMenu.hx: Guide menu.
 */


package states;


import cards.Card.Attributes;

import flixel.addons.ui.FlxUIButton;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

import util.UserInterfaceUtil;


class GuideMenu extends FlxState {

	private var buttonBack:FlxUIButton;
	private var textCenter:FlxText;
	private var textGuide:FlxText;
	
	override public function create()
	{
		super.create();

		_initTexts();	
		_initCards();

		this.buttonBack = UserInterfaceUtil.createButton('BACK', 16, 2, _onClickBack);
		this.buttonBack.y = this.textGuide.y + this.textGuide.height + UserInterfaceUtil.MARGIN * 2;
		this.add(this.buttonBack);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function _initTexts()
	{
		this.textCenter = UserInterfaceUtil.createText(0, UserInterfaceUtil.MARGIN, UserInterfaceUtil.SCREEN_WIDTH - UserInterfaceUtil.MARGIN * 4, 12, "Card Categories and Options:\n\n");
		this.textCenter.screenCenter(X);
		this.add(this.textCenter);

		var totalCards:Int = 0;
		for (att in Main.cardFactory.mapAttributePool) {
			totalCards += att;
		}

		var text:String = 'Heavy Damage Unit (${Main.cardFactory.mapAttributePool[DAMAGE_HEAVY]} available):\n\n' +
						  'Light Damage Unit (${Main.cardFactory.mapAttributePool[DAMAGE_LIGHT]} available):\n\n' +
						  'Splash Damage Unit (${Main.cardFactory.mapAttributePool[DAMAGE_SPLASH]} available):\n\n' +
						  'Support Unit (${Main.cardFactory.mapAttributePool[SUPPORT]} available):\n\n' +
						  'Anti-Backline/Frontline General (${Main.cardFactory.mapAttributePool[GENERAL_FRONTLINE]} available):\n\n' +
						  'Mythics (${Main.cardFactory.mapAttributePool[MYTHIC]} available):\n\n' +
						  'Defense Enchantment (${Main.cardFactory.mapAttributePool[ENCHANTMENT_DEFENSE]} available):\n\n' +
						  'Tower Enchantment (${Main.cardFactory.mapAttributePool[ENCHANTMENT_TOWER]} available):\n\n' +
						  'Economy Enchantments (${Main.cardFactory.mapAttributePool[ENCHANTMENT_ECONOMY]} available):\n\n' +
						  'Magic/Filler Enchantments (${Main.cardFactory.mapAttributePool[ENCHANTMENT_MISC]} available):\n\n' +
						  'Light Spells (${Main.cardFactory.mapAttributePool[SPELL_LIGHT]} available):\n\n' +
						  'Heavy Spells (${Main.cardFactory.mapAttributePool[SPELL_HEAVY]} available):\n\n' +
						  'Total cards per pool: ${totalCards}.';

		this.textGuide = UserInterfaceUtil.createText(0, this.textCenter.y + this.textCenter.height, UserInterfaceUtil.SCREEN_WIDTH - UserInterfaceUtil.MARGIN * 4, 12, text, false);
		this.add(this.textGuide);
	}

	private function _initCards()
	{
		/* Necessary to do this because the text supplied above is ordered. */
		var attributeArray:Array<Attributes> = [
			DAMAGE_HEAVY,
			DAMAGE_LIGHT,
			DAMAGE_SPLASH,
			SUPPORT,
			GENERAL_FRONTLINE,
			MYTHIC,
			ENCHANTMENT_DEFENSE,
			ENCHANTMENT_TOWER,
			ENCHANTMENT_ECONOMY,
			ENCHANTMENT_MISC,
			SPELL_LIGHT,
			SPELL_HEAVY];

		var scale:Float = 0.15 * UserInterfaceUtil.SCALE;
		var baseX:Float = (this.textCenter.x + UserInterfaceUtil.MARGIN * 10) * (1 / scale);
		baseX *= UserInterfaceUtil.SCALE;
		var baseY:Float = this.textGuide.y;

		/* If we do not do this, nothing works for some reason. */
		Main.cardFactory.initCards();

		var i:Int = 0;
		for (att in 0 ... attributeArray.length) {
			var j:Int = 0;
			for (card in Main.cardFactory.mapCards[attributeArray[att]]) {
				card.scaleTo(scale);
				card.moveSpriteToXY(baseX + j * card.width, baseY + i * card.height);
				this.add(card);
				j++;
			}

			i++;
		}
	}

	/* EVENT LISTENERS */

	private function _onClickBack()
	{
		FlxG.switchState(() -> new MainMenu());
	}
}