package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChangeEmailMessage extends RoomWidgetMessage
   {
      
      public static const const_659:String = "rwcem_change_email";
       
      
      private var var_2529:String;
      
      public function RoomWidgetChangeEmailMessage(param1:String)
      {
         super(const_659);
         this.var_2529 = param1;
      }
      
      public function get newEmail() : String
      {
         return this.var_2529;
      }
   }
}
