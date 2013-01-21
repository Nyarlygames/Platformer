package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxSound;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Background extends FlxSprite 
	{
		public var sound:FlxSound;
		
		 [Embed(source = '../assets/gfx/background1.png')] public var ImgBackground1:Class;
		 [Embed(source = '../assets/gfx/background2.png')] public var ImgBackground2:Class;
		 [Embed(source = '../assets/gfx/background3.png')] public var ImgBackground3:Class;
		 [Embed(source = '../assets/gfx/sol.png')] public var ImgSol:Class;
		public function Background(id:int, scroll:int) 
		{
			super(0, FlxG.height);
			switch (id) {
				case 1 :
					loadGraphic(ImgBackground1);
					break;
				case 2 :
					loadGraphic(ImgBackground2);
					break;
				case 3 :
					loadGraphic(ImgBackground3);
					break;
			}
			scrollFactor.x = scrollFactor.y = scroll;
			y -= frameHeight;
			//FlxScrollZone.add(this, new Rectangle(0, 0, this.width, this.height), -scroll, 0);
			/*sound = new FlxSound();
			sound.loadStream("../assets/sfx/musiques/Shinshuu_Plains_I.mp3", true, true);
			sound.play();*/
			
		}
		
	}

}