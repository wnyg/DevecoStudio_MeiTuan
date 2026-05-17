@Entry
@Component
struct AppCopyright {
  @State message: string = 'App版权声明';

  build() {
    Row() {
      Column() {
        Text(this.message).fontSize($r('app.float.page_text_font_size')).fontWeight(FontWeight.Bold)
        Text('版权声明的详细条款：').fontSize($r('app.float.page_text_font_size'))
        Text('提示：该页面内容来自于HSP模块（mylibrary01）').fontSize($r('app.float.page_text_font_size'))

      }.width('100%')
    }.height('100%')
  }
}