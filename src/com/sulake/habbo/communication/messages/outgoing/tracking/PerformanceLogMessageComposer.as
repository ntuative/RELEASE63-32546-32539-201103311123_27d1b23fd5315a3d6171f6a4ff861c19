package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2513:int = 0;
      
      private var var_1359:String = "";
      
      private var var_1647:String = "";
      
      private var var_2278:String = "";
      
      private var var_2511:String = "";
      
      private var var_1797:int = 0;
      
      private var var_2509:int = 0;
      
      private var var_2510:int = 0;
      
      private var var_1360:int = 0;
      
      private var var_2512:int = 0;
      
      private var var_1361:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2513 = param1;
         this.var_1359 = param2;
         this.var_1647 = param3;
         this.var_2278 = param4;
         this.var_2511 = param5;
         if(param6)
         {
            this.var_1797 = 1;
         }
         else
         {
            this.var_1797 = 0;
         }
         this.var_2509 = param7;
         this.var_2510 = param8;
         this.var_1360 = param9;
         this.var_2512 = param10;
         this.var_1361 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2513,this.var_1359,this.var_1647,this.var_2278,this.var_2511,this.var_1797,this.var_2509,this.var_2510,this.var_1360,this.var_2512,this.var_1361];
      }
   }
}
