package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1665:String;
      
      private var var_2440:String;
      
      private var var_428:BitmapDataAsset;
      
      private var var_1467:Boolean;
      
      private var var_1468:Boolean;
      
      private var var_2439:Boolean;
      
      private var _offsetX:int;
      
      private var var_1182:int;
      
      private var var_264:int;
      
      private var _height:int;
      
      private var var_788:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1665 = param1;
         this.var_2440 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_428 = _loc9_;
            this.var_788 = false;
         }
         else
         {
            this.var_428 = null;
            this.var_788 = true;
         }
         this.var_1467 = param4;
         this.var_1468 = param5;
         this._offsetX = param6;
         this.var_1182 = param7;
         this.var_2439 = param8;
      }
      
      public function dispose() : void
      {
         this.var_428 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_788 && this.var_428 != null)
         {
            _loc1_ = this.var_428.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_264 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_788 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1468;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1467;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_264;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1665;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2440;
      }
      
      public function get asset() : IAsset
      {
         return this.var_428;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2439;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1467)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1468)
         {
            return this.var_1182;
         }
         return -(this.height + this.var_1182);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1182;
      }
   }
}
