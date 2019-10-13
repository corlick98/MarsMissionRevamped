function Weapon(parent, shooter, type, x, y, tx, ty, target)
{
   this.parent = parent;
   this.shooter = shooter;
   this.type = type;
   this.posX = x;
   this.posY = y;
   this.targetX = tx;
   this.targetY = ty;
   this.target = target;
   this.arrayPos = this.parent.weapons.length;
   this.angle = Math.atan2(ty - y,tx - x) / 6.283185307179586 + 0.25;
   this.speed = 20;
   this.dx = Math.sin(this.angle * 2 * 3.141592653589793) * this.speed;
   this.dy = (- Math.cos(this.angle * 2 * 3.141592653589793)) * this.speed;
   this.posX = this.posX + this.dx;
   this.posY = this.posY + this.dy;
   this.shooter.MCsprite.pulse._x = this.dx;
   this.shooter.MCsprite.pulse._y = - this.shooter.size2 + this.dy;
   this.dmg = 25;
   this.count = 0;
   this.active = true;
   this.MC = this.parent.arena.MC.createEmptyMovieClip("weapon" + this.parent.uniqid++,this.parent.arena.MC.getNextHighestDepth());
   this.MC.swapDepths(this.parent.arena.getZ(this));
   if(this.type == "rocket")
   {
      this.MCsprite = this.MC.attachMovie("weapon","weapon",1);
      this.MCsprite.gotoAndStop(this.type + "_" + this.shooter.team);
      this.MC._yscale = 50;
      this.life = 20;
   }
   else
   {
      var MC = this.MC;
      var _loc2_ = 13041527;
      if(this.shooter.team == "good")
      {
         _loc2_ = 12313073;
      }
      MC.lineStyle(3,_loc2_,100);
      MC.moveTo(this.posX,this.posY / 2);
      MC.lineTo(this.targetX,this.targetY / 2);
      this.filterGlow = new flash.filters.GlowFilter(_loc2_,100,12,12,2,1,false,false);
      MC.filters = new Array(this.filterGlow);
      this.dx = this.dy = 0;
      this.life = 5;
      this.target.pain(this);
   }
   this.handle = function()
   {
      this.count++;
      if(this.count > this.life)
      {
         this.destroy();
      }
      this.move();
      if(this.type == "rocket")
      {
         this.collision();
      }
      this.draw();
   };
   this.move = function()
   {
      this.posX = this.posX + this.dx;
      this.posY = this.posY + this.dy;
   };
   this.collision = function()
   {
      if(this.target.checkForHit(this.posX,this.posY))
      {
         this.target.pain(this);
         this.destroy();
      }
   };
   this.draw = function()
   {
      this.MC.swapDepths(this.parent.arena.getZ(this.posX,this.posY + 100));
      this.MC._alpha = (1 - this.count / this.life) * 100;
      if(this.type == "laser")
      {
         return undefined;
      }
      this.MC._x = this.posX;
      this.MC._y = this.posY / 2;
      this.MCsprite._rotation = this.angle * 360;
   };
   this.destroy = function()
   {
      this.active = false;
      this.MC.removeMovieClip();
   };
}
