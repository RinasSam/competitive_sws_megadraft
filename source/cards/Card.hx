/*
 * Copyright 2025 RinasSam
 * 
 * Licensed under the Apache License; Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing; software
 * distributed under the License is distributed on an "AS IS" BASIS;
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND; either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 *
 * Card.hx: Basic card class.
 */


package cards;


import flixel.FlxSprite;


/**
 * Card attributes.
 */
enum Attributes {
	DAMAGE_HEAVY;
	DAMAGE_LIGHT;
	DAMAGE_SPLASH;
	SUPPORT;
	MYTHIC;
	GENERAL_FRONTLINE;
	ENCHANTMENT_DEFENSE;
	ENCHANTMENT_TOWER;
	ENCHANTMENT_ECONOMY;
	ENCHANTMENT_MISC;
	SPELL_LIGHT;
	SPELL_HEAVY;
}


/**
 * Card sprites.
 */
class Card extends FlxSprite {

	public var attributes:Array<Attributes>;
	public var name:String;

	public function new(attribs:Array<Attributes>, name:String = null, graphic:flixel.system.FlxAssets.FlxGraphicAsset = null)
	{
		super();

		this.attributes = attribs;
		this.name = name;
		
		if (graphic != null) {
			this.loadGraphic(graphic);
			this.scaleTo(0.30);
		}
	}

	public function moveSpriteToXY(x:Float, y:Float)
	{
		this.x = x;
		this.y = y;
	}

	public function scaleTo(scale:Float)
	{
		this.scale.set(scale, scale);
		this.updateHitbox();
	}
}