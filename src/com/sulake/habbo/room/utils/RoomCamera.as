package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_968:int = 3;
       
      
      private var var_2406:int = -1;
      
      private var var_2410:int = -2;
      
      private var var_353:Vector3d = null;
      
      private var var_437:Vector3d = null;
      
      private var var_1748:Vector3d;
      
      private var var_2409:Boolean = false;
      
      private var _limitedLocY:Boolean = false;
      
      private var var_2408:Boolean = false;
      
      private var var_2407:Boolean = false;
      
      private var var_2404:int = 0;
      
      private var var_2412:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2405:int = 0;
      
      private var var_2411:int = 0;
      
      private var var_1598:int = -1;
      
      private var var_1415:int = 0;
      
      public function RoomCamera()
      {
         this.var_1748 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_437;
      }
      
      public function get targetId() : int
      {
         return this.var_2406;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2410;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1748;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2409;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this._limitedLocY;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2408;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2407;
      }
      
      public function get screenWd() : int
      {
         return this.var_2404;
      }
      
      public function get screenHt() : int
      {
         return this.var_2412;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2405;
      }
      
      public function get roomHt() : int
      {
         return this.var_2411;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1598;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2406 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1748.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2410 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2409 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this._limitedLocY = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2408 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2407 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2404 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2412 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         this._scale = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2405 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2411 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1598 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_353 == null)
         {
            this.var_353 = new Vector3d();
         }
         if(this.var_353.x != param1.x || this.var_353.y != param1.y || this.var_353.z != param1.z)
         {
            this.var_353.assign(param1);
            this.var_1415 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_353 = null;
         this.var_437 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_437 != null)
         {
            return;
         }
         this.var_437 = new Vector3d();
         this.var_437.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_353 != null && this.var_437 != null)
         {
            ++this.var_1415;
            _loc4_ = Vector3d.dif(this.var_353,this.var_437);
            if(_loc4_.length <= param2)
            {
               this.var_437 = this.var_353;
               this.var_353 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_968 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1415 <= const_968)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_437 = Vector3d.sum(this.var_437,_loc4_);
            }
         }
      }
   }
}
