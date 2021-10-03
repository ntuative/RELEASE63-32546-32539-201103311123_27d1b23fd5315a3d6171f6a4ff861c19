package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2763:int;
      
      private var var_2766:int;
      
      private var var_834:Boolean;
      
      private var var_2765:int;
      
      private var var_2762:int;
      
      private var var_2767:int;
      
      private var var_2764:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2763 = param1.readInteger();
         this.var_2766 = param1.readInteger();
         this.var_834 = param1.readBoolean();
         this.var_2765 = param1.readInteger();
         this.var_2762 = param1.readInteger();
         this.var_2767 = param1.readInteger();
         this.var_2764 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2763;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2766;
      }
      
      public function get online() : Boolean
      {
         return this.var_834;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2765;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2762;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2767;
      }
      
      public function get banCount() : int
      {
         return this.var_2764;
      }
   }
}
