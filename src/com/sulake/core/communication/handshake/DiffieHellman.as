package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_950:BigInteger;
      
      private var var_2203:BigInteger;
      
      private var var_1616:BigInteger;
      
      private var var_2202:BigInteger;
      
      private var var_1345:BigInteger;
      
      private var var_1615:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1345 = param1;
         this.var_1615 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1345.toString() + ",generator: " + this.var_1615.toString() + ",secret: " + param1);
         this.var_950 = new BigInteger();
         this.var_950.fromRadix(param1,param2);
         this.var_2203 = this.var_1615.modPow(this.var_950,this.var_1345);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1616 = new BigInteger();
         this.var_1616.fromRadix(param1,param2);
         this.var_2202 = this.var_1616.modPow(this.var_950,this.var_1345);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2203.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2202.toRadix(param1);
      }
   }
}
