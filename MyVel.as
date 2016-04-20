package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class MyVel 
	{
		
		public static function moveTowardsObject(source:FlxPoint, dest:FlxPoint, speed:int = 60, maxTime:int = 0):FlxPoint
		{
			var a:Number = MyAngkle.angleBetweenP(source, dest);
			var t:FlxPoint = new FlxPoint();
			/*if (maxTime > 0)
			{
				var d:int = distanceBetween(source, dest);
				
				//	We know how many pixels we need to move, but how fast?
				speed = d / (maxTime / 1000);
			}*/
			
			t.x = Math.cos(a) * speed;
			t.y = Math.sin(a) * speed;
			return t;
		}
		
	}

}