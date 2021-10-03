package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_718:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1409:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_718);
         this.var_1409 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1409;
      }
   }
}
