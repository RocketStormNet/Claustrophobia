package src
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		[Embed(source = "/src/player.png")]
		private var ImgPlayer:Class;
		public function Player():void
		{
			super(200, 200, ImgPlayer);
		}
		override public function update():void
		{
			velocity.x = 0;
			velocity.y = 0;
		
			if (FlxG.keys.LEFT)
			{
				velocity.x = -150;
			}
			else if (FlxG.keys.RIGHT)
			{
				velocity.x = 150;
			}
			if (FlxG.keys.UP)
			{
				velocity.y = -150;
			}
			else if (FlxG.keys.DOWN)
			{
				velocity.y = 150;
			}
			if (x > 630)
			{
				x = 630;
			}
			else if (x < 2)
			{
				x = 2;
			}
			if (y > 470)
			{
				y = 470;
			}
			else if (y < 2)
			{
				y = 2;
			}
			super.update();
		}
		public function getPlayerPosition():FlxPoint
		{
			var p:FlxPoint = new FlxPoint(x, y);
			return p;
		}
	}
}