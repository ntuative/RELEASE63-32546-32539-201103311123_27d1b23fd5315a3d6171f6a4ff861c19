package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2377:String;
      
      private var var_2378:String;
      
      private var var_2379:String;
      
      public function WelcomeNotification(param1:String, param2:String, param3:String)
      {
         super();
         this.var_2377 = param1;
         this.var_2378 = param2;
         this.var_2379 = param3;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2377;
      }
      
      public function get titleLocalizationKey() : String
      {
         return this.var_2378;
      }
      
      public function get descriptionLocalizationKey() : String
      {
         return this.var_2379;
      }
   }
}
