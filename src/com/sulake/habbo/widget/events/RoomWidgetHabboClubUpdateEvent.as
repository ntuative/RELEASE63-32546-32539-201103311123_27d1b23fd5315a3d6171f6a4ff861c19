package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_255:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2244:int = 0;
      
      private var var_2247:int = 0;
      
      private var var_2246:int = 0;
      
      private var var_2248:Boolean = false;
      
      private var var_2245:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_255,param6,param7);
         this.var_2244 = param1;
         this.var_2247 = param2;
         this.var_2246 = param3;
         this.var_2248 = param4;
         this.var_2245 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2244;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2247;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2246;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2248;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2245;
      }
   }
}
