package com.sulake.habbo.widget.messages
{
   public class RoomWidgetLetUserInMessage extends RoomWidgetMessage
   {
      
      public static const const_826:String = "RWLUIM_LET_USER_IN";
       
      
      private var _userName:String;
      
      private var var_2732:Boolean;
      
      public function RoomWidgetLetUserInMessage(param1:String, param2:Boolean)
      {
         super(const_826);
         this._userName = param1;
         this.var_2732 = param2;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get canEnter() : Boolean
      {
         return this.var_2732;
      }
   }
}
