package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1872:int = 1;
      
      public static const const_1461:int = 2;
       
      
      private var var_1011:String;
      
      private var var_2485:int;
      
      private var var_2491:int;
      
      private var var_2482:int;
      
      private var var_2492:int;
      
      private var var_2490:Boolean;
      
      private var var_2483:Boolean;
      
      private var var_2489:int;
      
      private var var_2484:int;
      
      private var var_2487:Boolean;
      
      private var var_2486:int;
      
      private var var_2488:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1011 = param1.readString();
         this.var_2485 = param1.readInteger();
         this.var_2491 = param1.readInteger();
         this.var_2482 = param1.readInteger();
         this.var_2492 = param1.readInteger();
         this.var_2490 = param1.readBoolean();
         this.var_2483 = param1.readBoolean();
         this.var_2489 = param1.readInteger();
         this.var_2484 = param1.readInteger();
         this.var_2487 = param1.readBoolean();
         this.var_2486 = param1.readInteger();
         this.var_2488 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1011;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2485;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2491;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2482;
      }
      
      public function get responseType() : int
      {
         return this.var_2492;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2490;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2483;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2489;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2484;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2487;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2486;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2488;
      }
   }
}
