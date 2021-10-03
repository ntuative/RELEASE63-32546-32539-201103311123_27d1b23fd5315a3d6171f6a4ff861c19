package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_545:RoomObjectLocationCacheItem = null;
      
      private var var_207:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_545 = new RoomObjectLocationCacheItem(param1);
         this.var_207 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_545;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_207;
      }
      
      public function dispose() : void
      {
         if(this.var_545 != null)
         {
            this.var_545.dispose();
            this.var_545 = null;
         }
         if(this.var_207 != null)
         {
            this.var_207.dispose();
            this.var_207 = null;
         }
      }
   }
}
