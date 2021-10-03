package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1163:String = "M";
      
      public static const const_1682:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_169:Number = 0;
      
      private var var_168:Number = 0;
      
      private var var_390:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_968:String = "";
      
      private var var_617:String = "";
      
      private var var_2128:String = "";
      
      private var var_2129:int;
      
      private var var_2132:int = 0;
      
      private var var_2133:String = "";
      
      private var var_2134:int = 0;
      
      private var var_2130:int = 0;
      
      private var var_2131:String = "";
      
      private var var_179:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_179 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_179)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_169;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_169 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_168;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_179)
         {
            this.var_168 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_390;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_390 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_179)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_179)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_968;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_968 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_617 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2128;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2128 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2129;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2129 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2132;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2132 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2133;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2133 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2134;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2134 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2130;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_179)
         {
            this.var_2130 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2131;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_179)
         {
            this.var_2131 = param1;
         }
      }
   }
}
