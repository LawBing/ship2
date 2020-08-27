package classes {
    import flash.display.Sprite;
    
    public class ship extends Sprite{

 

        public function ship() {
            draw(false);
        }
        
        public function draw(showFlame:Boolean):void{
            graphics.clear();
            graphics.lineStyle(1, 0xffffff);
			graphics.beginFill(0xffffff);
            graphics.moveTo(10, 0);
            graphics.lineTo(-10, 10);
            graphics.lineTo(-5, 0);
            graphics.lineTo(-10, -10);
            graphics.lineTo(10, 0);
			
			if(showFlame){
		    graphics.lineStyle(1, 0xff0000);
			graphics.beginFill(0xff0000);
			graphics.moveTo(-7.5,-5);
            graphics.lineTo(-15, 0);
            graphics.lineTo(-7.5, 5);

			}
        }

 

    }
    
}
 