package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2682:int;
      
      private var var_2683:int;
      
      private var var_2684:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2682 = param1;
         this.var_2683 = param2;
         this.var_2684 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2682,this.var_2683,this.var_2684];
      }
      
      public function dispose() : void
      {
      }
   }
}
