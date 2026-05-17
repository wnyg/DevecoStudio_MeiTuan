@Entry({routeName:"login"})//har没有page属性在module.json5中，其中的页面只能分配路由名称
@Component
export struct AppLogin {
  build() {
    Column() {
      Text('登录-HAR提供的公共页')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

    }
    .width('100%')
    .height('100%')
  }
}
