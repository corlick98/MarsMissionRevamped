// Unit 
this.UnitHAL = function(parent, type, obj){
   this.parent = parent;
   this.type = type;
   this.arena = this.parent.parent.arena;
   if(this.type == "roam"){
      if(!obj){
         obj = 10;
      }
      this.roamSize = obj;
      this.roamSize2 = Math.round(this.roamSize / 2);
      this.topLeftX = limit(this.parent.tilePos.x - this.roamSize2,1,this.arena.cols);
      this.topLeftY = limit(this.parent.tilePos.y - this.roamSize2,1,this.arena.rows);
   }
   if(this.type == "guard"){
      this.guard = obj;
   }
   if(this.type == "still"){
      if(obj){
         this.standStill = obj;
      }
   }
   this.handle = function(){
      if(this.parent.target){
         return undefined;
      }
      if(this.parent.stats.boomerang){
         if(this.parent.weaponPayload != this.parent.stats.maxWeaponPayload){
            return undefined;
         }
         if(this.parent.parent.count % 400 < 350){
            return undefined;
         }
         this.parent.target = this.parent.parent.friendlyTarget;
         return undefined;
      }
      if(this.type == "still"){
         if(this.standStill && this.standStill < this.parent.parent.count){
            this.type = "seek";
         }
         return undefined;
      }
      if(this.parent.stats.transformer && random(20) != 0){
         return undefined;
      }
      var _loc3_ = undefined;
      var _loc2_ = undefined;
      if(this.type == "guard"){
         if(!this.guard.active){
            this.type = "seek";
         } else{
            var _loc4_ = this.arena.closestAvailable(this.guard.tilePos);
            _loc3_ = _loc4_.x;
            _loc2_ = _loc4_.y;
         }
      }
      if(this.type == "seek"){
         if(this.parent.stats.repair){
            this.parent.target = this.parent.parent.friendlyTarget;
            return undefined;
         }
         do{
            _loc3_ = random(this.arena.cols);
            _loc2_ = random(this.arena.rows);
         }while(this.arena.tiles[_loc3_][_loc2_]);
      }
      if(this.type == "roam"){
         _loc3_ = limit(random(this.roamSize) + this.topLeftX,1,this.arena.cols);
         _loc2_ = limit(random(this.roamSize) + this.topLeftY,1,this.arena.rows);
      }
      this.parent.nav.voyage(_loc3_,_loc2_,false);
   };
};
