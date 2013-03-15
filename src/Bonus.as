package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bonus extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/bonus.png')] protected var ImgTube:Class;
		
		public function Bonus(xpos:int, ypos:int, init:int) 
		{
			super(xpos, ypos, ImgTube);
			y -= frameHeight;
		}
		
	}

}