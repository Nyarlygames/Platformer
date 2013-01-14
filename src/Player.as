package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxCollision;
	
	/**
	 * Joueur
	 * @author ...
	 */
	public class Player extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/avatar.png')] protected var ImgPlayer:Class;
		public var pos:int = 0;
		public var gravity:int = 30;
		
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
			else
				velocity.y = gravity;
				
			
			if (FlxG.keys.pressed("LEFT")) {
				x--;
				play("walk");
				facing = LEFT;
			}
			if (FlxG.keys.pressed("RIGHT")) {
				x++;
				play("walk");
				facing = RIGHT;
			}
			if (FlxG.keys.pressed("UP")) {
				velocity.y = -50;
			}
			if (FlxG.keys.pressed("DOWN")) {
				
			}
			if (!(FlxG.keys.any())) {
				frame = 0;
			}
		}
		
		
	}

}