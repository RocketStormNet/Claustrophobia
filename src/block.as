package src 
{
	import org.flixel.*;
	import PlayState;
	public class block extends FlxSprite
	{
		
		[Embed(source = "block.png")]public static var imgBlock:Class;
		public function block(x:Number,y:Number,vel:FlxPoint,map:FlxTilemap) 
		{
			
			super(x, y, imgBlock);
			velocity = vel;
			/*if (FlxG.collide(block,map))
			{
				velocity.x = -velocity.x;
			}*/
			elasticity = 1;
			
		}
		override public function update():void
		{
			
		}
		
	}

}