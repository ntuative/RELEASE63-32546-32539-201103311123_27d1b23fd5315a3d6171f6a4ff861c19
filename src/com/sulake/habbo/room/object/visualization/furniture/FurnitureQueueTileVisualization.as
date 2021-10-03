package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1289:int = 3;
      
      private static const const_1428:int = 2;
      
      private static const const_1427:int = 1;
      
      private static const const_1426:int = 15;
       
      
      private var var_295:Array;
      
      private var var_1260:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_295 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1428)
         {
            this.var_295 = new Array();
            this.var_295.push(const_1427);
            this.var_1260 = const_1426;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1260 > 0)
         {
            --this.var_1260;
         }
         if(this.var_1260 == 0)
         {
            if(this.var_295.length > 0)
            {
               super.setAnimation(this.var_295.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
