package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_967:IAssetLoader;
      
      private var var_1665:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1665 = param1;
         this.var_967 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1665;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_967;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_967 != null)
            {
               if(!this.var_967.disposed)
               {
                  this.var_967.dispose();
                  this.var_967 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
