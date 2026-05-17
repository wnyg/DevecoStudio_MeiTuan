@ComponentV2
export struct TitleBar {
  @Param title:string="美团APP"

  build() {
    Row(){
      Text(this.title)
        .width('100%')
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('45')
    .backgroundColor('#f0f0f0')
  }
}