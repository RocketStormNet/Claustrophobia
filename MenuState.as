package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	public class MenuState extends FlxState 
	{
		private const TILE_WIDTH:uint = 8;
		private const TILE_HEIGHT:uint = 8;
		[Embed(source = "src/klaus2.mp3")]private var sound:Class;
		[Embed(source = "src/start.png")] private var imgStart:Class;
		[Embed(source = "src/bullet.png")] private var imgBullet:Class;
		[Embed(source = "src/enemy.png")] private var imgEnemy:Class;
		[Embed(source = "src/player.png")] private var imgPlayer:Class;
		[Embed(source = 'src/menu.txt', mimeType = "application/octet-stream")] private var _dataMap:Class;
		[Embed(source = "src/auto_tiles.png")] static public var _imgTiles:Class;
		private var enemy, enemy2, enemy3, enemy4,enemy5, enemy6:FlxSprite;
		private var bul, bul2, bul3, bul4, bul5, bul6:FlxSprite;
		private var player:FlxSprite;
		private var _map:FlxTilemap;
		//private var t:FlxText;
		private var t:FlxButton;
		override public function create():void 
		{
			
			//t = new FlxText(0, FlxG.height/2-20, FlxG.width, "START");
			//t.size = 32;
			//t.alignment = "center";
			//add(t);
			enemy = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgEnemy);
			enemy2 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgEnemy);
			enemy3 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgEnemy);
			enemy4 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgEnemy);
			enemy5 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgEnemy);
			enemy6 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgEnemy);
			add(enemy); add(enemy2); add(enemy3); add(enemy4); add(enemy5); add(enemy6);
			bul = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgBullet);
			bul2 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgBullet);
			bul3 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgBullet);
			bul4 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgBullet);
			bul5 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgBullet);
			bul6 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgBullet);
			add(bul); add(bul2); add(bul3); add(bul4); add(bul5); add(bul6);
			player = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(20, 220), imgPlayer);
			add(player);
			player.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200));
			enemy.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); enemy2.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); enemy3.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); enemy4.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); enemy5.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); enemy6.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200));
			bul.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); bul2.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); bul3.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); bul4.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); bul5.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200)); bul6.velocity = new FlxPoint(FlxMath.rand(50, 200), FlxMath.rand(50, 200));
			player.elasticity = 1;
			enemy.elasticity = 1; enemy2.elasticity = 1; enemy3.elasticity = 1; enemy4.elasticity = 1; enemy5.elasticity = 1; enemy6.elasticity = 1;
			bul.elasticity = 1; bul2.elasticity = 1; bul3.elasticity = 1; bul4.elasticity = 1; bul5.elasticity = 1; bul6.elasticity = 1;
			_map = new FlxTilemap();
			_map.loadMap(new _dataMap(),_imgTiles,TILE_WIDTH, TILE_HEIGHT,FlxTilemap.AUTO);
			add(_map);
			FlxG.playMusic(sound);
			FlxG.mouse.show();
			t = new FlxButton(37, 35, "", gotoRoom);
			t.loadGraphic(imgStart);
			add(t);
			var text3:FlxText;
			text3 = new FlxText(FlxG.width / 2 - 125, FlxG.height / 3 + 5, 500, "Programming, graphics: Michael.\nAdditional programming, music, graphics: neocrey.\nUse your arrow keys to manipulate blue ball.\nAvoid collising with green balls,\nred balls and red moving squares.\nGet bonuses, earn big scores and some medals!\n\nPress SPACE to start new game.");
			text3.alignment = "left";
			text3.color = 0xFFFFFF;
			text3.size = 8;
			add(text3);
			var text2:FlxText;
			text2 = new FlxText(FlxG.width / 2 - 250, FlxG.height / 3 + 115, 500, "neocrey & Michael (c) 2012 http://neocrey.newgrounds.com");
			text2.alignment = "center";
			text2.color = 0xFFFFFF;
			text2.size = 8;
			add(text2);
			
		}
		override public function update():void
		{
			FlxG.collide(enemy, _map);FlxG.collide(enemy2, _map);FlxG.collide(enemy3, _map);FlxG.collide(enemy4, _map);FlxG.collide(enemy5, _map);FlxG.collide(enemy6, _map);FlxG.collide(bul, _map);FlxG.collide(bul2, _map);FlxG.collide(bul3, _map);FlxG.collide(bul4, _map);FlxG.collide(bul5, _map);FlxG.collide(bul6, _map);FlxG.collide(player, _map);
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.fade(0xff000000, 0.3, gotoRoom);
			}
			super.update();
			
		}
		
		protected function gotoRoom():void
		{
			FlxG.pauseSounds();
			FlxG.switchState(new PlayState());

		}
	}

}