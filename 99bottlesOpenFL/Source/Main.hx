package;


import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.Assets;


class Main extends Sprite {
	
	public var texts : Array<flash.text.TextField>;
	var i : Int;
	var a : Int;
	var song : Song;
	var txts : Array<{s:Int,t:flash.display.DisplayObject,rotate:Float,scale:Float}>;
	static var colors = [0xa0d7f5, 0xffcc00, 0xc69e00, 0x80adc4];
	
	public function new () {
		
		super ();
		
		song = new Song();
		
		i = 0;
		a = 0;
		
		txts = [];
		
		this.addEventListener(flash.events.Event.ENTER_FRAME, loop);
		
		
		
	}
	
	public function loop(_) {
		
		i++;
		
		//song
		if (i % 50 == 0 && a<=100) {
			a++;
			
			var tf = new flash.text.TextField();
			tf.autoSize = flash.text.TextFieldAutoSize.CENTER;
			
			tf.text = song.sing(100-a).split(",").join("\n");

			tf.setTextFormat(new flash.text.TextFormat("Arial", 18, colors[Std.random(colors.length)],null,null,null,null,null,flash.text.TextFormatAlign.CENTER));
			tf.x = Std.random(400)-60;
			tf.y = Std.random(200);
			tf.cacheAsBitmap = true;
			
			this.addChild(tf);
			txts.push( { t:tf, s:Std.random(5)+1, rotate:0 , scale : 0} );
			
		}
		
		//beers
		if (i % 20 == 0 && a<=100) {
			a++;
			
			var bitmap = new Bitmap (Assets.getBitmapData ("assets/beer.png"));
			var spr = new flash.display.Sprite();
			spr.addChild(bitmap);
			bitmap.x -= bitmap.width / 2;
			bitmap.y -= bitmap.height / 2;
		
			spr.x = Std.random(400);
			spr.y = -30;
			
			addChild (spr);
			txts.push( { t:spr, s:Std.random(5)+10, rotate:Std.random(20)-10,scale:0} );
			
		}
		
		
		for (o in txts) {
		
			o.t.y += o.s;
			
			//foam
			if(o.rotate != 0){

				var f = new Bitmap (Assets.getBitmapData ("assets/foam.png"));
				f.scaleX = f.scaleY = Math.random() / 2 + 0.5;
				f.x = o.t.x + (Std.random(30)-15);
				f.y = o.t.y - 20;
				txts.push( { t:f, s:0, rotate:0,scale:0.05} );
				addChild(f);
			}
			
			
			if (o.rotate != 0){
				o.t.rotation += o.rotate;
			}
			if ( o.scale != 0 ) {
				o.t.scaleX -= o.scale;
				o.t.scaleY -= o.scale;
			}
			
			if (o.t.y > 450 || o.t.scaleX<0.2) {
				txts.remove(o);
				this.removeChild(o.t);
				o = null;
			}
		}
		
		//fxManager.update();
		
	}
	
	
}