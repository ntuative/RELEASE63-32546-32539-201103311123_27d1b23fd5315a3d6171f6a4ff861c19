package com.sulake.core.assets
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BitmapDataAsset implements ILazyAsset
   {
      
      protected static var var_569:uint = 0;
      
      protected static var var_558:uint = 0;
       
      
      private var _disposed:Boolean = false;
      
      private var var_105:Object;
      
      private var _bitmap:BitmapData;
      
      private var _offset:Point;
      
      private var var_1467:Boolean = false;
      
      private var var_1468:Boolean = false;
      
      private var var_1761:AssetTypeDeclaration;
      
      private var var_1052:String;
      
      public function BitmapDataAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         this._offset = new Point(0,0);
         super();
         this.var_1761 = param1;
         this.var_1052 = param2;
         ++var_569;
      }
      
      public static function get instances() : uint
      {
         return var_569;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_558;
      }
      
      public function get url() : String
      {
         return this.var_1052;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1467;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1468;
      }
      
      public function get offset() : Point
      {
         return this._offset;
      }
      
      public function get content() : Object
      {
         if(!this._bitmap)
         {
            this.prepareLazyContent();
         }
         return this._bitmap;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1761;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            --var_569;
            if(this._bitmap)
            {
               try
               {
                  var_558 -= this._bitmap.width * this._bitmap.height * 4;
                  this._bitmap.dispose();
               }
               catch(e:Error)
               {
               }
            }
            this.var_105 = null;
            this._bitmap = null;
            this._offset = null;
            this.var_1761 = null;
            this.var_1052 = null;
            this._disposed = true;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         this.var_105 = param1;
         this._bitmap = null;
      }
      
      public function prepareLazyContent() : void
      {
         var _loc1_:* = null;
         if(this.var_105 == null)
         {
            return;
         }
         if(this.var_105 is Class)
         {
            _loc1_ = new this.var_105() as Bitmap;
            if(_loc1_ != null)
            {
               this._bitmap = _loc1_.bitmapData.clone();
               _loc1_.bitmapData.dispose();
               if(this._bitmap != null)
               {
                  var_558 += this._bitmap.width * this._bitmap.height * 4;
                  this.var_105 = null;
                  return;
               }
               throw new Error("Failed to convert Bitmap Class to BitmapDataAsset!");
            }
            this._bitmap = new this.var_105() as BitmapData;
            if(this._bitmap != null)
            {
               this.var_105 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData Class to BitmapDataAsset!");
         }
         if(this.var_105 is Bitmap)
         {
            this._bitmap = Bitmap(this.var_105).bitmapData;
            if(this._bitmap == null)
            {
               throw new Error("Failed to convert Bitmap to BitmapDataAsset!");
            }
            this.var_105 = null;
         }
         if(this.var_105 is BitmapData)
         {
            this._bitmap = this.var_105 as BitmapData;
            if(this._bitmap != null)
            {
               this.var_105 = null;
               return;
            }
            throw new Error("Failed to convert BitmapData to BitmapDataAsset!");
         }
         if(this.var_105 is BitmapDataAsset)
         {
            this._bitmap = BitmapDataAsset(this.var_105)._bitmap;
            this._offset = BitmapDataAsset(this.var_105)._offset;
            this.var_1467 = BitmapDataAsset(this.var_105).var_1467;
            this.var_1468 = BitmapDataAsset(this.var_105).var_1468;
            if(this._bitmap != null)
            {
               this.var_105 = null;
               return;
            }
            throw new Error("Failed to read content from BitmaDataAsset!");
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is BitmapDataAsset)
         {
            this._bitmap = BitmapDataAsset(param1)._bitmap;
            this._offset = BitmapDataAsset(param1)._offset;
            return;
         }
         throw new Error("Provided asset should be of type BitmapDataAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length())
         {
            _loc3_ = param1[_loc2_].attribute("key");
            _loc4_ = param1[_loc2_].attribute("value");
            switch(_loc3_)
            {
               case "offset":
                  _loc5_ = _loc4_.split(",");
                  this._offset.x = parseInt(_loc5_[0]);
                  this._offset.y = parseInt(_loc5_[1]);
                  break;
               case "flipH":
                  this.var_1467 = _loc4_ == "1" || _loc4_ == "com.sulake.room.object.logic";
                  break;
               case "flipV":
                  this.var_1468 = _loc4_ == "1" || _loc4_ == "com.sulake.room.object.logic";
                  break;
            }
            _loc2_++;
         }
      }
   }
}
