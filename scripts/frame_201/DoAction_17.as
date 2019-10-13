// plays sounds
function SFX(parent){
   if(BUILDMODE){
      return undefined;
   }
   this.parent = parent;
   this.MC = this.parent.MC.attachMovie("soundFX","soundFX",3);
   this.sound = new Sound(this.MC);
   this.buffer = new Array();
   this.handle = function(){
      var _loc2_ = this.buffer.shift();
      if(_loc2_.length){
         this.fire(_loc2_);
      }
   };
   this.play = function(what){
      if(this.buffer.length < 10 || what.substr(0,5) == "music"){
         this.buffer.push(String(what));
      }
   };
   this.fire = function(what){
      this.MC.gotoAndPlay(what);
   };
   this.mute = function(onOrOff){
      this.sound.setVolume(Number(!onOrOff) * 100);
   };
}
