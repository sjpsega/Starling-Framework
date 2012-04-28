package test2
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.*;
    import starling.core.Starling;
    
    [SWF(backgroundColor="#000000",width="600",height="400",frameRate="60")]
    
    public class StarlingExample extends Sprite
    {
        private var myStarling:Starling;
        
        public function StarlingExample()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            //Create a new
            myStarling = new Starling(Game, stage);
            //Set quality, higher better but slower.
            myStarling.antiAliasing = 1;
            myStarling.start();
        }
    }
}