package 
{
	import org.flixel.*;
	import src.*;
	import org.flixel.plugin.photonstorm.*;
	import com.newgrounds.API;
	import MyAngkle;			//calculate angle
	public class PlayState extends FlxState
	{
		[Embed(source = "src/gamesound.mp3")]private var gs:Class;
		[Embed(source = "src/powerup.mp3")]private var pus:Class;
		[Embed(source = "src/hit.mp3")]private var hs:Class;
		private const TILE_WIDTH:uint = 8;
		private const TILE_HEIGHT:uint = 8;
		
		private var _player:FlxSprite;
		private var player:FlxGroup;
		private var _enemy:FlxGroup;
		private var enemy:FlxSprite;private var enemy2:FlxSprite;private var enemy3:FlxSprite;private var enemy4:FlxSprite;
		private var _spawnTimer:Number=-1;
		private var _spawnInterval:Number = 3.5;
		private var _spawnPU:Number = -1; 		//for PowerUp
		private var _spawnPUdef:Number = 5;		//default power up timer
		private var _scoreText: FlxText;
		private var _gameOverText: FlxText;
		private var _map:FlxTilemap;
		private var _bullet:FlxGroup;
		private var _block:FlxGroup;
		private var _tiles:FlxSprite;
		private var _path:FlxPath;				//for player following
		private var _powerUp:FlxSprite;
		private var _powerUp2:FlxSprite;
		[Embed(source = "src/auto_tiles.png")] static public var _imgTiles:Class;
		[Embed(source = 'src/level.txt',mimeType="application/octet-stream")] private var _dataMap:Class;
		[Embed(source = "/src/enemy.png")] private var imgEnemy:Class;
		[Embed(source = "/src/player.png")] private var imgPlayer:Class;
		[Embed(source = "src/powerup.png")] private var imgPowerup:Class;
		[Embed(source = "src/powerup2.png")] private var imgPowerup2:Class;
		override public function create():void
		{
			FlxG.bgColor = 0xFF000000;
			FlxG.framerate = 50;		//xz za4em :D
			FlxG.flashFramerate = 50;
			
			FlxG.play(gs, 1, true);
			
			_path = new FlxPath();
			
			_enemy = new FlxGroup();
			add(_enemy);
			enemy = new FlxSprite(FlxMath.rand(500, 576), FlxMath.rand(25, 100), imgEnemy);
			enemy2 = new FlxSprite(FlxMath.rand(250, 300), FlxMath.rand(150, 200), imgEnemy);
			enemy3 = new FlxSprite(FlxMath.rand(20, 300), FlxMath.rand(160, 250), imgEnemy);
			enemy4 = new FlxSprite(FlxMath.rand(500, 600), FlxMath.rand(256, 300), imgEnemy);
			_enemy.add(enemy);
			_enemy.add(enemy2);
			_enemy.add(enemy3);
			_enemy.add(enemy4);
			
			_map = new FlxTilemap();
			_map.loadMap(new _dataMap(), _imgTiles, TILE_WIDTH, TILE_HEIGHT,FlxTilemap.AUTO);
			add(_map);
			
			player = new FlxGroup();
			add(player);
			_player = new FlxSprite(100,50,imgPlayer);
			player.add(_player);
			
			FlxG.camera.setBounds(0, 0, 640, 480,true);
			FlxG.camera.follow(_player);
			
			_bullet = new FlxGroup();
			add(_bullet);
			
			_block = new FlxGroup();
			add(_block);
			
			spawnBlock(360, 200);
			spawnBlock(360, 30);
			spawnBlock(200, 200);
			spawnBlock(100, 360);
			
			FlxG.score = 0;
			_scoreText = new FlxText(220, 0, 100, "0");
			_scoreText.setFormat(null, 16, 0xFFFFFFFF, "right");
			_scoreText.scrollFactor.x = 0;	//state score on display
			_scoreText.scrollFactor.y = 0;
			add(_scoreText);
			
			super.create();
		}
		
		override public function update():void
		{	
			
			FlxG.collide(_enemy, _player, collision);
			FlxG.collide(_enemy, _map);
			FlxG.collide(_bullet, _map);
			FlxG.collide(_block, _map);
			FlxG.collide(_block, _player, collision);
			FlxG.collide(_bullet, _player, collision);
			FlxG.collide(_player, _map);
			FlxG.collide(_enemy, _enemy);
			movetoplayer(enemy);		//follow to player
			movetoplayer(enemy2);
			movetoplayer(enemy3);
			movetoplayer(enemy4);
			
			_spawnTimer -= FlxG.elapsed;
			_spawnPU -= FlxG.elapsed;
			if (_spawnPU < 0)
			{
				if (_powerUp != null)
				{
					_powerUp.kill();
				}
				if (_powerUp2 != null)
				{
					_powerUp2.kill();
				}
				_powerUp = new FlxSprite(FlxMath.rand(20, 620), FlxMath.rand(20, 450), imgPowerup);
				_powerUp2 = new FlxSprite(FlxMath.rand(20, 620), FlxMath.rand(20, 450), imgPowerup2);
				add(_powerUp);
				add(_powerUp2);
				_spawnPU = _spawnPUdef;
			}
			if (FlxG.collide(_player, _powerUp))	
			{
				_bullet.kill();
				_bullet = new FlxGroup();
				add(_bullet);
				_powerUp.kill();
				add(_powerUp);
				FlxG.play(pus, 1, false);
				API.unlockMedal("Phew!");
			}
			if (FlxG.collide(_player, _powerUp2))
			{
				FlxG.score *= 2;
				_powerUp2.kill();
				add(_powerUp2);
				FlxG.play(pus, 1, false);
				API.unlockMedal("Double Score!");
			}
			if (_spawnTimer < 0)
			{
				spawnBullet(enemy);
				spawnBullet(enemy2);
				spawnBullet(enemy3);
				spawnBullet(enemy4);
				resetSpawnTimer();
			}
			
			if (_player.alive == true)
			{
			FlxG.score += 1;
			_scoreText.text = FlxG.score.toString();
			}
			if (FlxG.keys.R && _player.alive == false)
			{
				FlxG.resetState();
				FlxG.width = 320;
				FlxG.height = 240;
			}
			control();
			
			super.update();
			
			if (FlxG.score == 100)
			{
				API.unlockMedal("Not bad");
			}
			
			if (FlxG.score == 250)
			{
				API.unlockMedal("Oh! God!");
			}
			
			if (FlxG.score == 300)
			{
				API.unlockMedal("Forget about fingers");
			}
			
			if (FlxG.score == 500)
			{
				API.unlockMedal("Aaargh! Hot!");
			}
			
			if (FlxG.score == 1000)
			{
				API.unlockMedal("You are the Gamer!");
			}
			
			if (FlxG.score == 2000)
			{
				API.unlockMedal("Two Thousand Milliseconds");
			}
			
			if (FlxG.score == 3000)
			{
				API.unlockMedal("Three Thousand Milliseconds");
			}
			
			if (FlxG.score == 4000)
			{
				API.unlockMedal("Four Thousand Milliseconds");
			}
			
			if (FlxG.score == 5000)
			{
				API.unlockMedal("Claustrophobia Maniac");
			}
		}
		
		private function movetoplayer(enemy:FlxSprite):void
		{
			_path=_map.findPath(new FlxPoint(enemy.x + enemy.width / 2, enemy.y + enemy.height / 2), new FlxPoint(_player.x + _player.width / 2, _player.y + _player.height / 2));
			enemy.followPath(_path,100);
		}
		
		private function resetSpawnTimer():void
		{
			_spawnTimer = _spawnInterval;
			_spawnInterval *= 0.95;
			if (_spawnInterval < 0.1)
			{
				_spawnInterval = 0.1;
			}
		}

		private function collision(enemy:FlxSprite, player:FlxSprite):void
		{
			var finalscore:FlxText;
			FlxG.width = 320;
			FlxG.height = 240;
			FlxG.play(hs, 1, false);
			API.unlockMedal("First kill");
			player.kill();
			_gameOverText = new FlxText(0, FlxG.height/2-50, FlxG.width, "GAME OVER\nPress R to play again\nYour score\n");
			_gameOverText.setFormat(null, 16, 0xFFFFFFFF, "center");
			_gameOverText.scrollFactor.x = 0;
			_gameOverText.scrollFactor.y = 0;
			_scoreText.kill();
			finalscore = new FlxText(0, FlxG.height / 2+25 , FlxG.width, FlxG.score.toString());
			finalscore.setFormat(null, 20, 0xFFFFFFFF, "center");
			finalscore.scrollFactor.x = 0;
			finalscore.scrollFactor.y = 0;
			add(finalscore);
			add(_gameOverText);
		}
		
		private function spawnBullet(enemy:FlxSprite):void
		{
			var b:Bullet;
			var angle:Number;
			var vel:FlxPoint; var en:FlxPoint = new FlxPoint(enemy.x, enemy.y);
			var pl:FlxPoint=new FlxPoint(_player.x, _player.y);
			angle = MyAngkle.angleBetweenP(en, pl, true);
			vel = FlxVelocity.velocityFromAngle(angle, 200);
			b = new Bullet(enemy.x, enemy.y,angle,vel,_player.x,_player.y);
			_bullet.add(b);
		}
		
		public function spawnBlock(x:Number,y:Number):void
		{
			var b:block;
			var vel:FlxPoint;
			vel = new FlxPoint();
			vel.x = 100;
			if (x == 100)
			{
				vel.x = 0;
				vel.y = 100;
			}
			b = new block(x, y, vel, _map);
			_block.add(b);
		}
		
		public function control():void
		{
			_player.velocity.x = 0;
			_player.velocity.y = 0;
			
			if (FlxG.keys.LEFT)
			{
				_player.velocity.x = -150;
			}
			else if (FlxG.keys.RIGHT)
			{
				_player.velocity.x = 150;
			}
			if (FlxG.keys.UP)
			{
				_player.velocity.y = -150;
			}
			else if (FlxG.keys.DOWN)
			{
				_player.velocity.y = 150;
			}
			if (_player.x > 630)
			{
				_player.x = 630;
			}
			else if (_player.x < 2)
			{
				_player.x = 2;
			}
			if (_player.y > 470)
			{
				_player.y = 470;
			}
			else if (_player.y < 2)
			{
				_player.y = 2;
			}
		}
	}

}