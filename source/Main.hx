package;

import cards.CardFactory;
import flixel.FlxGame;

import openfl.Assets;
import openfl.display.Sprite;


class Main extends Sprite
{
	/**
	 * Since we do not need to regenerate the card factory every single time,
	 * we can generate it once here.
	 */
	public static var cardFactory:CardFactory;

	public function new()
	{
		super();
		
		Assets.loadText(AssetPaths.attributes__xml).onComplete(function(data) {
			cardFactory = new CardFactory(data);
			addChild(new FlxGame(0, 0, states.MainMenu, 60, 60, true, false));
		});
	}
}
