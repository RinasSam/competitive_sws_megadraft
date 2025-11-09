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
 * UserInterfaceUtil.hx: A collection of utility function and values for the UI.
 */


package util;

import flixel.addons.ui.FlxUIButton;
import flixel.util.FlxColor;


class UserInterfaceUtil {

	public static final MARGIN:Int = 5;
	public static final SCREEN_WIDTH:Int = 640;
	public static final SCREEN_HEIGHT:Int = 480;

	public static function createButton(label:String, fontSize:Int, scale:Float, onClick:Void->Void, isCentered:Bool = true) : FlxUIButton
	{
		var button:FlxUIButton = new FlxUIButton(0, 0, label, onClick);
		button.scale.set(scale, scale);
		button.updateHitbox();
		button.setLabelFormat(null, fontSize, FlxColor.BLACK);
		button.autoCenterLabel();

		if(isCentered) {
			button.screenCenter();
		}

		return button;
	}
}