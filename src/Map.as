package  
{
	import org.flixel.FlxGroup;
	
	/**
	 * Maps
	 * @author  Paul FIAT
	 */
	public class Map 
	{
		
		public var ens:FlxGroup = new FlxGroup();
		public var obs:FlxGroup = new FlxGroup();
		public var speed:int = 0;
		public var id:int = 0;
		public var bg:String = new String("");
		
		
		public function Map(map:Class) 
		{
			var fileContent:String = new map();
			var lignes:Array = fileContent.split('\n');
			var en:Array;
			if (lignes != null) {
				id = lignes[0];
				speed = lignes[1];
				bg = lignes[2];
			}
		}
		
	}

}