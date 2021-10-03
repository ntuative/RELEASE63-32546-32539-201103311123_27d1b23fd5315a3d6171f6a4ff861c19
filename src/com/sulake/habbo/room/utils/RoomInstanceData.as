package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_806:TileHeightMap = null;
      
      private var var_1248:LegacyWallGeometry = null;
      
      private var var_1247:RoomCamera = null;
      
      private var var_805:SelectedRoomObjectData = null;
      
      private var var_807:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_539:Map;
      
      private var var_540:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_539 = new Map();
         this.var_540 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1248 = new LegacyWallGeometry();
         this.var_1247 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_806;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_806 != null)
         {
            this.var_806.dispose();
         }
         this.var_806 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1248;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1247;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_805;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_805 != null)
         {
            this.var_805.dispose();
         }
         this.var_805 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_807;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_807 != null)
         {
            this.var_807.dispose();
         }
         this.var_807 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_806 != null)
         {
            this.var_806.dispose();
            this.var_806 = null;
         }
         if(this.var_1248 != null)
         {
            this.var_1248.dispose();
            this.var_1248 = null;
         }
         if(this.var_1247 != null)
         {
            this.var_1247.dispose();
            this.var_1247 = null;
         }
         if(this.var_805 != null)
         {
            this.var_805.dispose();
            this.var_805 = null;
         }
         if(this.var_807 != null)
         {
            this.var_807.dispose();
            this.var_807 = null;
         }
         if(this.var_539 != null)
         {
            this.var_539.dispose();
            this.var_539 = null;
         }
         if(this.var_540 != null)
         {
            this.var_540.dispose();
            this.var_540 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_539.remove(param1.id);
            this.var_539.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_539.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_539.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_539.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_540.remove(param1.id);
            this.var_540.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_540.length > 0)
         {
            return this.getWallItemDataWithId(this.var_540.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_540.remove(param1);
      }
   }
}
