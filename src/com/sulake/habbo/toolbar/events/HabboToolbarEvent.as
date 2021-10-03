package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_69:String = "HTE_INITIALIZED";
      
      public static const const_39:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_585:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_679:String = "HTE_TOOLBAR_RESIZED";
       
      
      private var var_752:String;
      
      private var var_549:String;
      
      private var var_1153:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_752 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_752;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_549 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_549;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1153 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1153;
      }
   }
}
