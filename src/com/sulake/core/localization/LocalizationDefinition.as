package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var var_1962:String;
      
      private var var_1963:String;
      
      private var var_1964:String;
      
      private var _name:String;
      
      private var var_1052:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         this.var_1962 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         this.var_1963 = _loc5_[0];
         this.var_1964 = _loc5_[1];
         this._name = param2;
         this.var_1052 = param3;
      }
      
      public function get id() : String
      {
         return this.var_1962 + "_" + this.var_1963 + "." + this.var_1964;
      }
      
      public function get languageCode() : String
      {
         return this.var_1962;
      }
      
      public function get countryCode() : String
      {
         return this.var_1963;
      }
      
      public function get encoding() : String
      {
         return this.var_1964;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get url() : String
      {
         return this.var_1052;
      }
   }
}
