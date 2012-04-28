package test2
{
    import fr.kouma.starling.utils.Stats;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
    import starling.textures.Texture;
    
    public class Game extends Sprite
    {
        [Embed(source="../../media/textures/ring.png")]
        private var ringClass:Class;
        private var step:int = 0;
        private var interval:int = 1;
        private const CONVERT:Number = Math.PI / 180;
        private var currentRotation:Number = 0;
        
        public function Game()
        {
            super();
            create();
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
        
        private function onAddedToStage(e:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            //Create Stats to test the performance
            addChild(new Stats());
        }
        
        private function create():void
        {
            this.touchable = false;
            createNewText();
            addEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }
        
        private function enterFrameHandler(pEvent:Event):void
        {
            if (step > interval)
            {
                step = 0;
                createNewText();
            }
            step++;
            updateAllTexts();
        }
        
        private function createNewText():void
        {
            var sprite:Sprite = new Sprite();
            var color:Number = (Math.round(Math.random() * 255) << 16) + (Math.round(Math.random() * 255) << 8) + Math.round(Math.random() * 255);
            if (Math.random() > .4)
            {
                var image:Image = new Image(Texture.fromBitmap(new ringClass()));
                sprite.addChild(image);
                image.color = color;
                image.x = -image.width / 2;
                image.y = -image.height / 2;
            }
            else
            {
                var textfield:TextField = new TextField(80, 80, getRandomText(), "Impact", 50, color);
                sprite.addChild(textfield);
                textfield.x = -textfield.width / 2;
                textfield.y = -textfield.height / 2;
                sprite.addChild(textfield);
            }
            
            addChild(sprite);
            sprite.name = String(Math.round(Math.random() * 10));
            sprite.rotation = Math.PI * 2 * Math.random();
            sprite.x = 300;
            sprite.y = 200;
            sprite.scaleX = sprite.scaleY = .5;
            sprite.alpha = 0;
        }
        
        private function updateAllTexts():void
        {
            for (var i:int = 0; i < this.numChildren; i++)
            {
                var sprite:Sprite = this.getChildAt(i) as Sprite;
                if (sprite && !(sprite is Stats))
                {
                    sprite.rotation += (Number(sprite.name) > 5) ? .01 : -.01;
                    sprite.x += 3 * sprite.scaleX * Math.cos(sprite.rotation);
                    sprite.y += 3 * sprite.scaleY * Math.sin(sprite.rotation);
                    sprite.alpha += .03;
                    sprite.scaleX += .05;
                    sprite.scaleY = sprite.scaleX;
                    if (sprite.x > 600 + sprite.width / 2 || sprite.x < -sprite.width / 2 || sprite.y > 400 + sprite.height / 2 || sprite.y < -sprite.height / 2)
                    {
                        removeChild(sprite);
                        i--;
                    }
                }
            }
        }
        
        private function getRandomText():String
        {
            //return String.fromCharCode(Math.random()*100000);
            var source:String = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            return source.charAt(Math.random() * source.length);
        }
    }
}