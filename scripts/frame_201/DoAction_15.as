// binds the hardware controls to their equivalents
// defines behavior for mouse clicking, double clicking,  and dragging
function Control(parent, up, right, down, left, fire){
   Mouse.hide();
   this.parent = parent;
   this.keyUP = up;
   this.keyRIGHT = right;
   this.keyDOWN = down;
   this.keyLEFT = left;
   this.keyFIRE = fire;
   this.UP = this.RIGHT = this.DOWN = this.LEFT = this.FIRE = this.MOUSEDOWN = false;
   this.cursorMC = this.parent.parent.hud.MC.attachMovie("cursor","cursor",9999999);
   this.dragMC = this.parent.arena.MC.attachMovie("drag","drag",9999997);
   this.dragMC._visible = false;
   this.indicatorMC = this.parent.arena.MC.attachMovie("indicator","indicator",9999996);
   this.indicatorMC.arrow.gotoAndStop(this.parent.parent.team);
   this.indicatorMC._visible = false;
   this.still = 0;
   this.posX = 0;
   this.posY = 0;
   this.mouseDownCount = 0;
   this.dblClickCount = 0;
   this.sensitivity = 5;
   this.cursorState = "select";
   this.advancedCursorState = false;
   this.activeTarget = false;
   this.isDragging = false;
   this.active = true;
   this.scrollMargin = 30;
   this.selected = new Array();
   this.handle = function(){
      this.drawMC = this.parent.arena.tileMC.createEmptyMovieClip("draw",9999998);
      this.cursorMC._visible = this.active;
      if(!this.active){
         return undefined;
      }
      if(Key.isDown(27) || MOUSEDOWN && this.parent.parent.hud.MC.exit.hitTest(_xmouse,_ymouse,true)){
         this.parent.parent.hud.popup();
         this.parent.parent.active = false;
         this.cursorMC._visible = false;
         Mouse.show();
         return undefined;
      }
      this.UP = Key.isDown(this.keyUP);
      this.RIGHT = Key.isDown(this.keyRIGHT);
      this.DOWN = Key.isDown(this.keyDOWN);
      this.LEFT = Key.isDown(this.keyLEFT);
      this.FIRE = Key.isDown(this.keyFIRE);
      if(Key.isDown(72)){
         this.parent.camera.focus = this.parent.findBuilding("BA_" + this.parent.parent.team,this.parent.parent.team) || this.parent.findBuilding("BK_" + this.parent.parent.team,this.parent.parent.team);
      }
      this.posX = Math.round(limit(_xmouse,SCREENX - this.parent.arena.viewWidth + 1,SCREENX) - this.parent.arena.posX - (SCREENX - this.parent.arena.viewWidth));
      this.posY = Math.round(limit(_ymouse,1,this.parent.arena.viewHeight) - this.parent.arena.posY) * 2;
      if(this.prevMouseX == _xmouse && this.prevMouseY == _ymouse && this.parent.count > 20){
         this.still++;
      } else{
         this.still = 0;
      }
      this.prevMouseX = _xmouse;
      this.prevMouseY = _ymouse;
      this.tilePos = this.parent.arena.translatePos(this.posX,this.posY);
      if(this.still > 1){
         if(_xmouse > SCREENX - this.scrollMargin && _xmouse < SCREENX){
            this.RIGHT = true;
         } else if(_xmouse < SCREENX - this.parent.arena.viewWidth + this.scrollMargin && _xmouse > SCREENX - this.parent.arena.viewWidth){
            this.LEFT = true;
         }
         if(_xmouse > SCREENX - this.parent.arena.viewWidth){
            if(_ymouse < this.scrollMargin && _ymouse > 0){
               this.UP = true;
            } else if(_ymouse > this.parent.arena.viewHeight - this.scrollMargin && _ymouse < this.parent.arena.viewHeight){
               this.DOWN = true;
            }
         }
      }
      if(MOUSESCROLL > 0){
         this.UP = true;
      }
      if(MOUSESCROLL < 0){
         this.DOWN = true;
      }
      if(this.dblClickCount){
         this.dblClickCount--;
         if(!this.dblClickCount && this.singleClick){
            this.doConfirmedPress();
         }
      }
      if(this.cursorState == "superweapon" && this.advancedCursorState == "superweapon"){
         this.mouseDownCount = 0;
         if(!this.MOUSEDOWN && MOUSEDOWN){
            this.advancedCursorState = false;
            this.cursorState = "standard";
            this.MOUSEDOWN = MOUSEDOWN = false;
            this.pressX = this.posX;
            this.pressY = this.posY;
            this.parent.launchSuperweapon(this.posX,this.posY);
         }
         this.MOUSEDOWN = MOUSEDOWN;
      } else if(this.parent.construction.buildingSite){
         this.MOUSEDOWN = MOUSEDOWN;
         if(this.MOUSEDOWN){
            this.mouseDownCount++;
         } else{
            this.mouseDownCount = 0;
         }
         this.cursorState = "standard";
         if(this.mouseDownCount < 2 && this.MOUSEDOWN && _xmouse > SCREENX - this.parent.arena.viewWidth && this.parent.construction.buildingSite.breakGround()){
            delete this.parent.construction.buildingSite;
            this.mouseDownCount = 0;
            this.MOUSEDOWN = false;
         }
      } else{
         this.doCursor();
         if(!this.MOUSEDOWN && MOUSEDOWN){
            this.doPress();
         }
         if(this.MOUSEDOWN && !MOUSEDOWN){
            this.doRelease();
         }
         this.MOUSEDOWN = MOUSEDOWN;
         if(this.MOUSEDOWN){
            this.mouseDownCount++;
         }
         if(!this.MOUSEDOWN){
            this.isDragging = false;
         }
         var _loc3_ = this.pressX - this.posX;
         var _loc2_ = this.pressY - this.posY;
         if(!this.isDragging && this.MOUSEDOWN && _loc3_ * _loc3_ + _loc2_ * _loc2_ > 2000){
            this.parent.parent.sfx.play("INT_cursor_drag");
            this.isDragging = true;
            this.doDrag(true);
         } else if(this.isDragging){
            this.doDrag();
         }
         this.doSquads();
      }
      if(this.FIRE || ASnative(800,2)(4)){
         this.parent.parent.sfx.play("INT_invalid");
         this.resetSelected();
      }
      this.updateSelected();
      if(_xmouse < SCREENX - this.parent.arena.viewWidth){
         this.cursorState = "standard";
      }
      this.updateCursor();
   };
   this.doCursor = function(){
      this.cursorState = "standard";
      this.activeTarget = false;
      if(this.parent.arena.shroud.active && this.parent.arena.shroud.MC["shroud_" + this.tilePos.x + "_" + this.tilePos.y]._currentframe == 1){
         return undefined;
      }
      for(var _loc2_ in this.parent.units){
         if(this.parent.units[_loc2_].checkForHit(this.posX,this.posY)){
            this.activeTarget = this.parent.units[_loc2_];
            if(this.parent.units[_loc2_].friend){
               this.cursorState = "select";
            }
            break;
         }
      }
      if(!this.activeTarget){
         for(var _loc2_ in this.parent.buildings){
            if(this.parent.buildings[_loc2_].checkForHit(this.posX,this.posY)){
               this.activeTarget = this.parent.buildings[_loc2_];
               if(this.parent.buildings[_loc2_].friend){
                  this.cursorState = "select";
               }
               break;
            }
         }
      }
      if(this.advancedCursorState){
         if(this.activeTarget.isUnit || !this.activeTarget.friend || this.advancedCursorState == "sell" && this.activeTarget.stats.isHQ || this.advancedCursorState == "superweapon"){
            this.activeTarget = false;
         }
         this.cursorState = this.advancedCursorState;
         return undefined;
      }
      if(this.selected.length){
         for(var _loc2_ in this.selected){
            if(this.selected[_loc2_].isUnit){
               this.cursorState = "goto";
               break;
            }
         }
         if(this.activeTarget){
            if(this.activeTarget.friend){
               this.cursorState = "select";
               if(this.activeTarget.selected){
                  this.cursorState = "standard";
               }
               if(this.selected.length == 1 && this.selected[0].stats.home == this.activeTarget && (this.selected[0].stats.miner || this.selected[0].stats.boomerang)){
                  this.cursorState = "infiltrate";
                  return undefined;
               }
               if(this.selected.length == 1 && this.selected[0].stats.carrier && (!this.selected[0].stats.flying || this.selected[0].nav.landerPerc == 100) && this.selected[0].stats.contents.length && this.activeTarget == this.selected[0]){
                  this.cursorState = "deploy";
                  return undefined;
               }
               if(this.activeTarget.stats.repairable && this.activeTarget.healthPerc < 100){
                  for(var _loc2_ in this.selected){
                     if(this.selected[_loc2_].stats.repair){
                        this.cursorState = "repair";
                        return undefined;
                     }
                  }
               }
               if(this.activeTarget.stats.carrier && this.activeTarget.stats.contents.length < this.activeTarget.stats.capacity){
                  for(var _loc2_ in this.selected){
                     if(this.selected[_loc2_].stats.carriable){
                        this.cursorState = "infiltrate";
                        return undefined;
                     }
                  }
               }
            } else{
               if(this.activeTarget.isBuilding){
                  for(var _loc2_ in this.selected){
                     if(this.selected[_loc2_].stats.repair){
                        this.cursorState = "infiltrate";
                        return undefined;
                     }
                  }
               }
               for(var _loc2_ in this.selected){
                  if(!this.selected[_loc2_].stats.weapon){
                     continue;
                  }
                  if(this.activeTarget.stats.flying && this.selected[_loc2_].stats.weapon == "laser" && this.activeTarget.nav.landerPerc < 75){
                     continue;
                  }
                  this.cursorState = "target";
                  return undefined;
               }
            }
         } else{
            var _loc3_ = this.parent.arena.translatePos(this.posX,this.posY);
            if(this.parent.arena.baits[_loc3_.x][_loc3_.y]){
               for(var _loc2_ in this.selected){
                  if(this.selected[_loc2_].stats.miner){
                     this.cursorState = "target";
                     return undefined;
                  }
               }
            }
         }
      }
   };
   this.updateCursor = function(){
      this.cursorMC.gotoAndStop(this.cursorState);
      this.cursorMC._x = _xmouse;
      this.cursorMC._y = _ymouse;
   };
   this.doConfirmedPress = function(){
      for(var _loc2_ in this.selected){
         if(!this.selected[_loc2_].isUnit){
            this.resetSelected();
            return undefined;
         }
         break;
      }
      if(this.selected.length && !Key.isDown(16)){
         var _loc3_ = this.parent.arena.MC.attachMovie("pulse","pulse",99999997);
         _loc3_._x = this.pressX;
         _loc3_._y = this.pressY / 2;
         for(var _loc2_ in this.selected){
            this.selected[_loc2_].freeBlock();
            this.selected[_loc2_].target = false;
         }
         for(var _loc2_ in this.selected){
            this.selected[_loc2_].ordered = true;
            this.selected[_loc2_].nav.voyage(this.pressX,this.pressY,true);
         }
         for(var _loc2_ in this.selected){
            this.selected[_loc2_].setBlock(this.selected[_loc2_].tilePos.x,this.selected[_loc2_].tilePos.y);
         }
         this.parent.parent.sfx.play("INT_cursor_move");
      }
   };
   this.doPress = function(){
      if(this.parent.arena.radar.doMouse(_xmouse,_ymouse)){
         MOUSEDOWN = false;
         return undefined;
      }
      if(this.parent.construction.doMouse(_xmouse,_ymouse)){
         MOUSEDOWN = false;
         return undefined;
      }
      if(_xmouse < SCREENX - this.parent.arena.viewWidth){
         MOUSEDOWN = false;
         return undefined;
      }
      this.pressX = this.posX;
      this.pressY = this.posY;
      this.singleClick = true;
   };
   this.doRelease = function(){
      var _loc3_ = undefined;
      if(this.dblClickCount){
         this.doDblClick();
      } else if(this.isDragging){
         this.doDragRelease();
         this.dblClickCount = 0;
      } else{
         if(this.activeTarget){
            this.singleClick = false;
            if(this.cursorState == "select" || this.cursorState == "standard" && this.activeTarget.friend){
               if(!Key.isDown(16)){
                  this.resetSelected();
               }
               if(this.activeTarget.isBuilding){
                  this.resetSelected();
                  this.selected = new Array(this.activeTarget);
               }
               if(!this.activeTarget.isBuilding && this.selected[0].isBuilding){
                  this.resetSelected();
               }
               this.activeTarget.selected = !this.activeTarget.selected;
               this.parent.parent.sfx.play("INT_cursor_select");
            }
            if(this.cursorState == "target"){
               this.activeTarget.hilite = true;
               for(var _loc2_ in this.selected){
                  if(this.selected[_loc2_].stats.weapon){
                     this.selected[_loc2_].wakeUp();
                     this.selected[_loc2_].target = this.activeTarget;
                  }
               }
               this.parent.parent.sfx.play("INT_cursor_target");
            }
            if(this.cursorState == "repair"){
               if(this.advancedCursorState == "repair"){
                  this.parent.parent.sfx.play("INT_cursor_select");
                  this.activeTarget.repairing = true;
               }
               this.activeTarget.hilite = true;
               for(var _loc2_ in this.selected){
                  if(this.selected[_loc2_].stats.repair){
                     this.selected[_loc2_].wakeUp();
                     this.selected[_loc2_].target = this.activeTarget;
                  }
               }
            }
            if(this.cursorState == "sell"){
               this.parent.parent.sfx.play("INT_cursor_select");
               this.activeTarget.hilite = true;
               this.activeTarget.destroy(true);
            }
            if(this.cursorState == "deploy"){
               this.activeTarget.deploy = true;
            }
            if(this.cursorState == "infiltrate"){
               if(this.activeTarget.friend){
                  if(this.activeTarget.stats.carrier){
                     for(var _loc2_ in this.selected){
                        if(this.selected[_loc2_].stats.carriable){
                           this.selected[_loc2_].wakeUp();
                           this.selected[_loc2_].target = this.activeTarget;
                        }
                     }
                  } else{
                     for(var _loc2_ in this.selected){
                        this.selected[_loc2_].wakeUp();
                        this.selected[_loc2_].nav.returnHome();
                     }
                  }
               } else{
                  for(var _loc2_ in this.selected){
                     if(this.selected[_loc2_].stats.repair){
                        this.selected[_loc2_].wakeUp();
                        this.selected[_loc2_].target = this.activeTarget;
                     }
                  }
               }
               this.activeTarget.hilite = true;
               this.parent.parent.sfx.play("INT_cursor_target");
            }
         }
         this.dblClickCount = this.sensitivity;
      }
      this.mouseDownCount = 0;
   };
   this.doDblClick = function(){
      this.singleClick = false;
      this.dblClickCount = 0;
      this.resetSelected();
   };
   this.doDrag = function(firsttime){
      if(firsttime){
         this.dragMC._visible = true;
         this.dragMC._x = this.pressX;
         this.dragMC._y = this.pressY / 2;
         if(!Key.isDown(16)){
            this.resetSelected();
         }
      }
      this.dragMC._xscale = this.posX - this.pressX;
      this.dragMC._yscale = (this.posY - this.pressY) / 2;
      this.cursorState = "standard";
   };
   this.doDragRelease = function(){
      this.isDragging = false;
      this.dragMC._visible = false;
      var _loc6_ = min(this.posX,this.pressX);
      var _loc4_ = max(this.posX,this.pressX);
      var _loc5_ = min(this.posY,this.pressY);
      var _loc3_ = max(this.posY,this.pressY);
      var _loc2_ = false;
      for(var _loc7_ in this.parent.units){
         if(this.parent.units[_loc7_].checkForHit(_loc6_,_loc5_,_loc4_,_loc3_) && !this.parent.units[_loc7_].selected && this.parent.units[_loc7_].team == this.parent.parent.team){
            this.parent.units[_loc7_].selected = true;
            _loc2_ = true;
         }
      }
      if(_loc2_){
         this.parent.parent.sfx.play("INT_cursor_select");
      }
   };
   this.updateSelected = function(){
      if(this.selected[0].isBuilding){
         return undefined;
      }
      this.selected = new Array();
      for(var _loc2_ in this.parent.units){
         if(this.parent.units[_loc2_].selected){
            this.selected.push(this.parent.units[_loc2_]);
         }
      }
   };
   this.resetSelected = function(){
      this.advancedCursorState = false;
      if(this.cursorState == "superweapon"){
         this.parent.cash = this.parent.cash + this.parent.construction.shortcuts["UK_" + this.parent.parent.team].cost;
      }
      this.cursorState = "standard";
      for(var _loc2_ in this.selected){
         this.selected[_loc2_].selected = false;
      }
      this.selected = new Array();
      if(this.parent.construction.buildingSite){
         this.parent.construction.buildingSite.destroy();
         delete this.parent.construction.buildingSite;
      }
   };
   this.doSquads = function(){
      if(this.ignoreSquads){
         this.ignoreSquads--;
         return undefined;
      }
      if(Key.isDown(81)){
         var _loc2_ = 1;
         while(_loc2_ <= this.parent.squads.totalSquads){
            if(Key.isDown(48 + _loc2_)){
               this.parent.squads.assign(_loc2_,this.selected);
               this.ignoreSquads = 5;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      if(Key.isDown(87)){
         _loc2_ = 1;
         while(_loc2_ <= this.parent.squads.totalSquads){
            if(Key.isDown(48 + _loc2_)){
               if(temp = this.parent.squads.center(_loc2_)){
                  this.parent.camera.posX = temp.x;
                  this.parent.camera.posY = temp.y;
                  this.resetSelected();
                  var temp = this.parent.squads.retrieve(_loc2_);
                  for(var _loc3_ in temp){
                     if(temp[_loc3_].posX >= 0 && temp[_loc3_].posY >= 0){
                        temp[_loc3_].selected = true;
                     }
                  }
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      } else{
         _loc2_ = 1;
         while(_loc2_ <= this.parent.squads.totalSquads){
            if(Key.isDown(48 + _loc2_)){
               var temp = this.parent.squads.retrieve(_loc2_);
               if(temp.length){
                  if(!Key.isDown(16)){
                     this.resetSelected();
                  }
                  for(var _loc3_ in temp){
                     if(temp[_loc3_].posX >= 0 && temp[_loc3_].posY >= 0){
                        temp[_loc3_].selected = true;
                     }
                  }
               }
               this.ignoreSquads = 5;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   };
}
