package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author  Paul FIAT
	 */
	public class Star extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/star.png')] protected var ImgTube:Class;
		
		public function Star(xpos:int, ypos:int, init:int) 
		{
			super(xpos, ypos, ImgTube);
			y -= frameHeight;
		}
		
	}

}