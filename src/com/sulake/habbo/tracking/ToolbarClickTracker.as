package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1320:IHabboTracking;
      
      private var var_1892:Boolean = false;
      
      private var var_2779:int = 0;
      
      private var var_1987:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1320 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1320 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1892 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2779 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1892)
         {
            return;
         }
         ++this.var_1987;
         if(this.var_1987 <= this.var_2779)
         {
            this.var_1320.track("toolbar",param1);
         }
      }
   }
}
