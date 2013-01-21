package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxGame;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Simon
	 */
	public class MenuState extends FlxState 
	{
		
		override public function create():void
		{
			var title:FlxText = new FlxText(200, 100, 100, "Tetris");
			title.setFormat(null, 16);
			add(title);
			
			var info:FlxText = new FlxText(180, 250, 100, "Press Enter to play");
			add(info);
		}
		
		override public function update():void {
			if (FlxG.keys.ENTER) {
				FlxG.switchState(new PlayState());
			}
		}
	}

}