package src
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import src.AssetsRegistry;
	
	public class Bullet extends FlxState
	{
		private var bullet:FlxWeapon;
		[Embed(source = "bullet.png")] public static var chunkPNG:Class;
		public function Bullet(x:Number,y:Number,angle:Number,vel:FlxPoint,plX:Number,plY:Number):void 
		{
			FlxG.height = 480;
			FlxG.width = 640;
			//super(x, y, imgBullet);
			//velocity = vel;
			bullet = new FlxWeapon("bullet");
			
			//	Tell the weapon to create 50 bullets using the chunkPNG image.
			bullet.makeImageBullet(50, chunkPNG);
			
			//	This weapon will fire from a fixed (stationary) position
			bullet.setFiringPosition(x,y,12,12);
			
			//	As we use the mouse to fire we need to limit how many bullets are shot at once (1 every 200ms)
			//bullet.setFireRate(200);
			
			//	Bullets will move at 200px/sec
			bullet.setBulletSpeed(200);
			
			//	And have a fixed lifespan of 2 seconds
			bullet.setBulletLifeSpan(0);
			
			//	You can also set a variance in the lifespan using this function:
			//	The below will set the lifespan to be +- 1 second
			//lazer.setBulletRandomFactor(0, 0, null, 1000);
			
			//	Just makes the bullets bounce (Rubber bullets)
			bullet.setBulletElasticity(1);
			bullet.fireAtPosition(plX, plY);
			add(bullet.group);
		}
		
	}
}