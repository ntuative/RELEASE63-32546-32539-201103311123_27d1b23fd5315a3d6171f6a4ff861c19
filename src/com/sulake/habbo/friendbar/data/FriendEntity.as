package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_948:int;
      
      private var var_834:Boolean;
      
      private var var_2006:Boolean;
      
      private var var_617:String;
      
      private var var_1565:int;
      
      private var var_1927:String;
      
      private var var_1925:String;
      
      private var var_1926:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1926 = param3;
         this.var_1927 = param4;
         this.var_948 = param5;
         this.var_834 = param6;
         this.var_2006 = param7;
         this.var_617 = param8;
         this.var_1565 = param9;
         this.var_1925 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this.var_2006;
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
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_948 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_834 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_2006 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_617 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1565 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1927 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1925 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1926 = param1;
      }
   }
}
