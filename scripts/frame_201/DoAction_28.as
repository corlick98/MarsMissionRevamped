// Controls camera movement
function Camera(parent){
   this.parent = parent;
   this.posX = this.posY = 0;
   this.focus = false;
   this.dx = this.dy = 0;
   this.accelerate = 50;
   this.friction = 0.5;
   this.count = 0;
   this.shake = 0;
   this.quake = 0;
   this.handle = function(){
      this.count++;
      this.prevDX = this.dx;
      this.prevDY = this.dy;
      this.posY = this.posY - this.quake;
      if(this.focus){
         this.posX = this.focus.posX;
         this.posY = this.focus.posY;
         this.dx = this.dy = 0;
         this.focus = false;
      } else{
         if(this.parent.control.UP){
            this.dy = this.dy - this.accelerate;
         }
         if(this.parent.control.RIGHT){
            this.dx = this.dx + this.accelerate;
         }
         if(this.parent.control.DOWN){
            this.dy = this.dy + this.accelerate;
         }
         if(this.parent.control.LEFT){
            this.dx = this.dx - this.accelerate;
         }
         this.dx = this.dx * this.friction;
         this.dy = this.dy * this.friction;
         if(Math.abs(this.dx) < 0.1){
            this.dx = 0;
         }
         if(Math.abs(this.dy) < 0.1){
            this.dy = 0;
         }
         this.posX = this.posX + this.dx;
         this.posY = this.posY + this.dy;
      }
      this.quake = random(this.shake * 2);
      this.posY = this.posY + this.quake;
      if(this.shake > 1){
         this.shake = this.shake * 0.9;
      } else{
         this.shake = 0;
      }
      var _loc2_ = undefined;
      if(this.posX < (_loc2_ = this.parent.arena.viewWidth2)){
         this.posX = _loc2_;
         this.dx = 0;
         if(this.prevDX){
            this.parent.parent.sfx.play("INT_invalid");
         }
      } else if(this.posX > (_loc2_ = this.parent.arena.width - this.parent.arena.viewWidth2)){
         this.posX = _loc2_;
         this.dx = 0;
         if(this.prevDX){
            this.parent.parent.sfx.play("INT_invalid");
         }
      }
      if(this.posY < (_loc2_ = this.parent.arena.viewHeight)){
         this.posY = _loc2_;
         this.dy = 0;
         if(this.prevDY){
            this.parent.parent.sfx.play("INT_invalid");
         }
      }else if(this.posY > (_loc2_ = this.parent.arena.height * 2 - this.parent.arena.viewHeight)){
         this.posY = _loc2_;
         this.dy = 0;
         if(this.prevDY){
            this.parent.parent.sfx.play("INT_invalid");
         }
      }
      if(sgn(this.dx) && sgn(this.prevDX) != sgn(this.dx)){
         this.parent.parent.sfx.play("INT_scrollh");
      }
      if(sgn(this.dy) && sgn(this.prevDY) != sgn(this.dy)){
         this.parent.parent.sfx.play("INT_scrollv");
      }
   };
}
