package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class FurnitureBillboardVisualization extends FurnitureVisualization
   {
       
      
      private var _imageUrl:String;
      
      public function FurnitureBillboardVisualization()
      {
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._imageUrl = null;
      }
      
      override protected function getAdClickUrl(param1:IRoomObjectModel) : String
      {
         return param1.getString(RoomObjectVariableEnum.FURNITURE_BILLBOARD_CLICK_URL);
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         super.update(param1,param2,param3,param4);
      }
      
      override protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(super.updateObject(param1,param2))
         {
            _loc3_ = object;
            if(_loc3_ == null)
            {
               return false;
            }
            _loc4_ = _loc3_.getModel();
            if(_loc4_ != null && this._imageUrl == null)
            {
               _loc5_ = _loc4_.getString(RoomObjectVariableEnum.const_921);
               if(_loc5_ != null)
               {
                  _loc6_ = _loc4_.getString(RoomObjectVariableEnum.const_552);
                  if(_loc6_ == "com.sulake.room.object.logic")
                  {
                     _loc7_ = assetCollection.getAsset(_loc5_);
                     if(_loc7_ != null)
                     {
                        _loc8_ = _loc7_.asset.content as BitmapData;
                        if(_loc8_ != null)
                        {
                           this._imageUrl = _loc5_;
                           Logger.log("billboard visualization got image from url = " + this._imageUrl);
                        }
                     }
                  }
               }
            }
            return true;
         }
         return false;
      }
      
      override protected function getSpriteAssetName(param1:int, param2:int) : String
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc3_:int = getSize(param1);
         var _loc4_:String = type;
         var _loc5_:String = "";
         if(param2 < spriteCount - 1)
         {
            _loc5_ = String.fromCharCode("a".charCodeAt() + param2);
         }
         else
         {
            _loc5_ = "sd";
         }
         if(_loc3_ == 1)
         {
            _loc4_ += "_icon_" + _loc5_;
         }
         else
         {
            _loc6_ = getFrameNumber(param1,param2);
            _loc4_ += "_" + _loc3_ + "_" + _loc5_ + "_" + direction;
            _loc4_ += "_" + _loc6_;
         }
         if(_loc5_ == "b" && this._imageUrl != null)
         {
            if(param1 == 32)
            {
               _loc7_ = this._imageUrl + "_" + _loc3_;
               this.checkAndCreateScaledImage(_loc7_);
               return _loc7_;
            }
            return this._imageUrl;
         }
         return _loc4_;
      }
      
      private function checkAndCreateScaledImage(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:IGraphicAsset = assetCollection.getAsset(param1);
         if(_loc2_ != null)
         {
            return;
         }
         if(this._imageUrl != null)
         {
            _loc3_ = assetCollection.getAsset(this._imageUrl);
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.asset.content as BitmapData;
               if(_loc4_ != null)
               {
                  _loc5_ = new Matrix();
                  _loc5_.scale(0.5,0.5);
                  _loc6_ = new BitmapData(_loc4_.width / 2,_loc4_.height / 2,true,16777215);
                  _loc6_.draw(_loc4_,_loc5_);
                  assetCollection.addAsset(param1,_loc6_,true);
               }
            }
         }
      }
   }
}
