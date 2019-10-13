function Squads(parent)
{
   this.parent = parent;
   this.totalSquads = 9;
   var _loc5_ = 1;
   while(_loc5_ <= this.totalSquads)
   {
      this["squad" + _loc5_] = new Array();
      _loc5_ = _loc5_ + 1;
   }
   this.assign = function(choice, selection)
   {
      var _loc3_ = this["squad" + choice];
      for(var _loc6_ in _loc3_)
      {
         _loc3_[_loc6_].squadNumber = "";
      }
      _loc3_ = this["squad" + choice] = selection.slice();
      var _loc2_ = 1;
      while(_loc2_ <= this.totalSquads)
      {
         if(this["squad" + _loc2_] != (this["squad" + choice] = selection.slice()))
         {
            for(var _loc6_ in this["squad" + choice] = selection.slice())
            {
               for(var _loc4_ in this["squad" + _loc2_])
               {
                  if(this["squad" + choice] = selection.slice()[_loc6_] == this["squad" + _loc2_][_loc4_])
                  {
                     this["squad" + _loc2_] = arraySnipe(this["squad" + _loc2_],_loc4_);
                  }
               }
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      for(var _loc6_ in this["squad" + choice] = selection.slice())
      {
         this["squad" + choice] = selection.slice()[_loc6_].squadNumber = choice;
      }
      this.parent.parent.sfx.play("INT_squad");
   };
   this.retrieve = function(squad)
   {
      var _loc2_ = this["squad" + squad];
      if(_loc2_.length > 0)
      {
         this.parent.parent.sfx.play("INT_squad");
         return _loc2_;
      }
   };
   this.center = function(squad)
   {
      squad = this["squad" + squad];
      if(squad.length == 0)
      {
         return false;
      }
      var _loc5_ = 0;
      var _loc4_ = 0;
      for(var _loc3_ in squad)
      {
         _loc5_ = _loc5_ + squad[_loc3_].posX;
         _loc4_ = _loc4_ + squad[_loc3_].posY;
      }
      _loc5_ = Math.round(_loc5_ / squad.length);
      _loc4_ = Math.round(_loc4_ / squad.length);
      return {x:_loc5_,y:_loc4_};
   };
}
