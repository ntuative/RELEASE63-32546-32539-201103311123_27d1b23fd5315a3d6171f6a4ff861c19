package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_955:int = 20;
      
      private static const const_608:int = 10;
      
      private static const const_1290:int = 31;
      
      private static const const_1289:int = 32;
      
      private static const const_609:int = 30;
       
      
      private var var_295:Array;
      
      private var var_720:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_295 = new Array();
         super();
         super.setAnimation(const_609);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_720)
            {
               this.var_720 = true;
               this.var_295 = new Array();
               this.var_295.push(const_1290);
               this.var_295.push(const_1289);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_608)
         {
            if(this.var_720)
            {
               this.var_720 = false;
               this.var_295 = new Array();
               if(direction == 2)
               {
                  this.var_295.push(const_955 + 5 - param1);
                  this.var_295.push(const_608 + 5 - param1);
               }
               else
               {
                  this.var_295.push(const_955 + param1);
                  this.var_295.push(const_608 + param1);
               }
               this.var_295.push(const_609);
               return;
            }
            super.setAnimation(const_609);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
