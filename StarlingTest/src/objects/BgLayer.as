package objects
{
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Event;
    
    /**
     * @author jianping.shenjp
     */
    public class BgLayer extends Sprite
    {
        private var image1:Image;
        private var image2:Image;
        private var _layer:int;
        private var _parallax:Number;
        
        public function BgLayer(layer:int)
        {
            super();
            _layer = layer;
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
        
        private function onAddedToStage(e:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            
            //背景使用两张相同的图前后连接，方便背景移动，超出范围，重置位置
            if (_layer == 1)
            {
                image1 = new Image(Assets.getTexture("BgLayer" + _layer));
                image2 = new Image(Assets.getTexture("BgLayer" + _layer));
            }
            else
            {
                image1 = new Image(Assets.getAtlas().getTexture("bgLayer" + _layer));
                image2 = new Image(Assets.getAtlas().getTexture("bgLayer" + _layer));
            }
            image1.x = 0;
            image1.y = stage.stageHeight - image1.height;
            
            image2.x = image2.width;
            image2.y = image1.y;
            
            addChild(image1);
            addChild(image2);
        }
        
        public function get parallax():Number
        {
            return _parallax;
        }
        
        public function set parallax(value:Number):void
        {
            _parallax = value;
        }
    
    }

}