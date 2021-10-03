package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1607:int;
      
      private var var_1678:int;
      
      private var var_1679:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1678 = param1.readInteger();
         this.var_1607 = param1.readInteger();
         this.var_1679 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1607 = 0;
         this.var_1678 = 0;
         this.var_1679 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1607;
      }
      
      public function get messageId() : int
      {
         return this.var_1678;
      }
      
      public function get timestamp() : String
      {
         return this.var_1679;
      }
   }
}
