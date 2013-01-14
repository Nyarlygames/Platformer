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
			if (FlxG.keys.pressed("UP")) {
				for each (var item:FlxSprite in play.map.ens.members)
					item.velocity.x = -75;
				//play.player.acceleration.x = -30;
				FlxScrollZone.updateX(play.background, -1);
			}
			if (FlxG.keys.pressed("DOWN")) {
				for each (var item2:FlxSprite in play.map.ens.members)
					item2.velocity.x = -50;
				//play.player.acceleration.x = +30;
				FlxScrollZone.updateX(play.background, -3);
				//play.player.acceleration.y = 50;
			}
			/*if ((FlxG.keys.pressed("SHIFT")) && (play.player.y + play.player.frameHeight == play.background.y)) {
				jump = new FlxDelay(1000);
				jump.start();
				play.player.acceleration.y = -50;
			}*/
			/*if ((jump != null) && (jump.hasExpired == true)) {
				play.player.acceleration.y = 50;
				jump = null;
			}*/
		}
		
	}

}