package  
{
    import events.NavigationEvent;
    import fr.kouma.starling.utils.Stats;
    import screens.InGame;
    import screens.Welcome;
    import starling.display.Sprite;
    import starling.events.Event;
	
	/**
     * ...
     * @author jianping.shenjp
     */
    public class MyGame extends Sprite 
    {
        private var screenWelcome:Welcome;
        private var screemInGame:InGame;
        
        public function MyGame() 
        {
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
        
        private function onAddedToStage(e:Event):void 
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            stage.addChild(new Stats());
            
            this.addEventListener(NavigationEvent.CHANGE_SCEEN, onChangeScreen);
            
            screemInGame = new InGame();
            screemInGame.disposeTemporarliy();
            addChild(screemInGame);
            
            screenWelcome = new Welcome();
            addChild(screenWelcome);
            screenWelcome.initialize();
        }
        
        private function onChangeScreen(e:NavigationEvent):void 
        {
            switch (e.params.id) 
            {
                case "play":
                    screenWelcome.disposeTemporarliy();
                    screemInGame.initalize();
                break;
                default:
            }
        }
        
        public function disposeTemporarliy():void 
        {
            this.visible = false;
        }
        
    }

}