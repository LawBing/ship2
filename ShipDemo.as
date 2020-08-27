package classes {

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.ui.*;

	public class ShipDemo extends MovieClip {

		public var myShip: ship;
		public var thrust: Number = 0;
		public var vr: Number = 0;
		public var vx: Number = 0;
		public var vy: Number = 0;
		public var missle: Missle;

		public function ShipDemo() {
			init();

		}
		public function init(): void {
			myShip = new ship();
			addChild(myShip);
			myShip.x = stage.stageWidth / 2;
			myShip.y = stage.stageHeight / 2;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDownPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUpPressed);
			addEventListener(Event.ENTER_FRAME, onFrame);

		}
		public function onFrame(e: Event): void {
			myShip.rotation += vr;
			var angle: Number = myShip.rotation * Math.PI / 180;
			var ax: Number = Math.cos(angle) * thrust;
			var ay: Number = Math.sin(angle) * thrust;
			vx += ax;
			vy += ay;
			myShip.x += vx;
			myShip.y += vy;
			checkBorder();
			blocking();
		}
		public function blocking(): void {
			myBlock.x-=2;
			myBlock.rotation--;
			if(missle.hitTestObject(myBlock)){				
				myBlock.visible = false;
				missle.visible = false;
				removeEventListener(Event.ENTER_FRAME, fireOut);
			}
		}
		public function checkBorder(): void {
			if (myShip.x > stage.stageWidth) {
				myShip.x = 0;
			}
			if (myShip.x < 0) {
				myShip.x = stage.stageWidth;
			}
			if (myShip.y > stage.stageHeight) {
				myShip.y = 0;
			}
			if (myShip.y < 0) {
				myShip.y = stage.stageHeight;
			}
			if(myShip.hitTestObject(myBlock)){				
				myBlock.visible = false;
				myShip.visible = false;
				gameover.text = "Game Over!"
			}
		}
		public function onKeyDownPressed(e: KeyboardEvent): void {
			switch (e.keyCode) {
				case Keyboard.UP:
					thrust = 0.1;
					myShip.draw(true);
					break;
				case Keyboard.LEFT:
					vr = -5;
					break;
				case Keyboard.RIGHT:
					vr = 5;
					break;
				case Keyboard.SPACE:
					fire();
					break;
				default:
					break;
			}
		}
		public function fire(): void {
			addChild(new Missle(myShip.rotation, myShip.x, myShip.y));
			addEventListener(Event.ENTER_FRAME, fireOut);
		}
		public function fireOut(e: Event): void {
			myShip.rotation +=vr;
			//var angle: Number = missle.angle * Math.PI / 180;
			//missle.x += Math.cos(angle) * 5.5;
			//missle.y += Math.sin(angle) * 5.5;
		}

		public function onKeyUpPressed(e: KeyboardEvent): void {
			myShip.draw(false);
			thrust = 0;
			vr = 0;
		}
	}

}