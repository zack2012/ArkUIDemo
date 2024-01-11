@Entry
@Component
export struct SwiperComponent {
  private swiperController: SwiperController = new SwiperController()

  build() {
    Column() {
      Swiper(this.swiperController) {
        Text("0")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .fontSize(30)

        Text("1")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
          .textAlign(TextAlign.Center)
          .fontSize(30)

        Text("2")
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Pink)
          .textAlign(TextAlign.Center)
          .fontSize(30)
      }
      .height('30%')
      .loop(true)
      .autoPlay(true)
      .interval(1000)
      .prevMargin(30)
      .nextMargin(30)
      .indicator(
        Indicator.dot()
          .left(0.01)
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(30)
          .selectedItemHeight(15)
          .color(Color.Red)
          .selectedColor(Color.Blue)
      )
    }
  }
}
