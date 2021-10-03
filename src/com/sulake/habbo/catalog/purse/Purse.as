package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_182:int = 0;
       
      
      private var var_2414:int = 0;
      
      private var var_1517:Dictionary;
      
      private var var_1943:int = 0;
      
      private var var_1944:int = 0;
      
      private var var_2483:Boolean = false;
      
      private var var_2489:int = 0;
      
      private var var_2484:int = 0;
      
      public function Purse()
      {
         this.var_1517 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2414;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2414 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1943;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1943 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1944;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1944 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1943 > 0 || this.var_1944 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2483;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2483 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2489;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2489 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2484;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2484 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1517;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1517 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1517[param1];
      }
   }
}
