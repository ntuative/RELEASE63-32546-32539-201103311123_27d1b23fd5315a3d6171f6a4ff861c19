package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChangeMottoMessage extends RoomWidgetMessage
   {
      
      public static const const_842:String = "RWVM_CHANGE_MOTTO_MESSAGE";
       
      
      private var var_1927:String;
      
      public function RoomWidgetChangeMottoMessage(param1:String)
      {
         super(const_842);
         this.var_1927 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1927;
      }
   }
}
