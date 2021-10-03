package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_968:String = "";
      
      private var var_617:String = "";
      
      private var var_2128:String = "";
      
      private var var_2129:int;
      
      private var var_2132:int = 0;
      
      private var var_2133:String = "";
      
      private var var_2134:int = 0;
      
      private var var_2130:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2129;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2129 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_968;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_968 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_617 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2128;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2128 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2132;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2132 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2133;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2133 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2134;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2134 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2130;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2130 = param1;
      }
   }
}
