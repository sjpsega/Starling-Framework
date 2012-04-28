package test3 
{
	import flash.display.Sprite;
    import starling.core.Starling;
    import starling.events.Event;
	
	/**
     * ...
     * @author jianping.shenjp
     */
    public class StarlingTest extends Sprite 
    {
        
        public function StarlingTest() 
        {
            super();
            var starling:starling.core.Starling = new starling.core.Starling(test3.Game, stage);
            starling.antiAliasing = 1;
            starling.start();
            
            Starling.current.addEventListener(Event.CONTEXT3D_CREATE, onContext3dCreate);
        }
        
        private function onContext3dCreate(e:Event):void 
        {
            trace(Starling.context.driverInfo);
        }
        
    }

}