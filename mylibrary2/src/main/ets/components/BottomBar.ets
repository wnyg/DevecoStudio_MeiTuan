//自定义组件快输入  comp
@Preview
@Component
export  struct  BottomBar{
  build() {
    Column(){
      Text('版权所有，达内科技©2026')
      Text('京ICP0002026号')
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#f0f0f0')
  }
}