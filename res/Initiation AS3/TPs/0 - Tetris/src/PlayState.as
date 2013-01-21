package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Simon
	 */
	public class PlayState extends FlxState 
	{
		/**
		 * Image background
		 */
		[Embed(source="../assets/gfx/background.png")] protected var ImgBackground:Class;

		/**
		 * Vitesse d'un block
		 */
		public const BLOCK_VELOCITY:Number = 5;
		/**
		 * Spécifie le temps nécessaire à l'apparition d'un block
		 */
		public const SPAWN_TIME:Number = 10;

		/**
		 * Compteur
		 */
		private var spawnTimer:Number;
		
		/**
		 * Liste de tous les blocks
		 */
		private var blocks:Array;

		/**
		 * Crée le play state
		 */
		override public function create():void
		{
			//Crée et ajoute un background
			var background:FlxSprite = new FlxSprite(0, 0, ImgBackground);
			add(background);

			//Crée et ajoute un label score au state
			var scoreLabel:FlxText = new FlxText(340, 20, 100, "SCORE");
			scoreLabel.setFormat(null, 12, 0x000000);
			add(scoreLabel);

			//Crée et ajoute un block au state
			var block:Block = new Block();
			add(block);

			//Crée la liste de blocks et ajoute le bloc à la liste de blocks
			blocks = new Array();
			blocks.push(block);

			//Init
			spawnTimer = 0;
		}
		
		/**
		 * Met à jour le play state
		 */
		override public function update():void {
			//Ajoute au timer le temps qui s'est écoulé depuis la frame précédente
			spawnTimer += FlxG.elapsed;
			
			//Quand le compteur atteint le temps d'apparition
			if (spawnTimer >= SPAWN_TIME) {
				//Reset le compteur
				spawnTimer = 0;
				//Crée et ajoute un nouveau block
				var block:Block = new Block();
				add(block);
				//Ajoute un block à la liste
				blocks.push(block);
			}
			
			//Changer les blocks de position
			for (var i:int = 0; i < blocks.length; i++) {
				blocks[i].y = blocks[i].y + 10;
			}
		}
		
	}

}