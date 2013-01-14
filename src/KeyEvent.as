package  
{
	import flash.system.System;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	import org.flixel.FlxSprite;
	
	/**
	 * Event des touches
	 * @author ...
	 */
	public class KeyEvent extends FlxObject
	{
		
		public var play:Play;
		public var jump:FlxDelay;
		
		public function KeyEvent(niveau:Play) 
		{
			play = niveau;
		}
		
		override public function update():void
		{
			if (FlxG.keys.pressed("ESCAPE")) {
				System.exit(0);
			}
		}
		
	}

}