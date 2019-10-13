function Unit(parent, type, x, y, angle, team, damage, target, obj, respawn)
{
   this.isUnit = true;
   this.parent = parent;
   this.type = type;
   this.tilePos = {x:x,y:y};
   if(angle == undefined)
   {
      angle = random(16) * 0.0625;
   }
   this.angle = angle;
   this.target = target;
   this.respawn = respawn;
   this.posX = this.posY = 0;
   this.active = true;
   this.selected = false;
   this.hilite = false;
   this.pulse = false;
   this.arrayPos = this.parent.units.length - 1;
   if(!team)
   {
      this.team = this.type.substr(3);
   }
   else
   {
      this.team = team;
   }
   this.friend = this.team == this.parent.parent.team;
   this.stats = new UnitStats(this);
   if(!this.friend)
   {
      if(!target)
      {
         target = "seek";
      }
      if(typeof target == "string")
      {
         this.hal = new UnitHAL(this,target,obj);
      }
   }
   if(this.stats.pickup && obj)
   {
      this.freeInside = obj;
   }
   this.squadNumber = "";
   if(this.stats.home && !x && !y)
   {
      this.tilePos = this.parent.arena.closestAvailable(this.stats.home.stats.dockPos);
      this.team = this.stats.home.team;
      this.friend = this.stats.home.friend;
   }
   this.nav = new UnitNav(this);
   if(this.stats.miner && !x && !y)
   {
      this.nav.npath = false;
   }
   this.count = random(1000);
   this.weaponCharge = this.stats.maxWeaponCharge;
   this.weaponPayload = this.stats.maxWeaponPayload;
   this.cargo = 0;
   this.health = this.stats.maxHealth;
   if(damage)
   {
      this.health = this.stats.maxHealth * damage;
   }
   this.healthPerc = Math.ceil(this.health / this.stats.maxHealth * 100);
   this.MC = this.parent.arena.MC.createEmptyMovieClip("unit_" + this.parent.uniqid++,this.parent.arena.MC.getNextHighestDepth());
   this.MCsprite = this.MC.attachMovie("unit","unit",1);
   this.MCsprite.gotoAndStop(this.type);
   this.MCsprite.unit._x = this.MCsprite.shadow._x = (- this.MCsprite.unit.bank._width) / 2;
   this.MCsprite.unit._y = this.MCsprite.shadow._y = (- this.MCsprite.unit.bank._height) / 2;
   this.MCsprite.health._y = - Math.round(this.stats.altitude + this.stats.size2 + 20);
   this.MCsprite.health._xscale = min(500,this.stats.maxHealth * 0.5);
   this.MCsprite.squad._y = this.MCsprite.health._y;
   this.MCsprite.squad._x = this.MCsprite.health._xscale / 10 + 10;
   this.MCsprite.unit.sparks._visible = false;
   this.color = new Color(this.MCsprite.unit);
   this.handle = function()
   {
      this.count++;
      if(this.target && !this.target.active)
      {
         this.target = false;
         if(!this.friend && !this.hal)
         {
            this.hal = new UnitHAL(this,"seek");
         }
      }
      this.engageEnemy();
      this.nav.handle();
      if(!this.active)
      {
         return undefined;
      }
      if(this.deploy)
      {
         this.doDeploy();
      }
      if(this.stats.boomerang && !this.stats.home.active)
      {
         this.destroy();
      }
      if(this.ordered)
      {
         this.parent.parent.sfx.play(this.type + "_comply");
         this.ordered = false;
      }
      this.draw();
      this.parent.arena.radar.addBlip(this);
   };
   this.draw = function()
   {
      this.MC._x = Math.round(this.posX);
      this.MC._y = Math.round(this.posY / 2);
      if(this.stats.altitude > 0)
      {
         var _loc2_ = this.stats.altitude + 100 * Math.sin(this.count / (100 / this.stats.vibrate)) * 0.05;
         this.MC._x = this.MC._x + Math.cos(this.count / this.stats.vibrate) * 6;
         this.MC._y = this.MC._y + Math.cos(this.count / this.stats.vibrate * 0.8) * 3;
         if(random(5) == 1 && this.MCsprite.unit.beam._alpha < 100)
         {
            this.MCsprite.unit.beam._alpha = this.MCsprite.unit.beam._alpha + 25;
         }
         else
         {
            this.MCsprite.unit.beam._alpha = this.MCsprite.unit.beam._alpha * 0.95;
         }
         this.MCsprite.unit.beam._yscale = _loc2_;
      }
      else
      {
         _loc2_ = random(this.stats.vibrate) / 10;
         if(this.nav.progress)
         {
            _loc2_ = _loc2_ + this.stats.speed * random(this.stats.vibrate) / 40;
         }
      }
      this.MCsprite.unit.sparks._alpha = random(100);
      this.MCsprite.unit._y = (- this.MCsprite.unit.bank._height) / 2 - _loc2_;
      this.MCsprite.pulse._y = - _loc2_ - this.stats.size2;
      var _loc4_ = Math.round(this.angle * 16) + 1;
      this.MCsprite.unit.gotoAndStop(this.nav.bank);
      this.MCsprite.unit.bank.gotoAndStop(_loc4_);
      this.MCsprite.shadow.gotoAndStop(_loc4_);
      if(this.stats.transformer)
      {
         if(this.nav.bank == "landing")
         {
            this.MCsprite.shadow.gotoAndStop(_loc4_ + 16);
         }
         if(this.nav.bank == "ground")
         {
            this.MCsprite.shadow.gotoAndStop(_loc4_ + 32);
         }
      }
      this.MC.swapDepths(this.parent.arena.getZ(this));
      this.MCsprite.health._y = this.MCsprite.squad._y = - Math.round(this.stats.altitude + this.stats.size2 + 20);
      this.MCsprite.health._visible = this.MCsprite.squad._visible = this.selected;
      if(this.parent.control.activeTarget == this)
      {
         this.MCsprite.health._visible = true;
         this.MCsprite.health._alpha = 50;
      }
      if(this.selected)
      {
         this.MCsprite.health._alpha = 100;
      }
      this.MCsprite.squad.squad = this.squadNumber;
      this.MCsprite.health.gotoAndStop(this.healthPerc);
      this.MCsprite.pulse._visible = this.pulse;
      this.pulse = false;
      if(this.hilite)
      {
         this.color.setTransform(hiliteColorTransform);
      }
      else
      {
         this.color.setTransform(resetColorTransform);
      }
      this.hilite = false;
      if(this.selected && (this.target || this.nav.path.length > 1))
      {
         var _loc6_ = undefined;
         var _loc5_ = undefined;
         var _loc7_ = this.parent.control.drawMC.getNextHighestDepth();
         var _loc3_ = this.parent.control.drawMC.attachMovie("dashedline","dashedline" + _loc7_,_loc7_);
         if(this.target)
         {
            _loc6_ = this.target.MC._x;
            _loc5_ = this.target.MC._y - this.target.stats.altitude;
         }
         else if(this.nav.npath)
         {
            _loc6_ = (this.nav.npath[this.nav.npath.length - 1].x - 1 + this.nav.offsetX) * this.parent.arena.tileSize;
            _loc5_ = (this.nav.npath[this.nav.npath.length - 1].y - 1 + this.nav.offsetY) * this.parent.arena.tileSize * 0.5;
         }
         else
         {
            _loc6_ = (this.nav.path[this.nav.path.length - 1].x - 1 + this.nav.offsetX) * this.parent.arena.tileSize;
            _loc5_ = (this.nav.path[this.nav.path.length - 1].y - 1 + this.nav.offsetY) * this.parent.arena.tileSize * 0.5;
         }
         _loc3_._x = this.MC._x;
         _loc3_._y = this.MC._y - _loc2_;
         _loc3_._xscale = _loc6_ - this.MC._x;
         _loc3_._yscale = _loc5_ - this.MC._y + _loc2_;
      }
   };
   this.checkForHit = function(x1, y1, x2, y2)
   {
      if(this.stats.pickup)
      {
         return false;
      }
      if(x2 == undefined)
      {
         return distance(this.posX,this.posY - this.stats.altitudeT2 - this.stats.size2,x1,y1) >= this.stats.size?false:this;
      }
      return !(this.posX > x1 && this.posX < x2 && this.posY - this.stats.altitudeT2 > y1 && this.posY - this.stats.altitudeT2 < y2)?false:this;
   };
   this.setBlock = function(x, y)
   {
      if(this.stats.obstruct)
      {
         this.parent.arena.tiles[this.tilePos.x][this.tilePos.y] = false;
         this.parent.arena.tiles[x][y] = this;
      }
      this.tilePos = {x:x,y:y};
      if(this.friend)
      {
         this.parent.arena.shroud.reveal(x,y,this.stats.spread);
      }
   };
   this.freeBlock = function()
   {
      if(this.stats.obstruct)
      {
         this.parent.arena.tiles[this.tilePos.x][this.tilePos.y] = false;
      }
   };
   this.pain = function(weapon)
   {
      this.hilite = true;
      if(weapon.dmg)
      {
         this.makeNoise(this.type + "_pain_" + (random(2) + 1));
         this.health = this.health - weapon.dmg;
         if(this.hal.type == "still")
         {
            this.hal.type = "seek";
         }
      }
      this.healthPerc = Math.ceil(this.health / this.stats.maxHealth * 100);
      if(this.healthPerc <= 0)
      {
         this.destroy();
      }
      if(this.healthPerc <= 25)
      {
         if(!this.MCsprite.unit.smoke && this.stats.mechanical)
         {
            var _loc2_ = this.MCsprite.unit.attachMovie("smoke","smoke",1);
            _loc2_._x = this.MCsprite.unit.bank._width / 2;
            _loc2_._y = this.MCsprite.unit.bank._height / 2;
         }
      }
   };
   this.doRepair = function()
   {
      this.target.hilite = true;
      this.target.health = this.target.stats.maxHealth;
      this.target.MCsprite.unit.smoke.removeMovieClip();
      this.target.MCsprite.building.smoke.removeMovieClip();
      this.target.healthPerc = 100;
      if(this.target.isBuilding)
      {
         if(!this.target.stats.weapon)
         {
            this.target.MCsprite.building.gotoAndPlay("loopstart");
            this.target.MCsprite.shadow.gotoAndStop(15);
         }
      }
      this.makeNoise(this.type + "_action_" + (random(3) + 1));
      this.makeNoise("INT_repair");
      this.destroy(true);
   };
   this.doInfiltrate = function()
   {
      if(this.target.friend && this.target.type == "BA_" + this.parent.parent.team)
      {
         this.parent.lose();
      }
      this.target.hilite = true;
      this.target.team = this.team;
      this.target.friend = this.target.team == this.parent.parent.team;
      this.target.setBlock(true);
      if(this.target.stats.width == 1)
      {
         this.target.MCbaseplate.gotoAndStop(this.target.team + "_1");
      }
      else
      {
         this.target.MCbaseplate.gotoAndStop(this.target.team + "_2");
      }
      this.parent.construction.doPrerequisites(this);
      this.makeNoise(this.type + "_action_" + (random(3) + 1));
      this.makeNoise("INT_infiltrate");
      this.destroy(true);
   };
   this.doEmbark = function(carrier)
   {
      if(!carrier)
      {
         if(this.target.stats.contents.length >= this.target.stats.capacity)
         {
            this.target = false;
            return undefined;
         }
         this.makeNoise(this.type + "_comply");
         this.target.hilite = true;
         this.posX = this.posY = -1000;
         this.target.stats.contents.push(this);
         this.target = false;
         this.selected = false;
      }
      else
      {
         this.makeNoise(this.type + "_comply");
         this.nav.currentX = this.nav.nextX = carrier.tilePos.x;
         this.nav.currentY = this.nav.nextY = carrier.tilePos.y;
         this.posX = (this.nav.currentX + this.nav.offsetX - 1) * this.parent.arena.tileSize;
         this.posY = (this.nav.currentY + this.nav.offsetY - 1) * this.parent.arena.tileSize;
         this.nav.voyage(this.nav.currentX,this.nav.currentY - 1);
         this.hilite = true;
         this.ordered = true;
      }
   };
   this.doDeploy = function()
   {
      if(!this.stats.carrier)
      {
         return undefined;
      }
      if(this.stats.flying && this.nav.landerPerc != 100)
      {
         return undefined;
      }
      while(this.stats.contents.length)
      {
         this.stats.contents.shift().doEmbark(this);
      }
      this.nav.voyage(this.nav.currentX,this.nav.currentY + 1);
      this.hilite = true;
      this.deploy = false;
      this.nav.landerPerc = 75;
      this.nav.still = 0;
      this.nav.hesitate = 0;
      this.ordered = true;
   };
   this.destroy = function(accomplished)
   {
      if(!this.active)
      {
         return undefined;
      }
      this.active = false;
      this.MC.removeMovieClip();
      if(!accomplished)
      {
         this.makeNoise(this.type + "_die");
         this.parent.explode(this.posX,this.posY - this.stats.altitudeT2,!this.stats.mechanical);
      }
      this.freeBlock();
      if(this.stats.carrier)
      {
         for(var _loc2_ in this.stats.contents)
         {
            this.stats.contents[_loc2_].destroy(true);
         }
      }
      if(this.respawn && (this.stats.home.active && this.stats.home.team == this.team || this.stats.pickup))
      {
         var _loc3_ = true;
         if(!this.friend)
         {
            if(this.parent.cashOppo >= this.stats.cost)
            {
               this.parent.cashOppo = this.parent.cashOppo - this.stats.cost;
            }
            else
            {
               _loc3_ = false;
            }
         }
         if(_loc3_)
         {
            this.parent.units.push(new Unit(this.parent,this.type,null,null,null,null,null,null,null,true));
         }
      }
   };
   this.wakeUp = function()
   {
      this.count = this.count + (this.stats.reaction - this.count % this.stats.reaction - random(20));
      this.hilite = true;
      this.ordered = true;
   };
   this.collect = function(collectee)
   {
      if(!this.active)
      {
         return undefined;
      }
      this.makeNoise("INT_collect");
      this.destroy(true);
      if(this.stats.pickup == "special")
      {
         this.parent.win();
      }
      if(this.freeInside == "powerup")
      {
         if(collectee.stats.weapon)
         {
            collectee.stats.maxWeaponCharge = max(collectee.stats.maxWeaponCharge - 1,2);
            collectee.stats.weaponRange = collectee.stats.weaponRange + 25;
         }
         collectee.stats.maxHealth = collectee.stats.maxHealth + 50;
         collectee.health = collectee.stats.maxHealth;
         collectee.MCsprite.health._xscale = min(500,collectee.stats.maxHealth * 0.5);
         collectee.pain();
         this.freeInside = false;
      }
      if(!this.freeInside || typeof this.freeInside == "number")
      {
         var _loc3_ = 2000;
         if(this.freeInside)
         {
            _loc3_ = this.freeInside;
         }
         this.parent.cash = this.parent.cash + _loc3_;
      }
      else if(this.freeInside)
      {
         var _loc4_ = this.parent.arena.closestAvailable(this.tilePos);
         var _loc5_ = this.parent.parent.team;
         if(this.freeInside.substr(-5) == "_oppo")
         {
            this.freeInside = this.freeInside.substr(0,-5);
            _loc5_ = this.parent.parent.oppo;
         }
         this.parent.units.push(new Unit(this.parent,this.freeInside,_loc4_.x,_loc4_.y,null,_loc5_));
      }
   };
   this.engageEnemy = this.parent.engageEnemy;
   this.shoot = this.parent.shoot;
   this.makeNoise = this.parent.makeNoise;
   this.setBlock(this.tilePos.x,this.tilePos.y);
   this.pain();
}
