package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_118:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_134:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1249:int = 2;
      
      public static const const_1054:int = 3;
      
      public static const const_1505:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1927:String = "";
      
      private var var_2129:int;
      
      private var var_2132:int = 0;
      
      private var var_2130:int = 0;
      
      private var var_617:String = "";
      
      private var var_45:BitmapData = null;
      
      private var var_274:Array;
      
      private var var_1659:Array;
      
      private var var_1409:int = 0;
      
      private var var_2295:String = "";
      
      private var var_2294:int = 0;
      
      private var var_2296:int = 0;
      
      private var var_1908:Boolean = false;
      
      private var var_1926:String = "";
      
      private var var_2832:Boolean = false;
      
      private var var_2827:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2831:Boolean = false;
      
      private var var_2830:Boolean = false;
      
      private var var_2829:Boolean = false;
      
      private var var_2826:Boolean = false;
      
      private var var_2833:Boolean = false;
      
      private var var_2834:Boolean = false;
      
      private var var_2828:int = 0;
      
      private var var_1906:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_274 = [];
         this.var_1659 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1927 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1927;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2129 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2129;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2132 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2132;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2130 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2130;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_617 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_617;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_45 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_274 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_274;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1659;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1659 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1409 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1409;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2295 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2295;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2832 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2832;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2831 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2831;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2830 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2830;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2829 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2829;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2826 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2826;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2833 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2833;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2834 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2834;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2828 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2828;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2827 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2827;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1906 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1906;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2294 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2294;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2296 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2296;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1908 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1908;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1926 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1926;
      }
   }
}
