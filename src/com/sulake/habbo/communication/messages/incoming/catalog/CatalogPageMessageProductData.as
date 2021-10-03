package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_75:String = "i";
      
      public static const const_87:String = "s";
      
      public static const const_181:String = "e";
       
      
      private var var_1965:String;
      
      private var var_2169:int;
      
      private var var_1524:String;
      
      private var var_1525:int;
      
      private var var_1966:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1965 = param1.readString();
         this.var_2169 = param1.readInteger();
         this.var_1524 = param1.readString();
         this.var_1525 = param1.readInteger();
         this.var_1966 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1965;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2169;
      }
      
      public function get extraParam() : String
      {
         return this.var_1524;
      }
      
      public function get productCount() : int
      {
         return this.var_1525;
      }
      
      public function get expiration() : int
      {
         return this.var_1966;
      }
   }
}
