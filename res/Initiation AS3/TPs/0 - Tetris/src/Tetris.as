package 
{
	import org.flixel.FlxGame;

	[SWF(width = "480", height = "600", backgroundColor = "#000000")]

	/**
	 * ...
	 * @author Simon
	 */
	public class Tetris extends FlxGame
	{
		
		public function Tetris():void 
		{
			super(480, 600, MenuState);
		}
		
	}
	
}