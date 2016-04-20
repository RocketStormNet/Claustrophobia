package  
{
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.*;
	public class MyAngkle 
	{
		
		public static function angleBetweenP(a:FlxPoint, target:FlxPoint, asDegrees:Boolean = false):Number
        {
			var dx:Number = (target.x) - (a.x);
			var dy:Number = (target.y) - (a.y);
			
			if (asDegrees)
			{
				return FlxMath.asDegrees(Math.atan2(dy, dx));
			}
			else
			{
				return Math.atan2(dy, dx);
			}
        }
		
	}

}