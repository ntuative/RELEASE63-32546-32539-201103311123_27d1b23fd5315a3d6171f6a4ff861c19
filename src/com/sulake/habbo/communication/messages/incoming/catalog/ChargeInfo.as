package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2328:int;
      
      private var var_2699:int;
      
      private var var_1096:int;
      
      private var var_1098:int;
      
      private var _activityPointType:int;
      
      private var var_2700:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2328 = param1.readInteger();
         this.var_2699 = param1.readInteger();
         this.var_1096 = param1.readInteger();
         this.var_1098 = param1.readInteger();
         this._activityPointType = param1.readInteger();
         this.var_2700 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2328;
      }
      
      public function get charges() : int
      {
         return this.var_2699;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1096;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1098;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2700;
      }
      
      public function get activityPointType() : int
      {
         return this._activityPointType;
      }
   }
}
