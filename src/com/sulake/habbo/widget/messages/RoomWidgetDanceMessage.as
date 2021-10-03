package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_664:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1084:int = 0;
      
      public static const const_1731:Array = [2,3,4];
       
      
      private var var_83:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_664);
         this.var_83 = param1;
      }
      
      public function get style() : int
      {
         return this.var_83;
      }
   }
}
