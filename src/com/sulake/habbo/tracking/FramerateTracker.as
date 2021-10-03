package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1651:int;
      
      private var var_2353:int;
      
      private var var_816:int;
      
      private var var_494:Number;
      
      private var var_2354:Boolean;
      
      private var var_2355:int;
      
      private var var_1699:int;
      
      private var var_1698:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return this.var_1698;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2353 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2355 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2354 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_816;
         if(this.var_816 == 1)
         {
            this.var_494 = param1;
            this.var_1651 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_816);
            this.var_494 = this.var_494 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2354 && param3 - this.var_1651 >= this.var_2353 && this.var_1699 < this.var_2355)
         {
            this.var_1698 = Math.round(1000 / this.var_494);
            param2.track("performance","averageFramerate",this.var_1698);
            ++this.var_1699;
            this.var_1651 = param3;
            this.var_816 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
