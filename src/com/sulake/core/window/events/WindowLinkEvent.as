package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowLinkEvent extends WindowEvent
   {
      
      public static const const_1481:String = "WE_LINK";
       
      
      private var var_1760:String;
      
      public function WindowLinkEvent(param1:String, param2:IWindow, param3:IWindow)
      {
         this.var_1760 = param1;
         super(const_1481,param2,param3);
      }
      
      public function get link() : String
      {
         return this.var_1760;
      }
      
      override public function clone() : Event
      {
         return new WindowLinkEvent(this.var_1760,window,related);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowLinkEvent","link","bubbles","cancelable","window");
      }
   }
}
