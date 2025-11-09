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
 * CardFactory.hx: What creates all the cards.
 */


package cards;


import cards.Card.Attributes;


class CardFactory {

	/* The cards mapped to their attributes. */
	public var mapCards:Map<Attributes, Array<Card>>;

	/* The amount of cards allowed per attribute. */
	public var mapAttributePool:Map<Attributes, Int>;

	/* Which 36 cards shall we choose? */
	public var chosenCards:Array<Card>;

	public function new()
	{
		_initAttributePool();
		_initCards();
	}


	public function generateCardPool()
	{
		this.chosenCards = new Array<Card>();	
		var card:Card;

		for (attrib in Type.allEnums(Attributes)) {

			for (i in 0 ... mapAttributePool[attrib]) {
				card = mapCards[attrib].splice(Math.floor(Math.random() * mapCards[attrib].length), 1)[0];
				chosenCards.push(card);
			}
		}
	}

	private function _initCards()
	{
		mapCards = new Map<Attributes, Array<Card>>();
		
		for (attribute in Type.allEnums(Attributes))
		{
			mapCards[attribute] = new Array<Card>();
		}


		this.mapCards[DAMAGE_HEAVY].push(new Card([DAMAGE_HEAVY], "Dead", AssetPaths.Dead__png));
		this.mapCards[DAMAGE_HEAVY].push(new Card([DAMAGE_HEAVY], "Giant", AssetPaths.Giant__png));
		this.mapCards[DAMAGE_HEAVY].push(new Card([DAMAGE_HEAVY], "Juggerknight", AssetPaths.Juggerknight__png));
		this.mapCards[DAMAGE_HEAVY].push(new Card([DAMAGE_HEAVY], "Riprider", AssetPaths.Riprider__png));
		this.mapCards[DAMAGE_HEAVY].push(new Card([DAMAGE_HEAVY], "Swordwrath", AssetPaths.Swordwrath__png));
		this.mapCards[DAMAGE_HEAVY].push(new Card([DAMAGE_HEAVY], "Toxic Dead", AssetPaths.Toxic_Dead__png));

		this.mapCards[DAMAGE_LIGHT].push(new Card([DAMAGE_LIGHT], "Archidon", AssetPaths.Archidon__png));
		this.mapCards[DAMAGE_LIGHT].push(new Card([DAMAGE_LIGHT], "Crawler", AssetPaths.Crawler__png));
		this.mapCards[DAMAGE_LIGHT].push(new Card([DAMAGE_LIGHT], "Eclipsor", AssetPaths.Eclipsor__png));
		this.mapCards[DAMAGE_LIGHT].push(new Card([DAMAGE_LIGHT], "Enslaved Giant", AssetPaths.Enslaved_Giant__png));
		this.mapCards[DAMAGE_LIGHT].push(new Card([DAMAGE_LIGHT], "Shadowrath", AssetPaths.Shadowrath__png));
		this.mapCards[DAMAGE_LIGHT].push(new Card([DAMAGE_LIGHT], "Spearton", AssetPaths.Spear__png));

		this.mapCards[DAMAGE_SPLASH].push(new Card([DAMAGE_SPLASH], "Bomber", AssetPaths.Bomber__png));
		this.mapCards[DAMAGE_SPLASH].push(new Card([DAMAGE_SPLASH], "Magikill", AssetPaths.Magikill__png));
		this.mapCards[DAMAGE_SPLASH].push(new Card([DAMAGE_SPLASH], "Magis", AssetPaths.Magis__png));
		this.mapCards[DAMAGE_SPLASH].push(new Card([DAMAGE_SPLASH], "Marrowkai", AssetPaths.Marrowkai__png));
		this.mapCards[DAMAGE_SPLASH].push(new Card([DAMAGE_SPLASH], "Sicklebear", AssetPaths.Sicklebear__png));
		this.mapCards[DAMAGE_SPLASH].push(new Card([DAMAGE_SPLASH], "Sicklewrath", AssetPaths.Sicklewrath__png));

		this.mapCards[SUPPORT].push(new Card([SUPPORT], "King Zarek", AssetPaths.King_Zarek__png));
		this.mapCards[SUPPORT].push(new Card([SUPPORT], "Meric", AssetPaths.Meric__png));
		this.mapCards[SUPPORT].push(new Card([SUPPORT], "Thera", AssetPaths.Thera__png));

		this.mapCards[GENERAL_FRONTLINE].push(new Card([GENERAL_FRONTLINE], "Archis", AssetPaths.Archis__png));
		this.mapCards[GENERAL_FRONTLINE].push(new Card([GENERAL_FRONTLINE], "Atreyos", AssetPaths.Atreyos__png));
		this.mapCards[GENERAL_FRONTLINE].push(new Card([GENERAL_FRONTLINE], "Kytchu", AssetPaths.Kytchu__png));
		this.mapCards[GENERAL_FRONTLINE].push(new Card([GENERAL_FRONTLINE], "Spearos", AssetPaths.Spearos__png));
		this.mapCards[GENERAL_FRONTLINE].push(new Card([GENERAL_FRONTLINE], "Wrathnar", AssetPaths.Wrathnar__png));
		this.mapCards[GENERAL_FRONTLINE].push(new Card([GENERAL_FRONTLINE], "Xiphos", AssetPaths.Xiphos__png));

		this.mapCards[MYTHIC].push(new Card([MYTHIC], "Blazing Bolts", AssetPaths.Blazing_Bolts__png));
		this.mapCards[MYTHIC].push(new Card([MYTHIC], "Control Whip", AssetPaths.Control_Whip__png));
		this.mapCards[MYTHIC].push(new Card([MYTHIC], "Glacial Fletching", AssetPaths.Glacial__png));
		this.mapCards[MYTHIC].push(new Card([MYTHIC], "Vampiric Soul", AssetPaths.Vamp__png));
		this.mapCards[MYTHIC].push(new Card([MYTHIC], "Vault of Prudence", AssetPaths.Vault__png));
		this.mapCards[MYTHIC].push(new Card([MYTHIC], "Voltaic Armour", AssetPaths.Voltaic_Armor__png));
		this.mapCards[MYTHIC].push(new Card([MYTHIC], "Voltaic Spark", AssetPaths.Voltaic_Spark__png));

		this.mapCards[ENCHANTMENT_DEFENSE].push(new Card([ENCHANTMENT_DEFENSE], "Boyers Trap", AssetPaths.Boyers__png));
		this.mapCards[ENCHANTMENT_DEFENSE].push(new Card([ENCHANTMENT_DEFENSE], "Castle Archidon", AssetPaths.Castle_Archidon__png));
		this.mapCards[ENCHANTMENT_DEFENSE].push(new Card([ENCHANTMENT_DEFENSE], "Mining Engineer", AssetPaths.Miner_Wall__png));

		this.mapCards[ENCHANTMENT_TOWER].push(new Card([ENCHANTMENT_TOWER], "Spirit Deads", AssetPaths.Spirit_Deads__png));
		this.mapCards[ENCHANTMENT_TOWER].push(new Card([ENCHANTMENT_TOWER], "Spiritons", AssetPaths.Spirtions__png));
		this.mapCards[ENCHANTMENT_TOWER].push(new Card([ENCHANTMENT_TOWER], "Secret Tunnel", AssetPaths.Tunnel__png));

		this.mapCards[ENCHANTMENT_ECONOMY].push(new Card([ENCHANTMENT_ECONOMY], "Brilliance", AssetPaths.Brilliance__png));
		this.mapCards[ENCHANTMENT_ECONOMY].push(new Card([ENCHANTMENT_ECONOMY], "Magikill Guild", AssetPaths.Magikill_Guild__png));
		this.mapCards[ENCHANTMENT_ECONOMY].push(new Card([ENCHANTMENT_ECONOMY], "Miner Upgrade", AssetPaths.Miner_Upgrade__png));
		this.mapCards[ENCHANTMENT_ECONOMY].push(new Card([ENCHANTMENT_ECONOMY], "Salvagers Smithy", AssetPaths.Smithy__png));

		this.mapCards[ENCHANTMENT_MISC].push(new Card([ENCHANTMENT_MISC], "Enchanted Pike", AssetPaths.Pike__png));
		this.mapCards[ENCHANTMENT_MISC].push(new Card([ENCHANTMENT_MISC], "Grasp of Zilaros", AssetPaths.Grasp_of_Zilaros__png));
		this.mapCards[ENCHANTMENT_MISC].push(new Card([ENCHANTMENT_MISC], "Mana Burst", AssetPaths.Manaburst__png));
		this.mapCards[ENCHANTMENT_MISC].push(new Card([ENCHANTMENT_MISC], "Monstrosity", AssetPaths.Giant_Upgrade__png));
		this.mapCards[ENCHANTMENT_MISC].push(new Card([ENCHANTMENT_MISC], "Rune of Reanimation", AssetPaths.Rune_of_Reanimation__png));
		this.mapCards[ENCHANTMENT_MISC].push(new Card([ENCHANTMENT_MISC], "Summoning Staff", AssetPaths.Summoning_Staff__png));
		this.mapCards[ENCHANTMENT_MISC].push(new Card([ENCHANTMENT_MISC], "Toxic Totality", AssetPaths.Toxic_Upgrade__png));

		this.mapCards[SPELL_LIGHT].push(new Card([SPELL_LIGHT], "Illuminate", AssetPaths.Reveal__png));
		this.mapCards[SPELL_LIGHT].push(new Card([SPELL_LIGHT], "Miner Hustle", AssetPaths.Hustle__png));
		this.mapCards[SPELL_LIGHT].push(new Card([SPELL_LIGHT], "Rage", AssetPaths.Rage__png));
		this.mapCards[SPELL_LIGHT].push(new Card([SPELL_LIGHT], "Summoners Toll", AssetPaths.Summoners_Toll__png));
		this.mapCards[SPELL_LIGHT].push(new Card([SPELL_LIGHT], "Surge", AssetPaths.Surge__png));
		this.mapCards[SPELL_LIGHT].push(new Card([SPELL_LIGHT], "Tesla", AssetPaths.Tesla__png));

		this.mapCards[SPELL_HEAVY].push(new Card([SPELL_HEAVY], "Acid Rain", AssetPaths.Acid_Rain__png));
		this.mapCards[SPELL_HEAVY].push(new Card([SPELL_HEAVY], "Double Edged", AssetPaths.Double_Edged__png));
		this.mapCards[SPELL_HEAVY].push(new Card([SPELL_HEAVY], "Healing Ward", AssetPaths.Healing_Ward__png));
		this.mapCards[SPELL_HEAVY].push(new Card([SPELL_HEAVY], "Heavy Healing Wisp", AssetPaths.HHW__png));
		this.mapCards[SPELL_HEAVY].push(new Card([SPELL_HEAVY], "Lightning Storm", AssetPaths.Storm__png));
		this.mapCards[SPELL_HEAVY].push(new Card([SPELL_HEAVY], "Projectile Barrier", AssetPaths.Bubble__png));
		this.mapCards[SPELL_HEAVY].push(new Card([SPELL_HEAVY], "Scorch", AssetPaths.Scorch__png));
		this.mapCards[SPELL_HEAVY].push(new Card([SPELL_HEAVY], "Snow Squall", AssetPaths.Snow__png));
	}


	/**
	 * Basically how many of each attribute is allowed.
	 */
	private function _initAttributePool()
	{
		this.mapAttributePool = new Map<Attributes, Int>();

		this.mapAttributePool[DAMAGE_HEAVY] = 4;
		this.mapAttributePool[DAMAGE_LIGHT] = 4;
		this.mapAttributePool[DAMAGE_SPLASH] = 4;
		this.mapAttributePool[SUPPORT] = 1;
		this.mapAttributePool[MYTHIC] = 4;
		this.mapAttributePool[GENERAL_FRONTLINE] = 4;
		this.mapAttributePool[ENCHANTMENT_DEFENSE] = 1;
		this.mapAttributePool[ENCHANTMENT_TOWER] = 1;
		this.mapAttributePool[ENCHANTMENT_ECONOMY] = 2;
		this.mapAttributePool[ENCHANTMENT_MISC] = 4;
		this.mapAttributePool[SPELL_LIGHT] = 3;
		this.mapAttributePool[SPELL_HEAVY] = 4;
	}
}
