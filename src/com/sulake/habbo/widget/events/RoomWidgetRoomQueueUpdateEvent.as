package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_358:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const const_488:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var var_688:int;
      
      private var var_2543:Boolean;
      
      private var var_440:Boolean;
      
      private var var_1694:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_688 = param2;
         this.var_2543 = param3;
         this.var_440 = param4;
         this.var_1694 = param5;
      }
      
      public function get position() : int
      {
         return this.var_688;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return this.var_2543;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_440;
      }
      
      public function get isClubQueue() : Boolean
      {
         return this.var_1694;
      }
   }
}
