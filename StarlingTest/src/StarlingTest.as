package
{
    import flash.display.Sprite;
    import screens.InGame;
    import starling.core.Starling;
    
    /**
     * ...
     * @author jianping.shenjp
     */
    public class StarlingTest extends Sprite
    {
        
        [SWF(width="320",height="480",frameRate="60",backgroundColor="#222222")]
        
        public function StarlingTest()
        {
            var myStarling:Starling = new Starling(MyGame, stage);
            myStarling.antiAliasing = 1;
            myStarling.start();
        }
    
    }

}