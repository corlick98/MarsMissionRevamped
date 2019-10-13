function arraySnipe(original, index)
{
   if(original.length == 1)
   {
      return new Array();
   }
   return original.slice(0,index).concat(original.slice(index + 1,original.length));
}
function ascii2num(char)
{
   var _loc3_ = new Array(" ","!","#","$","%","&","\'","(",")","*","+",",","-",".","/","0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","?","@","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","[","]","^","_","`","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","{","|","}","~","€","ƒ","„","…","†","‡","ˆ","‰","Š","‹","Œ","Ž","‘","’","“","”","•","–","—","˜","™","š","›","œ","","ž","Ÿ","¡","¢","£","¤","¥","¦","§","¨","©","ª","«","¬","­","®","¯","°","±","²","³","´","µ","¶","·","¸","¹","º","»","¼","½","¾","¿","À","Á","Â","Ã","Ä","Å","Æ","Ç","È","É","Ê","Ë","Ì","Í","Î","Ï","Ð","Ñ","Ò","Ó","Ô","Õ","Ö","×","Ø","Ù","Ú","Û","Ü","Ý","Þ","ß","à","á","â","ã","ä","å","æ","ç","è","é","ê","ë","ì","í","î","ï","ð","ñ","ò","ó","ô","õ","ö","÷","ø","ù","ú","û","ü","ý","þ","ÿ");
   var _loc2_ = 0;
   var _loc1_ = 0;
   while(_loc1_ < _loc3_.length)
   {
      if(char == _loc3_[_loc1_])
      {
         _loc2_ = _loc1_;
         return String(_loc2_);
      }
      _loc1_ = _loc1_ + 1;
   }
}
function distance(x1, y1, x2, y2)
{
   var _loc2_ = x1 - x2;
   var _loc1_ = y1 - y2;
   return Math.sqrt(_loc2_ * _loc2_ + _loc1_ * _loc1_);
}
function limit(value, minimum, maximum)
{
   if(value > maximum)
   {
      return maximum;
   }
   if(value < minimum)
   {
      return minimum;
   }
   return value;
}
function min(a, b)
{
   return a >= b?b:a;
}
function max(a, b)
{
   return a <= b?b:a;
}
function sgn(a)
{
   if(a > 0)
   {
      return 1;
   }
   if(a == 0)
   {
      return 0;
   }
   if(a < 0)
   {
      return -1;
   }
}
function shuffle(original)
{
   var _loc1_ = original.slice();
   var _loc5_ = _loc1_.length;
   var _loc3_ = _loc5_;
   while(true)
   {
      _loc3_;
      if(_loc3_--)
      {
         var _loc2_ = random(_loc5_);
         var _loc4_ = _loc1_[_loc3_];
         _loc1_[_loc3_] = _loc1_[_loc2_];
         _loc1_[_loc2_] = _loc4_;
         continue;
      }
      break;
   }
   return _loc1_;
}
function Fractomiser()
{
   this.fractose = new Array(42,48,31,52,3,16,26,97,49,46,33,7,88,4,0,25,80,43,13,78,32,36,74,8,96,6,91,93,54,56,23,21,39,79,10,9,60,35,41,44,51,75,37,47,76,40,18,15,64,30,65,1,28,72,84,24,61,2,62,20,89,95,17,55,57,22,98,71,5,34,14,29,27,66,68,53,99,83,69,94,90,87,12,45,85,73,50,92,59,11,77,82,19,38,81,58,67,86,70,63);
   this.pointer = 0;
   this.spit = function(lower, upper)
   {
      if(!lower)
      {
         lower = 0;
      }
      if(!upper)
      {
         upper = 1;
      }
      if(upper == lower)
      {
         return upper;
      }
      if(lower >= 1)
      {
         lower = 0;
      }
      if(upper <= 0)
      {
         upper = 1;
      }
      if(lower > upper)
      {
         var _loc5_ = lower;
         lower = upper;
         upper = _loc5_;
      }
      this.pointer++;
      if(this.pointer >= 100)
      {
         this.pointer = 0;
      }
      var _loc4_ = this.fractose[this.pointer] / 100;
      if(_loc4_ < lower || _loc4_ > upper)
      {
         return this.spit(lower,upper);
      }
      return _loc4_;
   };
}
function isArray(suspect)
{
   return typeof suspect.shift == "function";
}
resetColorTransform = new Object();
resetColorTransform = {ra:"100",rb:"0",ga:"100",gb:"0",ba:"100",bb:"0",aa:"100",ab:"0"};
hiliteColorTransform = new Object();
hiliteColorTransform = {ra:"100",rb:"255",ga:"100",gb:"255",ba:"100",bb:"255",aa:"100",ab:"0"};
dec2bin = function(dec)
{
   var _loc2_ = "";
   var _loc1_ = dec;
   while(_loc1_ > 0)
   {
      _loc2_ = String(_loc1_ % 2) + _loc2_;
      _loc1_ = Math.floor(_loc1_ / 2);
   }
   if(_loc2_ == "")
   {
      _loc2_ = 0;
   }
   return _loc2_;
};
ucfirst = function(input)
{
   return input.charAt(0).toUpperCase() + input.substr(1).toLowerCase();
};
