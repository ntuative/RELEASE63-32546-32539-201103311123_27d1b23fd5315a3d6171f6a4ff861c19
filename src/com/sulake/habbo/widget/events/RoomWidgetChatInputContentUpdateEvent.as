package com.sulake.habbo.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_669:String = "RWWCIDE_CHAT_INPUT_CONTENT";
      
      public static const const_1262:String = "whisper";
      
      public static const const_1501:String = "shout";
       
      
      private var var_2740:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_669,param3,param4);
         this.var_2740 = param1;
         this._userName = param2;
      }
      
      public function get method_9() : String
      {
         return this.var_2740;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}
