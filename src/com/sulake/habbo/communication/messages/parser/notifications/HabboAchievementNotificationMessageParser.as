package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1443:int;
      
      private var var_1689:int;
      
      private var var_2323:int;
      
      private var var_1783:int;
      
      private var var_1442:int;
      
      private var var_2347:String = "";
      
      private var var_2346:String = "";
      
      private var var_2345:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1443 = param1.readInteger();
         this.var_2347 = param1.readString();
         this.var_1689 = param1.readInteger();
         this.var_2323 = param1.readInteger();
         this.var_1783 = param1.readInteger();
         this.var_1442 = param1.readInteger();
         this.var_2345 = param1.readInteger();
         this.var_2346 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1443;
      }
      
      public function get points() : int
      {
         return this.var_1689;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2323;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1783;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1442;
      }
      
      public function get badgeID() : String
      {
         return this.var_2347;
      }
      
      public function get achievementID() : int
      {
         return this.var_2345;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2346;
      }
   }
}
