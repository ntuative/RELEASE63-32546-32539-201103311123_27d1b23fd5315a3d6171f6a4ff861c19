package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_483:uint = 0;
      
      public static const const_1683:uint = 1;
      
      public static const const_1840:int = 0;
      
      public static const const_1874:int = 1;
      
      public static const const_1901:int = 2;
      
      public static const const_1904:int = 3;
      
      public static const const_1469:int = 4;
      
      public static const const_355:int = 5;
      
      public static var var_400:IEventQueue;
      
      private static var var_645:IEventProcessor;
      
      private static var var_1879:uint = const_483;
      
      private static var stage:Stage;
      
      private static var var_159:IWindowRenderer;
       
      
      private var var_2602:EventProcessorState;
      
      private var var_2603:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_213:DisplayObjectContainer;
      
      protected var var_2919:Boolean = true;
      
      protected var var_1313:Error;
      
      protected var var_2093:int = -1;
      
      protected var var_1312:IInternalWindowServices;
      
      protected var var_1573:IWindowParser;
      
      protected var var_2871:IWindowFactory;
      
      protected var var_150:IDesktopWindow;
      
      protected var var_1574:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_566:Boolean = false;
      
      private var var_2604:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_159 = param2;
         this._localization = param4;
         this.var_213 = param5;
         this.var_1312 = new ServiceManager(this,param5);
         this.var_2871 = param3;
         this.var_1573 = new WindowParser(this);
         this.var_2603 = param7;
         if(!stage)
         {
            if(this.var_213 is Stage)
            {
               stage = this.var_213 as Stage;
            }
            else if(this.var_213.stage)
            {
               stage = this.var_213.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_150 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_213.addChild(this.var_150.getDisplayObject());
         this.var_213.doubleClickEnabled = true;
         this.var_213.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2602 = new EventProcessorState(var_159,this.var_150,this.var_150,null,this.var_2603);
         inputMode = const_483;
         this.var_1574 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1879;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_400)
         {
            if(var_400 is IDisposable)
            {
               IDisposable(var_400).dispose();
            }
         }
         if(var_645)
         {
            if(var_645 is IDisposable)
            {
               IDisposable(var_645).dispose();
            }
         }
         switch(value)
         {
            case const_483:
               var_400 = new MouseEventQueue(stage);
               var_645 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1683:
               var_400 = new TabletEventQueue(stage);
               var_645 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_483;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_213.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_213.removeChild(IGraphicContextHost(this.var_150).getGraphicContext(true) as DisplayObject);
            this.var_150.destroy();
            this.var_150 = null;
            this.var_1574.destroy();
            this.var_1574 = null;
            if(this.var_1312 is IDisposable)
            {
               IDisposable(this.var_1312).dispose();
            }
            this.var_1312 = null;
            this.var_1573.dispose();
            this.var_1573 = null;
            var_159 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1313;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2093;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1313 = param2;
         this.var_2093 = param1;
         if(this.var_2919)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1313 = null;
         this.var_2093 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1312;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1573;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2871;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_150;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_150.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1469,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1574;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_150,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_150)
         {
            this.var_150 = null;
         }
         if(param1.state != WindowState.const_491)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_159.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_566 = true;
         if(this.var_1313)
         {
            throw this.var_1313;
         }
         var_645.process(this.var_2602,var_400);
         this.var_566 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2604 = true;
         var_159.update(param1);
         this.var_2604 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_150 != null && !this.var_150.disposed)
         {
            if(this.var_213 is Stage)
            {
               this.var_150.width = Stage(this.var_213).stageWidth;
               this.var_150.height = Stage(this.var_213).stageHeight;
            }
            else
            {
               this.var_150.width = this.var_213.width;
               this.var_150.height = this.var_213.height;
            }
         }
      }
   }
}
