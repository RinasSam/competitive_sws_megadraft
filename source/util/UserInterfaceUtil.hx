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
import flixel.text.FlxText;
import flixel.util.FlxColor;


class UserInterfaceUtil {

	/* We'll need this to resize everything proper. */
	public static final SCALE:Float = 3/2;

	public static final MARGIN:Float = 5 * SCALE;
	public static final SCREEN_WIDTH:Int = Std.int(640 * SCALE);
	public static final SCREEN_HEIGHT:Int = Std.int(480 * SCALE);


	public static function createButton(label:String, fontSize:Int, scale:Float, onClick:Void->Void, isCentered:Bool = true) : FlxUIButton
	{
		/* Makes life easier. */
		scale *= SCALE;
		fontSize = Math.floor(fontSize * SCALE);

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

	public static function createText(x:Float, y:Float, width:Float, fontSize:Int, text:String, centered:Bool = true)
	{
		fontSize = Math.floor(fontSize * SCALE);

		var text:FlxText = new FlxText(x, y, width, text, fontSize);
		if (centered) {
			text.alignment = CENTER;
		}

		return text;
	}
}