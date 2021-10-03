package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.communication.messages.incoming.friendlist.HabboSearchResultData;
   import flash.utils.Dictionary;
   
   public class AvatarSearchResults
   {
       
      
      private var var_447:IAvatarSearchDeps;
      
      private var var_228:Array;
      
      private var var_1603:Array;
      
      private var var_1669:Dictionary;
      
      public function AvatarSearchResults(param1:IAvatarSearchDeps)
      {
         this.var_1669 = new Dictionary();
         super();
         this.var_447 = param1;
      }
      
      public function getResult(param1:int) : HabboSearchResultData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in this.var_228)
         {
            if(_loc2_.avatarId == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc3_ in this.var_1603)
         {
            if(_loc3_.avatarId == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function searchReceived(param1:Array, param2:Array) : void
      {
         this.var_228 = param1;
         this.var_1603 = param2;
         this.var_447.view.refreshList();
      }
      
      public function get friends() : Array
      {
         return this.var_228;
      }
      
      public function get others() : Array
      {
         return this.var_1603;
      }
      
      public function setFriendRequestSent(param1:int) : void
      {
         this.var_1669[param1] = "yes";
      }
      
      public function isFriendRequestSent(param1:int) : Boolean
      {
         return this.var_1669[param1] != null;
      }
   }
}
