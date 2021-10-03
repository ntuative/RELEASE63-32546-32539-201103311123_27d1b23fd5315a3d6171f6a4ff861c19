package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1970:String = "";
      
      private var var_1667:String = "";
      
      private var var_2172:String = "";
      
      private var var_2387:Number = 0;
      
      private var var_2390:Number = 0;
      
      private var var_2389:Number = 0;
      
      private var var_2388:Number = 0;
      
      private var var_2109:Boolean = false;
      
      private var var_2108:Boolean = false;
      
      private var var_2107:Boolean = false;
      
      private var var_2110:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1970 = param2;
         this.var_1667 = param3;
         this.var_2172 = param4;
         this.var_2387 = param5;
         this.var_2390 = param6;
         this.var_2389 = param7;
         this.var_2388 = param8;
         this.var_2109 = param9;
         this.var_2108 = param10;
         this.var_2107 = param11;
         this.var_2110 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1970;
      }
      
      public function get canvasId() : String
      {
         return this.var_1667;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2172;
      }
      
      public function get screenX() : Number
      {
         return this.var_2387;
      }
      
      public function get screenY() : Number
      {
         return this.var_2390;
      }
      
      public function get localX() : Number
      {
         return this.var_2389;
      }
      
      public function get localY() : Number
      {
         return this.var_2388;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2109;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2108;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2107;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2110;
      }
   }
}
