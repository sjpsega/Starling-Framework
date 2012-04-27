package objects
{
    import starling.core.Starling;
    import starling.display.MovieClip;
    import starling.display.Sprite;
    import starling.events.Event;
    
    /**
     * ...
     * @author jianping.shenjp
     */
    public class Hero extends Sprite
    {
        private var hearArt:MovieClip;
        
        public function Hero()
        {
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
        
        private function onAddedToStage(e:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            createHeroArt();
        }
        
        private function createHeroArt():void
        {
            hearArt = new MovieClip(Assets.getAtlas().getTextures("fly_"), 20);
            hearArt.x = Math.ceil(-hearArt.width / 2);
            hearArt.y = Math.ceil(-hearArt.height / 2);
            Starling.juggler.add(hearArt);
            addChild(hearArt);
        }
    
    }

}