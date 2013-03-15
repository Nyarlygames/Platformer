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
	 * @author  Paul FIAT
	 */
	public class Player extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/avatar.png')] protected var ImgPlayer:Class;
		public var pos:int = 0;
		public var gravity:int = 300;
		public var jump_height:int = -300;
		public var speed:int = 10;
		public var jumptime:FlxTimer;
		public var notjumping:Boolean = true;
		
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
			/* bugfix pour les collisions sur les côtés avec plateformes mobiles */
			if ((velocity.x == 100) || (velocity.x == -100)) {
				velocity.x = 0;
			}
			if ((y + frameHeight) > FlxG.height) {
				y = FlxG.height - frameHeight;
				notjumping = true;
				if (jumptime != null) {
					jumptime.destroy();
					jumptime = null;
				}
			}
			else if ((jumptime != null) && (jumptime.finished == true)) {
				velocity.y = gravity;
				jumptime.destroy();
				jumptime = null;
			}			
			if ((velocity.y == 0) || (y + frameHeight >= FlxG.height)) {
				notjumping = true;
				velocity.y = gravity;
			}
			if (FlxG.keys.pressed("LEFT") && (x >= 0)) {
				x -= speed;
				play("walk");
				facing = LEFT;
			}
			if (FlxG.keys.pressed("RIGHT") && (x < FlxG.width *2)) {
				x += speed;
				play("walk");
				facing = RIGHT;
			}
			if (FlxG.keys.justPressed("UP")) {
				if ((jumptime == null) && (velocity.y == gravity) && (notjumping == true)) {
					notjumping = false;
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