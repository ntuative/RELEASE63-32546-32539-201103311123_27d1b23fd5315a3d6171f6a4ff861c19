package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2701:Number;
      
      private var var_1913:Number;
      
      private var var_1004:Number;
      
      private var var_545:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2701 = param1;
         this.var_1913 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_1004 = param1;
         this.var_545 = 0;
      }
      
      public function update() : void
      {
         this.var_1004 += this.var_1913;
         this.var_545 += this.var_1004;
         if(this.var_545 > 0)
         {
            this.var_545 = 0;
            this.var_1004 = this.var_2701 * -1 * this.var_1004;
         }
      }
      
      public function get location() : Number
      {
         return this.var_545;
      }
   }
}
