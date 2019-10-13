onClipEvent(enterFrame){
   if(this.count <= 10)
   {
      this._alpha = this.count * 20;
   }
   this.count++;
   var size = Math.sin(this.count / 35) * 100;
   this._alpha = size + 200;
}
