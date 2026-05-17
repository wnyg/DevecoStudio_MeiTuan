import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { router } from '@kit.ArkUI';
import { add, e1, Emp, TitleBar } from 'mylibrary01';
import { JSON } from '@kit.ArkTS';
import { BottomBar, divide as C, multiply } from 'mylibrary2';

//使用HAR中的”命名路由“必须采用”ES6动态导入“语法
import ('mylibrary2/src/main/ets/pages/AppLogin')

@Entry
@Component
struct Index {
  @State message: string = '外卖-模块首页';
  @State n:number=0
  build() {
    Scroll() {
      Column({space:10}) {

        //使用HSP共享的自定义公共组件
        TitleBar({title:"我爱美团"})
          .onClick(_=>{
            this.n = add(5,6)
          })
        Text(`${this.n}`)

        Text(this.message)
          .fontSize($r('app.float.page_text_font_size'))
        Button("1.跳转到另一个HAP模块（骑行）中的页面")
          .onClick(_=>{
            //不可能使用router跳转到另一个HAP中的页面，因为module.json5>page是独立的
            //只能使用startAbility（）启动另一个HAP的窗口加载它的页面
            let ctx = getContext() as common.UIAbilityContext
            let want:Want ={
              // deviceId:  设备id
              bundleName:"com.tedu.meituan",
              moduleName:"qixing",//挑战其他moduleName必须写，
              abilityName:"QixingAbility",
              // parameters: parameters 这里写加载指定页面
            }
            ctx.startAbility(want)
          })
        Text('//不可能使用router跳转到另一个HAP中的页面，因为module.json5>page是独立的\n' +
          '//只能使用startAbility（）启动另一个HAP的窗口加载它的页面\n' +
          'let ctx = getContext() as common.UIAbilityContext\n' +
          'let want:Want ={\n' +
          '// deviceId:  设备id\n' +
          'bundleName:"com.tedu.meituan",\n' +
          ' moduleName:"qixing",//挑战其他moduleName必须写，\n' +
          ' abilityName:"QixingAbility",\n' +
          '// parameters: parameters 这里写加载指定页面\n' +
          '}' +
          'ctx.startAbility(want)\n' )
        Button('2.跳转到另一个HSP模块(mylibrary01)中的页面')
          .onClick(_=>{
            //HSP没有UIAbility，不能使用startAbility跳转，
            //只能使用router跳转
            router.pushUrl({
              url:'@bundle:com.tedu.meituan/mylibrary01/ets/pages/AppCopyright'
            })
          })
        Text('//不能使用startAbility跳转，因为HSP没有UIAbility\n' +
          '//只能使用router跳转\n' +
          '\n' +
          'router.pushUrl({\n' +
          '  url:\'@bundle:com.tedu.meituan/mylibrary01/ets/pages/AppCopyright\'\n' +
          '\n' +
          '})\n')

        Button('3.调用另一个HSP模块（mylibrary01）的方法和对象')
          .onClick(_=>{
            console.log("--HSP提供的加法：",add(5,5))
            console.log("--HSP提供的对象：",JSON.stringify(e1))
            let e2 =new Emp(5,"shanghai")
            console.log('--HSP提供的类型',JSON.stringify(e2))
          })
        Button('4.跳转到另一个HAR模块（mylibrary2）的页面')
          .onClick(_=>{
            // har没有UIAbility，不具备独立的窗口，不能用StartAbility()进行跳转，只能用router进行跳转
            router.pushNamedRoute({
              name:"login",    //路由名称
              params:{}        //跳转参数
            })
          })

        Button('5.调用另一个HAR模块（mylibrary2）中的公共组件')
          .onClick(_=>{
          })

        Button('6.调用另一个HAR模块（mylibrary2）中的公共方法/对象')
          .onClick(_=>{

            console.log('--乘法运算结果：',multiply(5,5))
            //使用as  divide 取别名 C
            console.log('--除法运算结果：',C(50,2))

          })
        //使用har模块的公共组件
        BottomBar()
      }
      // .height('100%')
      .width('100%')
    }
    .height('100%') // 滚动区域占满屏幕
    // .scrollBar(BarState.On) // 始终显示滚动条
    .scrollable(ScrollDirection.Vertical) // 垂直滚动
  }
}