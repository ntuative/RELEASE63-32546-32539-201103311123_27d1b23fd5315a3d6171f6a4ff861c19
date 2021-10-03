package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1553:String = "WE_CREATE";
      
      public static const const_1716:String = "WE_CREATED";
      
      public static const const_1723:String = "WE_DESTROY";
      
      public static const const_299:String = "WE_DESTROYED";
      
      public static const const_1582:String = "WE_OPEN";
      
      public static const const_1730:String = "WE_OPENED";
      
      public static const const_1462:String = "WE_CLOSE";
      
      public static const const_1463:String = "WE_CLOSED";
      
      public static const const_1518:String = "WE_FOCUS";
      
      public static const const_298:String = "WE_FOCUSED";
      
      public static const const_1591:String = "WE_UNFOCUS";
      
      public static const const_1562:String = "WE_UNFOCUSED";
      
      public static const const_1544:String = "WE_ACTIVATE";
      
      public static const const_1671:String = "WE_ACTIVATED";
      
      public static const const_1499:String = "WE_DEACTIVATE";
      
      public static const const_602:String = "WE_DEACTIVATED";
      
      public static const const_537:String = "WE_SELECT";
      
      public static const const_63:String = "WE_SELECTED";
      
      public static const const_801:String = "WE_UNSELECT";
      
      public static const const_758:String = "WE_UNSELECTED";
      
      public static const const_1939:String = "WE_ATTACH";
      
      public static const const_1959:String = "WE_ATTACHED";
      
      public static const const_1994:String = "WE_DETACH";
      
      public static const const_1858:String = "WE_DETACHED";
      
      public static const const_1688:String = "WE_LOCK";
      
      public static const const_1477:String = "WE_LOCKED";
      
      public static const const_1495:String = "WE_UNLOCK";
      
      public static const const_1702:String = "WE_UNLOCKED";
      
      public static const const_650:String = "WE_ENABLE";
      
      public static const const_325:String = "WE_ENABLED";
      
      public static const const_661:String = "WE_DISABLE";
      
      public static const const_239:String = "WE_DISABLED";
      
      public static const const_1732:String = "WE_RELOCATE";
      
      public static const const_410:String = "WE_RELOCATED";
      
      public static const const_1606:String = "WE_RESIZE";
      
      public static const const_49:String = "WE_RESIZED";
      
      public static const WINDOW_EVENT_MINIMIZE:String = "WE_MINIMIZE";
      
      public static const const_1650:String = "WE_MINIMIZED";
      
      public static const const_1584:String = "WE_MAXIMIZE";
      
      public static const const_1712:String = "WE_MAXIMIZED";
      
      public static const const_1490:String = "WE_RESTORE";
      
      public static const const_1531:String = "WE_RESTORED";
      
      public static const const_1964:String = "WE_ARRANGE";
      
      public static const const_2013:String = "WE_ARRANGED";
      
      public static const const_109:String = "WE_UPDATE";
      
      public static const const_1832:String = "WE_UPDATED";
      
      public static const const_1846:String = "WE_CHILD_RELOCATE";
      
      public static const const_450:String = "WE_CHILD_RELOCATED";
      
      public static const const_1825:String = "WE_CHILD_RESIZE";
      
      public static const const_310:String = "WE_CHILD_RESIZED";
      
      public static const const_1877:String = "WE_CHILD_REMOVE";
      
      public static const const_563:String = "WE_CHILD_REMOVED";
      
      public static const const_1870:String = "WE_PARENT_RELOCATE";
      
      public static const const_1847:String = "WE_PARENT_RELOCATED";
      
      public static const const_1902:String = "WE_PARENT_RESIZE";
      
      public static const const_1602:String = "WE_PARENT_RESIZED";
      
      public static const const_180:String = "WE_OK";
      
      public static const const_757:String = "WE_CANCEL";
      
      public static const const_104:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_472:String = "WE_SCROLL";
      
      public static const const_159:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_475:IWindow;
      
      protected var var_1578:Boolean;
      
      protected var var_1577:Boolean;
      
      private var var_1058:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow = null, param3:IWindow = null, param4:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_475 = param3;
         this.var_1578 = false;
         this.var_1577 = param4;
         super(param1);
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = false ? POOL.pop() : new WindowEvent(param1);
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_475 = param3;
         _loc5_.var_1577 = param4;
         _loc5_.var_1058 = false;
         return _loc5_;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_475;
      }
      
      override public function get cancelable() : Boolean
      {
         return this.var_1577;
      }
      
      public function recycle() : void
      {
         if(this.var_1058)
         {
            throw new Error("Event already recycled!");
         }
         this._type = null;
         this.var_475 = null;
         this._window = null;
         this.var_1058 = true;
         this.var_1578 = false;
         POOL.push(this);
      }
      
      override public function clone() : Event
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1578 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1578;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","cancelable","window");
      }
   }
}
