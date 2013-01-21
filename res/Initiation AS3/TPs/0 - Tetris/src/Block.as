package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Simon
	 */
	public class Block extends FlxSprite 
	{
		[Embed(source="../assets/gfx/block.png")] protected var ImgBlock:Class;
		
		public function Block() 
		{
			super(220, 10, ImgBlock);
		}
	}

}