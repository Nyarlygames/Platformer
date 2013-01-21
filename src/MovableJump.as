package  
{
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class MovableJump extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/paddle.png')] protected var ImgMove:Class;
		public var pathnodes:Array = new Array();
		public var my_path:FlxPath;
		
		public function MovableJump(x:int, y:int) 
		{
			super(x, y, ImgMove);
			pathnodes.push(new FlxPoint(x+120, y + frameHeight/2));
			pathnodes.push(new FlxPoint(x+210, y+ frameHeight/2))
			my_path = new FlxPath(pathnodes);
			followPath(my_path, 100, PATH_LOOP_FORWARD);
			elasticity = 1;
			immovable = true;
			//velocity.x = init;
		}
		
	}

}