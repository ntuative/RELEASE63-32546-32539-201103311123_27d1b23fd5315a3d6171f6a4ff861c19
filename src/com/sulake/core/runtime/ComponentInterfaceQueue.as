package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1978:IID;
      
      private var var_820:Boolean;
      
      private var var_1264:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1978 = param1;
         this.var_1264 = new Array();
         this.var_820 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1978;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_820;
      }
      
      public function get receivers() : Array
      {
         return this.var_1264;
      }
      
      public function dispose() : void
      {
         if(!this.var_820)
         {
            this.var_820 = true;
            this.var_1978 = null;
            while(this.var_1264.length > 0)
            {
               this.var_1264.pop();
            }
            this.var_1264 = null;
         }
      }
   }
}
