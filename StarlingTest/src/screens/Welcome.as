package screens
{
    import com.greensock.TweenLite;
    import events.NavigationEvent;
    import starling.display.Button;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.EnterFrameEvent;
    import starling.events.Event;
    
    /**
     * ...
     * @author jianping.shenjp
     */
    public class Welcome extends Sprite
    {
        private var bg:Image;
        private var title:Image;
        private var hero:Image;
        
        private var playBtn:Button;
        private var aboutBtn:Button;
        
        public function Welcome()
        {
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }
        
        private function onAddedToStage(e:Event):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            trace("Welcome");
            drawScreen();
        }
        
        private function drawScreen():void
        {
            bg = new Image(Assets.getTexture("BgWelcome"));
            addChild(bg);
            
            title = new Image(Assets.getAtlas().getTexture("welcome_title"));
            title.x = 440;
            title.y = 20;
            addChild(title);
            
            hero = new Image(Assets.getAtlas().getTexture("welcome_hero"));
            addChild(hero);
            hero.x = -hero.width;
            hero.y = 100;
            
            playBtn = new Button(Assets.getAtlas().getTexture("welcome_playButton"));
            playBtn.x = 500;
            playBtn.y = 260;
            addChild(playBtn);
            
            aboutBtn = new Button(Assets.getAtlas().getTexture("welcome_aboutButton"));
            aboutBtn.x = 410;
            aboutBtn.y = 380;
            addChild(aboutBtn);
            
            this.addEventListener(Event.TRIGGERED, onMainMenuClick);
        }
        
        private function onMainMenuClick(e:Event):void
        {
            var buttonClicked:Button = e.target as Button;
            if (buttonClicked == playBtn)
            {
                this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCEEN, {id: "play"}, true));
            }
        }
        
        public function initialize():void
        {
            this.visible = true;
            
            hero.x = -hero.width;
            hero.y = 100;
            
            TweenLite.to(hero, 2, {x: 80});
            
            this.addEventListener(EnterFrameEvent.ENTER_FRAME, heroAnimation);
        }
        
        public function disposeTemporarliy():void
        {
            this.visible = false;
            
            if (hasEventListener(EnterFrameEvent.ENTER_FRAME))
            {
                removeEventListener(EnterFrameEvent.ENTER_FRAME, heroAnimation);
            }
        }
        
        private function heroAnimation(e:EnterFrameEvent):void
        {
            var currentData:Date = new Date();
            hero.y = 100 + (Math.cos(currentData.getTime() * 0.002) * 25);
            playBtn.y = 260 + (Math.cos(currentData.getTime() * 0.002) * 10);
            aboutBtn.y = 380 + (Math.cos(currentData.getTime() * 0.002) * 10);
        }
    }
}