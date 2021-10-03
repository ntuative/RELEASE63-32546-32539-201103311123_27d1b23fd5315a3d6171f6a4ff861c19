package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;
   import com.sulake.habbo.room.events.RoomObjectWidgetRequestEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.events.MouseEvent;
   
   public class FurnitureJukeboxLogic extends FurnitureMultiStateLogic
   {
       
      
      private var var_1666:Boolean;
      
      private var var_196:Boolean = false;
      
      private var var_2269:int = -1;
      
      public function FurnitureJukeboxLogic()
      {
         super();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectFurnitureActionEvent.const_458,RoomObjectFurnitureActionEvent.const_595,RoomObjectFurnitureActionEvent.const_500,RoomObjectFurnitureActionEvent.const_522,RoomObjectWidgetRequestEvent.const_133];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function dispose() : void
      {
         this.requestDispose();
         super.dispose();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super.processUpdateMessage(param1);
         if(object == null)
         {
            return;
         }
         if(!this.var_196)
         {
            this.requestInit();
         }
         if(object.getModelController().getNumber(RoomObjectVariableEnum.const_810) == 1)
         {
            object.getModelController().setString(RoomWidgetEnum.const_438,RoomWidgetEnum.const_1113);
            _loc2_ = param1 as RoomObjectDataUpdateMessage;
            if(_loc2_ == null)
            {
               return;
            }
            _loc3_ = object.getModelController();
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = object.getState(0);
            if(_loc4_ != this.var_2269)
            {
               this.var_2269 = _loc4_;
               if(_loc4_ == 1)
               {
                  this.requestPlayList();
               }
               else if(_loc4_ == 0)
               {
                  this.requestStopPlaying();
               }
            }
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.DOUBLE_CLICK:
               if(eventDispatcher != null)
               {
                  _loc3_ = object.getId();
                  _loc4_ = object.getType();
                  _loc5_ = new RoomObjectWidgetRequestEvent(RoomObjectWidgetRequestEvent.const_133,_loc3_,_loc4_);
                  eventDispatcher.dispatchEvent(_loc5_);
               }
               break;
            default:
               super.mouseEvent(param1,param2);
         }
      }
      
      private function requestInit() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         this.var_1666 = true;
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_522,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
         this.var_196 = true;
      }
      
      private function requestPlayList() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         this.var_1666 = true;
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_458,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
      
      private function requestStopPlaying() : void
      {
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_595,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
      
      private function requestDispose() : void
      {
         if(!this.var_1666)
         {
            return;
         }
         if(object == null || eventDispatcher == null)
         {
            return;
         }
         var _loc1_:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent(RoomObjectFurnitureActionEvent.const_500,object.getId(),object.getType());
         eventDispatcher.dispatchEvent(_loc1_);
      }
   }
}
