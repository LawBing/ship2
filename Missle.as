package classes {
    import flash.display.MovieClip;
    import flash.events.*;

 

    public class Missle extends MovieClip {
        public var myAngle: Number;

 

        public function Missle(angle: Number, myX: Number, myY: Number) {
            this.myAngle = angle;
            this.x = myX;
            this.y = myY;

 

            init();
        }

 

        public function init(): void {
            draw();
            addEventListener(Event.ENTER_FRAME, onMove);
        }

 

        public function draw(): void {
            graphics.beginFill(0xFF0000);
            graphics.drawCircle(this.x, this.y, 5);
            graphics.endFill();
        }

 

        public function onMove(e: Event): void {
            var vx: Number = Math.cos(myAngle) * 10;
            var vy: Number = Math.sin(myAngle) * 10;
            this.x += vx;
            this.y += vy;
        }

 

    }

 

}