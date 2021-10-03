package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_169:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_2631:Number = 0;
      
      private var var_2628:Number = 0;
      
      private var var_2630:Number = 0;
      
      private var var_2627:Number = 0;
      
      private var var_390:int = 0;
      
      private var var_2562:int = 0;
      
      private var var_333:Array;
      
      private var var_2629:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_333 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_169 = param3;
         this.var_168 = param4;
         this.var_2631 = param5;
         this.var_390 = param6;
         this.var_2562 = param7;
         this.var_2628 = param8;
         this.var_2630 = param9;
         this.var_2627 = param10;
         this.var_2629 = param11;
         this.var_333 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_169;
      }
      
      public function get z() : Number
      {
         return this.var_168;
      }
      
      public function get localZ() : Number
      {
         return this.var_2631;
      }
      
      public function get targetX() : Number
      {
         return this.var_2628;
      }
      
      public function get targetY() : Number
      {
         return this.var_2630;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2627;
      }
      
      public function get dir() : int
      {
         return this.var_390;
      }
      
      public function get dirHead() : int
      {
         return this.var_2562;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2629;
      }
      
      public function get actions() : Array
      {
         return this.var_333.slice();
      }
   }
}
