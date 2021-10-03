package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1634:String = "WN_CRETAE";
      
      public static const const_1711:String = "WN_CREATED";
      
      public static const const_1174:String = "WN_DESTROY";
      
      public static const const_1194:String = "WN_DESTROYED";
      
      public static const const_1261:String = "WN_OPEN";
      
      public static const const_1252:String = "WN_OPENED";
      
      public static const const_1080:String = "WN_CLOSE";
      
      public static const const_1126:String = "WN_CLOSED";
      
      public static const const_1220:String = "WN_FOCUS";
      
      public static const const_1189:String = "WN_FOCUSED";
      
      public static const const_1031:String = "WN_UNFOCUS";
      
      public static const const_1137:String = "WN_UNFOCUSED";
      
      public static const const_1107:String = "WN_ACTIVATE";
      
      public static const const_413:String = "WN_ACTVATED";
      
      public static const const_1037:String = "WN_DEACTIVATE";
      
      public static const const_1096:String = "WN_DEACTIVATED";
      
      public static const const_561:String = "WN_SELECT";
      
      public static const const_381:String = "WN_SELECTED";
      
      public static const const_643:String = "WN_UNSELECT";
      
      public static const const_700:String = "WN_UNSELECTED";
      
      public static const const_1061:String = "WN_LOCK";
      
      public static const const_1157:String = "WN_LOCKED";
      
      public static const const_1178:String = "WN_UNLOCK";
      
      public static const const_1167:String = "WN_UNLOCKED";
      
      public static const const_1244:String = "WN_ENABLE";
      
      public static const const_930:String = "WN_ENABLED";
      
      public static const const_1176:String = "WN_DISABLE";
      
      public static const const_841:String = "WN_DISABLED";
      
      public static const const_671:String = "WN_RESIZE";
      
      public static const const_207:String = "WN_RESIZED";
      
      public static const const_1223:String = "WN_RELOCATE";
      
      public static const const_593:String = "WN_RELOCATED";
      
      public static const const_1122:String = "WN_MINIMIZE";
      
      public static const const_1222:String = "WN_MINIMIZED";
      
      public static const const_1238:String = "WN_MAXIMIZE";
      
      public static const const_1214:String = "WN_MAXIMIZED";
      
      public static const const_1269:String = "WN_RESTORE";
      
      public static const const_1210:String = "WN_RESTORED";
      
      public static const const_375:String = "WN_CHILD_ADDED";
      
      public static const const_944:String = "WN_CHILD_REMOVED";
      
      public static const const_306:String = "WN_CHILD_RESIZED";
      
      public static const const_319:String = "WN_CHILD_RELOCATED";
      
      public static const WINDOW_NOTIFY_CHILD_ACTIVATED:String = "WN_CHILD_ACTIVATED";
      
      public static const const_508:String = "WN_PARENT_ADDED";
      
      public static const const_1263:String = "WN_PARENT_REMOVED";
      
      public static const const_577:String = "WN_PARENT_RESIZED";
      
      public static const const_1200:String = "WN_PARENT_RELOCATED";
      
      public static const const_851:String = "WN_PARENT_ACTIVATED";
      
      public static const const_456:String = "WN_STATE_UPDATED";
      
      public static const const_457:String = "WN_STYLE_UPDATED";
      
      public static const const_475:String = "WN_PARAM_UPDATED";
      
      public static const UNKNOWN:String = "UNKNOWN";
      
      private static const POOL:Array = [];
       
      
      private var _isRecycled:Boolean;
      
      public function WindowNotifyEvent()
      {
         super("",null,null);
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowNotifyEvent
      {
         var _loc5_:WindowNotifyEvent = false ? POOL.pop() : new WindowNotifyEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_475 = param3;
         _loc5_.var_1577 = param4;
         _loc5_._isRecycled = false;
         return _loc5_;
      }
      
      override public function recycle() : void
      {
         if(this._isRecycled)
         {
            throw new Error("Event already recycled!");
         }
         _type = null;
         var_475 = null;
         _window = null;
         this._isRecycled = true;
         POOL.push(this);
      }
      
      override public function clone() : Event
      {
         return allocate(type,_window,var_475,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
