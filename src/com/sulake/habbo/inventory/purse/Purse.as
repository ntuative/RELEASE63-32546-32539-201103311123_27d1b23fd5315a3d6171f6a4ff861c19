package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1943:int = 0;
      
      private var var_1944:int = 0;
      
      private var var_2798:int = 0;
      
      private var var_2799:Boolean = false;
      
      private var var_2483:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1943 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1944 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2798 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2799 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2483 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1943;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1944;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2798;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2799;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2483;
      }
   }
}
