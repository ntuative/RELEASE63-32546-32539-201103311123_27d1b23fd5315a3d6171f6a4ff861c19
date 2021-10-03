package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var _id:int;
      
      private var var_404:int;
      
      private var _type:String;
      
      private var var_1625:String;
      
      private var var_1627:int;
      
      private var var_1626:String;
      
      private var var_721:String;
      
      private var var_1628:String;
      
      private var var_2231:String;
      
      private var var_2230:uint;
      
      private var var_2151:uint;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this.var_404 = param1.readInteger();
         this._type = param1.readString();
         this.var_1625 = param1.readString();
         this.var_1627 = param1.readInteger();
         this.var_1626 = param1.readString();
         this.var_721 = param1.readString();
         this.var_2231 = param1.readString();
         this.var_2151 = param1.readInteger();
         var _loc2_:String = "";
         var _loc3_:int = this.var_721.length - 1;
         while(_loc3_ > 0 && this.isNumber(this.var_721.charAt(_loc3_)))
         {
            _loc2_ = this.var_721.charAt(_loc3_) + _loc2_;
            _loc3_--;
         }
         if(_loc3_ > 0)
         {
            this.var_1628 = this.var_721.substring(0,_loc3_ + 1);
         }
         else
         {
            this.var_1628 = this.var_721;
         }
         this.var_2230 = uint(_loc2_);
      }
      
      private function getNumber(param1:String) : int
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ - 48;
      }
      
      private function isNumber(param1:String) : Boolean
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ >= 48 && _loc2_ <= 57;
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this.var_404 = 0;
         this._type = "";
         this.var_1625 = "";
         this.var_1627 = 0;
         this.var_1626 = "";
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get status() : int
      {
         return this.var_404;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1625;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1627;
      }
      
      public function get endDateTimeStamp() : String
      {
         return this.var_1626;
      }
      
      public function get localizationCode() : String
      {
         return this.var_721;
      }
      
      public function get sortCode() : uint
      {
         return this.var_2230;
      }
      
      public function get sortOrder() : uint
      {
         return this.var_2151;
      }
      
      public function get localizationPrefix() : String
      {
         return this.var_1628;
      }
      
      public function get questBadgeAchievementTypeId() : String
      {
         return this.var_2231;
      }
   }
}
