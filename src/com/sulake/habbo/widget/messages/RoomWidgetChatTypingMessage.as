package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_773:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_659:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_773);
         this.var_659 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_659;
      }
   }
}
