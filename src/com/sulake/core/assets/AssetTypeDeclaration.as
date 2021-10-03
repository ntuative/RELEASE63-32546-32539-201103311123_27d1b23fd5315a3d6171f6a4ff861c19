package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2549:String;
      
      private var var_2551:Class;
      
      private var var_2550:Class;
      
      private var var_1829:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2549 = param1;
         this.var_2551 = param2;
         this.var_2550 = param3;
         if(rest == null)
         {
            this.var_1829 = new Array();
         }
         else
         {
            this.var_1829 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2549;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2551;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2550;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1829;
      }
   }
}
