package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2578:int;
      
      private var var_2021:String;
      
      private var var_2581:String;
      
      private var var_2582:Boolean;
      
      private var var_2579:Boolean;
      
      private var var_2584:int;
      
      private var var_2583:String;
      
      private var var_2580:String;
      
      private var var_1926:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2578 = param1.readInteger();
         this.var_2021 = param1.readString();
         this.var_2581 = param1.readString();
         this.var_2582 = param1.readBoolean();
         this.var_2579 = param1.readBoolean();
         param1.readString();
         this.var_2584 = param1.readInteger();
         this.var_2583 = param1.readString();
         this.var_2580 = param1.readString();
         this.var_1926 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2578;
      }
      
      public function get avatarName() : String
      {
         return this.var_2021;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2581;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2582;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2579;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2584;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2583;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2580;
      }
      
      public function get realName() : String
      {
         return this.var_1926;
      }
   }
}
