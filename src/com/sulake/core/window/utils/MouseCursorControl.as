package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_32;
      
      private static var var_135:Stage;
      
      private static var var_313:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_761:Boolean = true;
      
      private static var var_121:DisplayObject;
      
      private static var var_1447:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_135 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_121)
            {
               var_135.removeChild(var_121);
               var_135.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_135.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_135.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_135.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_761 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_313;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_313 = param1;
         if(var_313)
         {
            if(var_121)
            {
               var_121.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_121)
         {
            var_121.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_761)
         {
            _loc1_ = var_1447[_type];
            if(_loc1_)
            {
               if(var_121)
               {
                  var_135.removeChild(var_121);
               }
               else
               {
                  var_135.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_135.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_135.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_135.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_121 = _loc1_;
               var_135.addChild(var_121);
            }
            else
            {
               if(var_121)
               {
                  var_135.removeChild(var_121);
                  var_135.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_135.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_135.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_135.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_121 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_32:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_282:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_1470:
                  case MouseCursorType.const_276:
                  case MouseCursorType.const_1680:
                  case MouseCursorType.const_1478:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_761 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1447[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_121)
         {
            var_121.x = param1.stageX - 2;
            var_121.y = param1.stageY;
            if(_type == MouseCursorType.const_32)
            {
               var_313 = false;
               Mouse.show();
            }
            else
            {
               var_313 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_121 && _type != MouseCursorType.const_32)
         {
            Mouse.hide();
            var_313 = false;
         }
      }
   }
}
