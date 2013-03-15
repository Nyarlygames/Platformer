package  
{
	import org.flixel.FlxPath;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author  Paul FIAT
	 */
	public class Jump extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/platform.png')] protected var ImgMove:Class;
		public var pathnodes:Array = new Array();
		public var my_path:FlxPath;
		
		public function Jump(x:int, y:int) 
		{
			super(x, y, ImgMove);
	
			elasticity = 1;
			immovable = true;
		}
		
	}

}