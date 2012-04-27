package events
{
    import starling.events.Event;
    
    /**
     * ...
     * @author jianping.shenjp
     */
    public class NavigationEvent extends Event
    {
        
        static public const CHANGE_SCEEN:String = "changeScreen";
        public var params:Object;
        
        public function NavigationEvent(type:String, _params:Object, bubbles:Boolean = false)
        {
            super(type, bubbles);
            params = _params;
        }
    
    }

}