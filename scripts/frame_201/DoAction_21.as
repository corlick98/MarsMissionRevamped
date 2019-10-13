//Score, Dialog, and encryption
function sendScore(score){
   var _loc2_ = _level0.gamename;
   var _loc1_ = "6a8566530d02deedf2beecbd1868d45f068613ca";
   saveScore(_loc2_,_loc1_,score);
}
function saveScore(gamename, secret, score){
   button_saveScore._visible = false;
   var _loc3_ = new LoadVars();
   var _loc1_ = new LoadVars();
   var _loc2_ = !_level0.serviceurl.length?"http://services.3rd.corp.lego.com/hiscore/default.asmx":_level0.serviceurl;
   var _loc4_ = "SaveScore";
   _loc2_ = _loc2_ + "/" + _loc4_;
   _loc1_.gamename = gamename;
   _loc1_.score = score;
   _loc1_.hash = SHA1(secret + _loc4_ + gamename + score);
   _loc3_ = new LoadVars();
   _loc3_.onData = function(success){
      button_saveScore._visible = true;
   };
   _loc1_.sendAndLoad(_loc2_,_loc3_,"POST");
}
function getScores(MC){
   var _loc13_ = _level0.gamename;
   var _loc16_ = !_level0.serviceurl.length?"http://services.3rd.corp.lego.com/hiscore/default.asmx":_level0.serviceurl;
   var _loc14_ = "GetScores";
   _loc16_ = _loc16_ + "/" + _loc14_ + "?gamename=" + _loc13_;
   this.topMax = 15;
   this.scoreStore = {url:_loc16_,entries:[]};
   this.myXML = new XML();
   this.myXML.parent = this;
   this.myXML.ignoreWhite = true;
   this.myXML.onLoad = function(status){
      if(!status){
         return undefined;
      }
      var _loc2_ = 0;
      while(_loc2_ < this.firstChild.childNodes.length){
         var _loc3_ = String(this.firstChild.childNodes[_loc2_].childNodes[0].firstChild.nodeValue).toUpperCase().substr(0,15);
         var _loc5_ = Number(this.firstChild.childNodes[_loc2_].attributes.score);
         this.parent.scoreStore.entries.push({position:_loc2_ + 1,user:_loc3_,score:_loc5_});
         _loc2_ = _loc2_ + 1;
      }
      this.parent.prepScores();
      delete this.parent.myXML;
   };
   this.prepScores = function(){
      var _loc11_ = 0;
      var _loc10_ = 120;
      var _loc12_ = 16;
      var _loc2_ = 0;
      while(_loc2_ < this.topMax){
         var _loc3_ = this.scoreStore.entries[_loc2_];
         if(_loc3_){
            var _loc8_ = this.scorePopupMC.popup.attachMovie("scoreRow","scoreRow" + _loc2_,_loc2_,{_x:_loc11_,_y:_loc10_ + _loc2_ * _loc12_,position:_loc3_.position,user:_loc3_.user,score:_loc3_.score});
         }
         _loc2_ = _loc2_ + 1;
      }
   };
   this.scorePopupMC = MC.attachMovie("scorePopup","scorePopup",MC.getNextHighestDepth());
   this.myXML.load(this.scoreStore.url);
}
function initDialogue(){
   this.dialogueStore = {url:_level0.xmlurl,length:0};
   this.myXML = new XML();
   this.myXML.parent = this;
   this.myXML.ignoreWhite = true;
   this.myXML.onLoad = function(status){
      if(!status){
         return undefined;
      }
      for(var _loc4_ in this.firstChild.childNodes){
         var _loc2_ = String(this.firstChild.childNodes[_loc4_].nodeName);
         var _loc3_ = String(this.firstChild.childNodes[_loc4_].firstChild.nodeValue);
         this.parent.dialogueStore[_loc2_] = _loc3_;
         this.parent.dialogueStore.length++;
      }
      this.parent.panel = new Panel();
      this.parent.nextFrame();
      delete this.parent.myXML;
   };
   this.myXML.load(this.dialogueStore.url);
}
function dialogue(id){
   var _loc2_ = this.dialogueStore[id];
   if(_loc2_.length){
      return _loc2_;
   }
   return "";
}
function SHA1(str){
   this = SHA1;
   this.hex = function(num){
      var _loc2_ = "";
      var _loc1_ = 7;
      while(_loc1_ >= 0){
         _loc2_ = _loc2_ + hex_chr.charAt(num >> _loc1_ * 4 & 15);
         _loc1_ = _loc1_ - 1;
      }
      return _loc2_;
   };
   this.str2blks = function(str){
      var _loc4_ = (str.length + 8 >> 6) + 1;
      var _loc2_ = new Array(_loc4_ * 16);
      var _loc1_ = 0;
      while(_loc1_ < _loc4_ * 16){
         _loc2_[_loc1_] = 0;
         _loc1_ = _loc1_ + 1;
      }
      _loc1_ = 0;
      while(_loc1_ < str.length){
         _loc2_[_loc1_ >> 2] = _loc2_[_loc1_ >> 2] | str.charCodeAt(_loc1_) << 24 - _loc1_ % 4 * 8;
         _loc1_ = _loc1_ + 1;
      }
      _loc2_[_loc1_ >> 2] = _loc2_[_loc1_ >> 2] | 128 << 24 - _loc1_ % 4 * 8;
      _loc2_[_loc4_ * 16 - 1] = str.length * 8;
      return _loc2_;
   };
   this.addxy = function(x, y){
      var _loc1_ = (x & 65535) + (y & 65535);
      var _loc2_ = (x >> 16) + (y >> 16) + (_loc1_ >> 16);
      return _loc2_ << 16 | _loc1_ & 65535;
   };
   this.rol = function(num, cnt){
      return num << cnt | num >>> 32 - cnt;
   };
   this.ft = function(t, b, c, d){
      if(t < 20){
         return b & c | (~b) & d;
      }
      if(t < 40){
         return b ^ c ^ d;
      }
      if(t < 60){
         return b & c | b & d | c & d;
      }
      return b ^ c ^ d;
   };
   this.kt = function(t){
      if(t < 20){
         return 1518500249;
      }
      if(t < 40){
         return 1859775393;
      }
      if(t < 60){
         return -1894007588;
      }
      return -899497514;
   };
   this.hash = function(str){
      var _loc10_ = this.str2blks(str);
      var _loc3_ = new Array(80);
      var _loc7_ = 1732584193;
      var _loc6_ = -271733879;
      var _loc5_ = -1732584194;
      var _loc4_ = 271733878;
      var _loc8_ = -1009589776;
      var _loc9_ = 0;
      while(_loc9_ < _loc10_.length){
         var _loc15_ = _loc7_;
         var _loc14_ = _loc6_;
         var _loc13_ = _loc5_;
         var _loc12_ = _loc4_;
         var _loc11_ = _loc8_;
         var _loc2_ = 0;
         while(_loc2_ < 80){
            if(_loc2_ < 16){
               _loc3_[_loc2_] = _loc10_[_loc9_ + _loc2_];
            } else{
               _loc3_[_loc2_] = this.rol(_loc3_[_loc2_ - 3] ^ _loc3_[_loc2_ - 8] ^ _loc3_[_loc2_ - 14] ^ _loc3_[_loc2_ - 16],1);
            }
            t = this.addxy(this.addxy(this.rol(_loc7_,5),this.ft(_loc2_,_loc6_,_loc5_,_loc4_)),this.addxy(this.addxy(_loc8_,_loc3_[_loc2_]),this.kt(_loc2_)));
            _loc8_ = _loc4_;
            _loc4_ = _loc5_;
            _loc5_ = this.rol(_loc6_,30);
            _loc6_ = _loc7_;
            _loc7_ = t;
            _loc2_ = _loc2_ + 1;
         }
         _loc7_ = this.addxy(_loc7_,_loc15_);
         _loc6_ = this.addxy(_loc6_,_loc14_);
         _loc5_ = this.addxy(_loc5_,_loc13_);
         _loc4_ = this.addxy(_loc4_,_loc12_);
         _loc8_ = this.addxy(_loc8_,_loc11_);
         _loc9_ = _loc9_ + 16;
      }
      return this.hex(_loc7_) + this.hex(_loc6_) + this.hex(_loc5_) + this.hex(_loc4_) + this.hex(_loc8_);
   };
   return this.hash(str);
}
