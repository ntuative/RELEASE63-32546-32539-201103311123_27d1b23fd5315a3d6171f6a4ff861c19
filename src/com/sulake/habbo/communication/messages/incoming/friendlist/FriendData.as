package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_948:int;
      
      private var var_834:Boolean;
      
      private var var_1677:Boolean;
      
      private var var_617:String;
      
      private var var_1565:int;
      
      private var var_1927:String;
      
      private var var_1925:String;
      
      private var var_1926:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_948 = param1.readInteger();
         this.var_834 = param1.readBoolean();
         this.var_1677 = param1.readBoolean();
         this.var_617 = param1.readString();
         this.var_1565 = param1.readInteger();
         this.var_1927 = param1.readString();
         this.var_1925 = param1.readString();
         this.var_1926 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_948;
      }
      
      public function get online() : Boolean
      {
         return this.var_834;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1677;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function get categoryId() : int
      {
         return this.var_1565;
      }
      
      public function get motto() : String
      {
         return this.var_1927;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1925;
      }
      
      public function get realName() : String
      {
         return this.var_1926;
      }
   }
}
