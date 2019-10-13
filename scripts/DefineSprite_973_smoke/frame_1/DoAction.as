var max = 20;
var c = 0;
onEnterFrame = function()
{
   c++;
   var _loc2_ = this.attachMovie("puff","puff" + c,c);
   _loc2_._x = random(30) - 15;
   _loc2_._y = random(15) - 8;
   _loc2_._xscale = random(50) + 50;
   _loc2_._yscale = random(50) + 50;
   _loc2_._rotation = random(40) - 20;
   _loc2_._alpha = random(50) + 50;
   if(c > max)
   {
      c = 0;
   }
};
