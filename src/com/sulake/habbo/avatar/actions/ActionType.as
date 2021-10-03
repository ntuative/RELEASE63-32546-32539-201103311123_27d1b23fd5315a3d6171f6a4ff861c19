package com.sulake.habbo.avatar.actions
{
   public class ActionType
   {
       
      
      private var _id:int;
      
      private var var_187:int;
      
      private var _prevents:Array;
      
      private var _preventHeadTurn:Boolean = true;
      
      private var var_2022:Boolean = true;
      
      public function ActionType(param1:XML)
      {
         this._prevents = [];
         super();
         this._id = parseInt(param1.@value);
         this.var_187 = parseInt(param1.@value);
         var _loc2_:String = String(param1.@prevents);
         if(_loc2_ != "")
         {
            this._prevents = _loc2_.split(",");
         }
         this._preventHeadTurn = String(param1.@preventheadturn) == "com.sulake.room.object.logic";
         var _loc3_:String = String(param1.@animated);
         if(_loc3_ == "")
         {
            this.var_2022 = true;
         }
         else
         {
            this.var_2022 = _loc3_ == "com.sulake.room.object.logic";
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get value() : int
      {
         return this.var_187;
      }
      
      public function get prevents() : Array
      {
         return this._prevents;
      }
      
      public function get preventHeadTurn() : Boolean
      {
         return this._preventHeadTurn;
      }
      
      public function get isAnimated() : Boolean
      {
         return this.var_2022;
      }
   }
}
