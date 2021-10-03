package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1142:Boolean;
      
      private var var_1141:Boolean;
      
      private var var_1414:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1142;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1141;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1414;
      }
      
      public function flush() : Boolean
      {
         this.var_1142 = false;
         this.var_1141 = false;
         this.var_1414 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1142 = param1.readBoolean();
         this.var_1141 = param1.readBoolean();
         this.var_1414 = param1.readBoolean();
         return true;
      }
   }
}
