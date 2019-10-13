onClipEvent(enterFrame){
   if(this.count <= 10)
   {
      this._alpha = this.count * 10;
   }
   this.count++;
   var size = Math.sin(this.count / 20) * 100;
   this.blurFilter.blurX = size;
   this.filters = new Array(this.glowFilter,this.blurFilter);
}
