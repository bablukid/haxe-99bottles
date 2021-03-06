/**
 * 99 Bottles of Beer
 * 
 * cd bin/
 * php index.php
 * neko index.n
 * java -jar Main.jar
 * python index.py
 * 
 */
class Main 
{

	public static function main()
	{
       new Main();
	}	


	public function new() {
		var song = "";

		for (i in 0...100){
			song += sing(99-i);
		}
		
		Sys.println( song );
	}
	
	function pluralizer(i) {
		return (i == 1) ? "1 bootle" : i + " bottles";
	}
	
	/**
	 * Sings one verse of the 99 Bottles of Beer song.
	 */
	private function sing(x:Int)
	{
		var s = "";
		if (x >= 1) {
			
			s += pluralizer(x) + " of beer on the wall, ";
			s += pluralizer(x) + " of beer.\nTake one down and pass it around,";
			
			if (x > 1) {
				s += pluralizer(x - 1) +" of beer on the wall.\n\n";	
			}else {
				s += " no more bottles of beer on the wall.\n\n";		
			}
			
			
		} else if (x == 0) {
			s += "No more bottles of beer on the wall,";
			s += "no more bottles of beer.\n";
			s += "Go to the store and buy some more, ";
			s += "99 bottles of beer on the wall.\n";
		}
		return s;
	}
}

