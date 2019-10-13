function Tile(parent, id, posX, posY, x, y)
{
   this.isTile = true;
   this.parent = parent;
   this.id = id;
   this.posX = posX;
   this.posY = posY;
   this.x = x;
   this.y = y;
   this.tilePos = {x:x,y:y};
   if(!this.id)
   {
      return undefined;
   }
   this.bait = this.parent.parent.parent.data.tileDatumB[this.id];
   var _loc2_ = this.parent.tileMC.getNextHighestDepth();
   if(!this.bait)
   {
      this.MC = this.parent.tileMC.attachMovie("tile","tile" + _loc2_,_loc2_);
      this.MC.gotoAndStop(this.id);
   }
   else
   {
      this.MC = this.parent.tileMC.attachMovie("bait","tile" + _loc2_,_loc2_);
      this.MC.gotoAndStop(1);
   }
   this.MC._x = this.posX;
   this.MC._y = this.posY / 2;
}
