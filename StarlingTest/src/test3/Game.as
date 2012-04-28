package test3 
{
    import starling.display.Quad;
	import starling.display.Sprite;
    import starling.events.Event;
	
	/**
     * ...
     * @author jianping.shenjp
     */
    public class Game extends Sprite 
    {
        
        public function Game() 
        {
            super();
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
        
        private function onAddedToStage(e:Event):void 
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            var quad:Quad = new Quad(200, 200);
            quad.setVertexColor(0, 0x000000);
            quad.setVertexColor(1, 0xAA0000);
            quad.setVertexColor(2, 0x00FF00);
            quad.setVertexColor(3, 0x0000FF);
            addChild(quad);
        }
        
    }

}