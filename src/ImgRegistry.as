package  
{

	import org.flixel.FlxObject;

	/**
	 * ...
	 * @author  Paul FIAT
	 */
	public class ImgRegistry extends FlxObject 
	{
		
		
		[Embed(source = '../assets/gfx/platform.png')] public var ImgJump1:Class;
		public var assets:Array = new Array();
		
		public function ImgRegistry() 
		{
			assets.push(ImgJump1);
		}
	}

}