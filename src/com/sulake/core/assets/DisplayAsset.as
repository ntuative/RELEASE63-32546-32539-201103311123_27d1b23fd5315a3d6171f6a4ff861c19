package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_1052:String;
      
      protected var var_195:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_854:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_854 = param1;
         this.var_1052 = param2;
      }
      
      public function get url() : String
      {
         return this.var_1052;
      }
      
      public function get content() : Object
      {
         return this.var_195;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_854;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_195.loaderInfo != null)
            {
               if(this.var_195.loaderInfo.loader != null)
               {
                  this.var_195.loaderInfo.loader.unload();
               }
            }
            this.var_195 = null;
            this.var_854 = null;
            this._disposed = true;
            this.var_1052 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_195 = param1 as DisplayObject;
            if(this.var_195 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_195 = DisplayAsset(param1).var_195;
            this.var_854 = DisplayAsset(param1).var_854;
            if(this.var_195 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_195 = DisplayAsset(param1).var_195;
            this.var_854 = DisplayAsset(param1).var_854;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
