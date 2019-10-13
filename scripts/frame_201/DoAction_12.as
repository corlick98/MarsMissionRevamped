function Indicator(parent, objA, objB, message, conditionType, lifespan)
{
   this.parent = parent;
   this.objA = objA;
   this.objB = objB;
   this.message = message.toUpperCase();
   this.conditionType = conditionType;
   this.lifespan = lifespan;
   if(this.lifespan != undefined && this.lifespan <= 40)
   {
      this.lifespan = 41;
   }
   this.MC = false;
   if(this.conditionType == "selected" || this.conditionType == "voyage")
   {
      this.MC = this.parent.control.indicatorMC;
   }
   if(this.conditionType == "construction")
   {
      this.MC = this.parent.parent.hud.MC.indicator;
   }
   this.updatePos = function(init)
   {
      if(this.conditionType == "construction")
      {
         var _loc3_ = this.parent.construction.options;
         var _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            var _loc2_ = _loc3_[_loc6_];
            if(_loc2_.type == this.objA)
            {
               this.objB = _loc2_;
            }
            _loc6_ = _loc6_ + 1;
         }
      }
      if(this.objA.substr(0,5) == "find:")
      {
         var _loc8_ = this.objA.substr(5);
         var _loc7_ = undefined;
         if(_loc7_ = this.parent.findUnit(_loc8_))
         {
            this.objA = _loc7_;
         }
      }
      if(isArray(this.objA))
      {
         var _loc5_ = 0;
         var _loc4_ = 0;
         for(var _loc6_ in this.objA)
         {
            _loc5_ = _loc5_ + this.objA[_loc6_].posX;
            _loc4_ = _loc4_ + this.objA[_loc6_].posY;
         }
         this.posX = Math.round(_loc5_ / this.objA.length);
         this.posY = Math.round(_loc4_ / this.objA.length);
      }
      else
      {
         this.posX = this.objA.posX;
         this.posY = this.objA.posY;
      }
      if(this.objB)
      {
         if(!init && this.conditionType == "voyage" && !this.objA.selected)
         {
            return undefined;
         }
         this.posX = this.objB.posX;
         this.posY = this.objB.posY;
         if(this.objB.isTile)
         {
            this.posX = this.posX + this.parent.arena.tileSize2;
         }
         if(this.objB.isTile)
         {
            this.posY = this.posY + this.parent.arena.tileSize2;
         }
      }
   };
   this.conditionMet = function()
   {
      this.updatePos();
      if(this.lifespan)
      {
         this.lifespan--;
         if(!this.lifespan)
         {
            return true;
         }
      }
      if(this.conditionType == "focus")
      {
         return true;
      }
      if(this.conditionType == "selected")
      {
         if(isArray(this.objA))
         {
            for(var _loc2_ in this.objA)
            {
               if(!this.objA[_loc2_].selected)
               {
                  return false;
               }
            }
            return true;
         }
         if(this.objA.selected)
         {
            return true;
         }
      }
      if(this.conditionType == "voyage")
      {
         if(this.objA.tilePos.x == this.objB.tilePos.x && this.objA.tilePos.y == this.objB.tilePos.y)
         {
            return true;
         }
      }
      if(this.conditionType == "construction")
      {
         if(this.parent.findBuilding(this.objA))
         {
            return true;
         }
         if(this.parent.findUnit(this.objA))
         {
            return true;
         }
         this.parent.parent.hud.showMessage(dialogue("int_construction_hint"));
      }
      if(this.conditionType == "message")
      {
         if(this.lifespan == undefined || this.lifespan >= 40)
         {
            this.parent.parent.hud.showMessage(this.message);
         }
      }
      return false;
   };
   this.updatePos(true);
}
