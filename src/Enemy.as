package src 
{
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.*;
	import MyVel;
	import src.Player;
	public class Enemy extends FlxSprite
	{
		[Embed(source = "/src/enemy.png")]
		private var imgEnemy:Class;
		public function Enemy(x:Number,y:Number):void 
		{
			super(x, y, imgEnemy);
			
		}
		
		/*override public function update():void
		{
			var p:FlxPoint;
			var t:FlxPoint;
			p = getEnemyPosition();
			
			t = MyVel.moveTowardsObject(p, pp);
			velocity.x = t.x;
			velocity.y = t.y;
			super.update();
		}*/
		public function getEnemyPosition():FlxPoint
		{
			var p:FlxPoint = new FlxPoint(x, y);
			return p;
		}
	}

}