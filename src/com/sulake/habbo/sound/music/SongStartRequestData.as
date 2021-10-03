package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_2085:int;
      
      private var var_1837:Number;
      
      private var var_2563:Number;
      
      private var var_2564:int;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number)
      {
         super();
         this.var_2085 = param1;
         this.var_1837 = param2;
         this.var_2563 = param3;
         this.var_2564 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_2085;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1837 < 0)
         {
            return 0;
         }
         return this.var_1837 + (getTimer() - this.var_2564) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2563;
      }
   }
}
