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
		
		public function Player(xPos:int, yPos:int) 
		{
			super(xPos, yPos, ImgPlayer);
			pos = xPos;
			y -= frameHeight;
			
		}
		
		override public function update():void 
		{
			if (FlxG.keys.pressed("LEFT")) {
				x--;
			}
			if (FlxG.keys.pressed("RIGHT")) {
				x++;
			}
			if (FlxG.keys.pressed("UP")) {
				
			}
			if (FlxG.keys.pressed("DOWN")) {
				
			}
		}
		
		
	}

}