
@Entry
@Component
struct HorizontalScrollComponent {
  @State value: number = 0
  @State simpleList: Array<string> = ['one', 'two', 'three', 'four', '123', '1', '2', '3', '5', '56'];
  @State itemHeight: number = 2
  private ratio = 1

  build() {
    Column() {
      Grid() {
        ForEach(this.simpleList, (item: string, index) => {
          GridItem() {
            Stack() {
              Rect().rectStyle(this.ratio)
                .onAreaChange((oldValue, newValue) => {
                  console.log(`${oldValue.height}, ${newValue.height}`)
                  const height = newValue.height as number
                  if (this.itemHeight !== height) {
                    this.itemHeight = height
                  }
                })
              Text(item)
            }
            .clip(true)
            .borderRadius(20)
          }
        }, (item: string) => item)
      }
      .rowsTemplate('1fr')
      .columnsGap(5)
      .width('100%')
      .backgroundColor(Color.Pink)
      .scrollBar(BarState.Off)
      .padding(10)
    }
    .height(this.itemHeight + 20)
  }
}

@Extend(Rect) function rectStyle(ratio: number) {
  .size({ width: '30%' }).fill(Color.Red).aspectRatio(ratio).constraintSize({maxWidth: 150})
}
