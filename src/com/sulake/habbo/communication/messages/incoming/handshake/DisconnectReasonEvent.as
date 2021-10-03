package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2022:int = 0;
      
      public static const const_1566:int = 1;
      
      public static const const_1551:int = 2;
      
      public static const const_2025:int = 3;
      
      public static const const_1827:int = 4;
      
      public static const const_1849:int = 5;
      
      public static const const_1581:int = 10;
      
      public static const const_1867:int = 11;
      
      public static const const_1937:int = 12;
      
      public static const const_2021:int = 13;
      
      public static const const_1900:int = 16;
      
      public static const const_1810:int = 17;
      
      public static const const_1996:int = 18;
      
      public static const const_1963:int = 19;
      
      public static const const_1961:int = 20;
      
      public static const const_2007:int = 22;
      
      public static const const_1878:int = 23;
      
      public static const const_2000:int = 24;
      
      public static const const_1838:int = 25;
      
      public static const const_1957:int = 26;
      
      public static const const_2006:int = 27;
      
      public static const const_1967:int = 28;
      
      public static const const_1875:int = 29;
      
      public static const const_1909:int = 100;
      
      public static const const_1884:int = 101;
      
      public static const const_1889:int = 102;
      
      public static const const_1826:int = 103;
      
      public static const const_1817:int = 104;
      
      public static const const_1851:int = 105;
      
      public static const const_2014:int = 106;
      
      public static const const_1949:int = 107;
      
      public static const const_1845:int = 108;
      
      public static const const_1910:int = 109;
      
      public static const const_1973:int = 110;
      
      public static const const_1943:int = 111;
      
      public static const const_1892:int = 112;
      
      public static const const_1842:int = 113;
      
      public static const const_1833:int = 114;
      
      public static const const_1859:int = 115;
      
      public static const const_1843:int = 116;
      
      public static const const_2012:int = 117;
      
      public static const const_1907:int = 118;
      
      public static const const_1834:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1566:
            case const_1581:
               return "banned";
            case const_1551:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
