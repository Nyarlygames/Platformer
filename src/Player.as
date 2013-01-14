package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.FlxTimer;
	
	/**
	 * Joueur
	 * @author ...
	 */
	public class Player extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/avatar.png')] protected var ImgPlayer:Class;
		public var pos:int = 0;
		public var gravity:int = 300;
		public var jump_height:int = -300;
		public var speed:int = 5;
		public var jumptime:FlxTimer;
		
		public function Player(xPos:int, yPos:int) 
		{
			super(0,FlxG.height, ImgPlayer);
			pos = xPos;
			loadGraphic(ImgPlayer, true, true, 36, 49);
			addAnimation("walk", [0, 1, 2, 3], 10, true);
			addAnimation("idle", [4, 5, 6, 7], 10, true);
			y -= frameHeight;
			velocity.y = gravity;
		}
		
		override public function update():void 
		{
			if ((y + frameHeight) >= FlxG.height) {
				y = FlxG.height - frameHeight;
				velocity.y = 0;
			}
			else if ((jumptime != null) && (jumptime.finished == true)) {
				velocity.y = gravity;
				jumptime.destroy();
				jumptime = null;
			}
				
			
			if (FlxG.keys.pressed("LEFT")) {
				x -= speed;
				play("walk");
				facing = LEFT;
			}
			if (FlxG.keys.pressed("RIGHT")) {
				x += speed;
				play("walk");
				facing = RIGHT;
			}
			if (FlxG.keys.justPressed("UP")) {
				if ((jumptime == null) && (velocity.y == 0)) {
					jumptime = new FlxTimer();
					jumptime.start(0.5);
					velocity.y = jump_height;
				}
			}
			if (FlxG.keys.pressed("DOWN")) {
				y = FlxG.height - frameHeight;
			}
			if (!(FlxG.keys.any())) {
				frame = 0;
			}
		}
		
		
	}

}