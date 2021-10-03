package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1444:Boolean = false;
      
      private var var_2004:int;
      
      private var var_1680:Array;
      
      private var var_755:Array;
      
      private var var_756:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1444 = _loc2_.isWrappingEnabled;
         this.var_2004 = _loc2_.wrappingPrice;
         this.var_1680 = _loc2_.stuffTypes;
         this.var_755 = _loc2_.boxTypes;
         this.var_756 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1444;
      }
      
      public function get price() : int
      {
         return this.var_2004;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1680;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_755;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_756;
      }
   }
}
