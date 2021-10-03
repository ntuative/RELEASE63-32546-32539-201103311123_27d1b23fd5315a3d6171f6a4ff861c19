package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2249:Number = 0.0;
      
      private var var_2250:Number = 0.0;
      
      private var var_2392:Number = 0.0;
      
      private var var_2393:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2249 = param1;
         this.var_2250 = param2;
         this.var_2392 = param3;
         this.var_2393 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2249;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2250;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2392;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2393;
      }
   }
}
