package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1528:IID;
      
      private var var_1977:String;
      
      private var var_105:IUnknown;
      
      private var var_821:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1528 = param1;
         this.var_1977 = getQualifiedClassName(this.var_1528);
         this.var_105 = param2;
         this.var_821 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1528;
      }
      
      public function get iis() : String
      {
         return this.var_1977;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_105;
      }
      
      public function get references() : uint
      {
         return this.var_821;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_105 == null;
      }
      
      public function dispose() : void
      {
         this.var_1528 = null;
         this.var_1977 = null;
         this.var_105 = null;
         this.var_821 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_821;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_821) : uint(0);
      }
   }
}
