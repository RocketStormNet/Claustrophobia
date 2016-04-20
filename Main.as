package
{
	import org.flixel.*;
	import com.newgrounds.components.*;
	
	
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	
	public class Main extends FlxGame 
	{
		public function Main():void 
		{
			super(320, 240, MenuState, 2, 50, 50);
			
			var medalPopup:MedalPopup = new MedalPopup();
            medalPopup.x = 380;
			medalPopup.y = 400;
            addChild(medalPopup);
		}
	}
}
