package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2913:uint;
      
      private var var_151:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_262:IWindowContext;
      
      private var var_1287:IMouseDraggingService;
      
      private var var_1283:IMouseScalingService;
      
      private var var_1286:IMouseListenerService;
      
      private var var_1282:IFocusManagerService;
      
      private var var_1284:IToolTipAgentService;
      
      private var var_1285:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2913 = 0;
         this.var_151 = param2;
         this.var_262 = param1;
         this.var_1287 = new WindowMouseDragger(param2);
         this.var_1283 = new WindowMouseScaler(param2);
         this.var_1286 = new WindowMouseListener(param2);
         this.var_1282 = new FocusManager(param2);
         this.var_1284 = new WindowToolTipAgent(param2);
         this.var_1285 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1287 != null)
         {
            this.var_1287.dispose();
            this.var_1287 = null;
         }
         if(this.var_1283 != null)
         {
            this.var_1283.dispose();
            this.var_1283 = null;
         }
         if(this.var_1286 != null)
         {
            this.var_1286.dispose();
            this.var_1286 = null;
         }
         if(this.var_1282 != null)
         {
            this.var_1282.dispose();
            this.var_1282 = null;
         }
         if(this.var_1284 != null)
         {
            this.var_1284.dispose();
            this.var_1284 = null;
         }
         if(this.var_1285 != null)
         {
            this.var_1285.dispose();
            this.var_1285 = null;
         }
         this.var_151 = null;
         this.var_262 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1287;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1283;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1286;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1282;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1284;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1285;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
