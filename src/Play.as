package  
{
	import flash.utils.Timer;
	import org.flixel.FlxGroup;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxControl;
	import org.flixel.plugin.photonstorm.FlxControlHandler;
	import org.flixel.FlxObject;
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	import org.flixel.FlxTilemap;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import net.pixelpracht.tmx.TmxMap;
	import net.pixelpracht.tmx.TmxObject;
	import net.pixelpracht.tmx.TmxObjectGroup;
	/**
	 * Niveau
	 * @author  Paul FIAT
	 */
	public class Play extends FlxState 
	{
		[Embed(source = '../assets/fonts/Colleged.ttf',	fontFamily = "fontFamily", embedAsCFF = "false")] protected var	Font:Class;
		[Embed(source = '../assets/gfx/decor_tileset.png')] protected var ImgTileSet:Class;
		[Embed(source = '../assets/sfx/sfx.swf', symbol = 'ambient.wav')] public var Ambient:Class;
		[Embed(source = '../assets/sfx/sfx.swf', symbol = 'bonus.wav')] public var SBonus:Class;
		[Embed(source = '../assets/sfx/sfx.swf', symbol = 'star.wav')] public var StarSFX:Class;
		public var player:Player;
		public var map:Map;
		public var background:Background = new Background(1,0);
		public var speed:int = 0;
		public var scorelab:FlxText = new FlxText(0, 0, FlxG.width, "Socre : ");
		public var tilemap:FlxTilemap = new FlxTilemap();
		public function Play(lvl:Map) 
		{	 
			if (FlxG.getPlugin(FlxScrollZone) == null)
			{
				FlxG.addPlugin(new FlxScrollZone);
			}
			super.update();
			map = lvl;
	 		add(background); 
 			add(new Background(2,1));
			add(new Background(3,3));
			player = new Player(50,FlxG.height);
			for each (var item:FlxSprite in map.ens.members) {
				if (item != null){
					item.y = FlxG.height - item.y - item.frameHeight;
				}
			}
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,onTmxLoaded);
			loader.load(new	URLRequest('../maps/maps2.tmx'));

			scorelab.scrollFactor.y = scorelab.scrollFactor.x = 0;
			scorelab.setFormat("fontFamily", 10);
			add(scorelab);
			add(player);
			FlxG.playMusic(Ambient);
		}
		
		public function onTmxLoaded(e:Event):void {
			var xml:XML = new XML(e.target.data);
			var tmx:TmxMap = new TmxMap(xml);
			
			tilemap = new FlxTilemap();
			var csv:String = tmx.getLayer('Tile').toCsv(tmx.getTileSet('decor_tileset'));
			tilemap.loadMap(csv,ImgTileSet, 64, 64);
			add(tilemap);
			
			var group:TmxObjectGroup = tmx.getObjectGroup('Objets');
			for each(var object:TmxObject in group.objects) {
				switch(object.type) {
					case "Etoile":
						map.ens.add (new Star(object.x, object.y, 100));
						break;
					case "Bonus":
						map.ens.add (new Bonus(object.x, object.y, 100));
						break;
					case "Plate":
						map.obs.add (new Jump(object.x, object.y));
						break;
					case "Move_plat":
						map.obs.add (new MovableJump(object.x, object.y));
						break;
				}
			}
			add(map.ens);
			add(map.obs);
		}

		override public function update():void {
			super.update();
			scorelab.text = "Score = " + FlxG.score;
			FlxG.collide(player, map.obs)
			FlxG.camera.setBounds(0, 0, background.frameWidth*2, background.frameHeight);
			FlxG.worldBounds = new FlxRect(0, 0, background.frameWidth * 2, background.frameHeight);
			FlxG.camera.follow(player, 1);
			for each (var item:FlxSprite in map.ens.members) {
				if ((item != null) && (FlxG.overlap(player, item))) {
					if (item is Star) {
						FlxG.score += 10;
						FlxG.play(StarSFX);
					}
					else {
						player.jump_height = -500;
						FlxG.play(SBonus);
					}
					item.destroy();
					item.kill();
					item.exists = false;
				}
			}
		}
				
	}

}