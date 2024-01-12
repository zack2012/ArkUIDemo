@Entry
@Component
struct TextDemo {
  build() {
    Column() {
      Text() {
        Span('Hello World\n')
        ImageSpan($r('app.media.app_icon'))
          .width('200px')
          .height('200px')
        Span('Zack')
          .fontSize(32)
      }
      .textShadow({radius: 10})
      .fontColor(Color.Red)
      .decoration({
        type: TextDecorationType.Overline
      })
    }
    .size({width: '100%', height: '100%'})
    .justifyContent(FlexAlign.Center)
  }
}