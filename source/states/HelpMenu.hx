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
 * HelpMenu.hx: Help menu.
 */


package states;


import flixel.addons.ui.FlxUIButton;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

import util.UserInterfaceUtil;


class HelpMenu extends FlxState {

	var buttonBack:FlxUIButton;
	var textHelp:FlxText;
	
	override public function create()
	{
		super.create();

		_initTexts();	

		this.buttonBack = UserInterfaceUtil.createButton("BACK", 16, 2, _onClickBack);
		this.buttonBack.y = this.textHelp.y + this.textHelp.height + UserInterfaceUtil.MARGIN * 5;
		this.add(this.buttonBack);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function _initTexts()
	{

		var text:String = "Welcome to the Competitive SWS Megadraft Application!\n\n" + 
						  "You can use this play Megadraft in Stick War: Saga with your friends.\n" +
						  "To get started, press the \'NEW\' button in the main menu, and a randomly generated draft pool will be created. " +
						  "Afterwards, you and your opponent get to choose cards by clicking on the card icons.\n\n\n" + 
						  "Credits:\nConcept: CivilBreak\nProgramming: RinasSam\nAssets: MaxGames\n\n\n\n"+
						  "This app is not developed nor officially endorsed by MaxGames.\n\n\nMade with HaxeFlixel.";

		this.textHelp = UserInterfaceUtil.createText(0, UserInterfaceUtil.MARGIN * -5, UserInterfaceUtil.SCREEN_WIDTH - UserInterfaceUtil.MARGIN * 4, 12, text);
		this.textHelp.screenCenter();
		this.add(this.textHelp);
	}

	/* EVENT LISTENERS */

	private function _onClickBack()
	{
		FlxG.switchState(() -> new MainMenu());
	}
}