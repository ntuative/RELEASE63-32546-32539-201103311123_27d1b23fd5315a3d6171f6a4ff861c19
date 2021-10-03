package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1443:int;
      
      private var var_312:String;
      
      private var var_2325:int;
      
      private var var_2323:int;
      
      private var var_1783:int;
      
      private var var_2324:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1443 = param1.readInteger();
         this.var_312 = param1.readString();
         this.var_2325 = param1.readInteger();
         this.var_2323 = param1.readInteger();
         this.var_1783 = param1.readInteger();
         this.var_2324 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_312;
      }
      
      public function get level() : int
      {
         return this.var_1443;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2325;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2323;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1783;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2324;
      }
   }
}
