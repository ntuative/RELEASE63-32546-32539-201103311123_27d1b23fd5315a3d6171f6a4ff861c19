package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2316:Boolean;
      
      private var var_2317:int;
      
      private var var_1680:Array;
      
      private var var_755:Array;
      
      private var var_756:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2316;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2317;
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
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1680 = [];
         this.var_755 = [];
         this.var_756 = [];
         this.var_2316 = param1.readBoolean();
         this.var_2317 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1680.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_755.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_756.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
