onClipEvent(enterFrame){
   var size = random(20) + 2;
   this.glowIFilter.blurX = this.glowIFilter.blurY = size;
   var size = random(200) + 50;
   this.glowOFilter.blurX = this.glowOFilter.blurX = size;
   this.filters = new Array(this.glowIFilter,this.glowOFilter);
}
