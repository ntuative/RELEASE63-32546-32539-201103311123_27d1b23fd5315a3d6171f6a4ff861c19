package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_312:int;
      
      private var var_2258:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_312 = param1;
         this.var_2258 = param2;
      }
      
      public function get badgeId() : int
      {
         return this.var_312;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2258;
      }
   }
}
