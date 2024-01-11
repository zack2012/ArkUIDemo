@Preview
@Entry
@Component
struct LoyaltyBadge {
  @State users: Array<string> = [
    'Lv.4Lv.4Lv.4Lv.4Lv.4Lv.4Lv.4Lv.4Lv.4Lv.4Lv.4Lv.4',
    '高级Lv.3',
    'Lv.2',
    'Lv.1',
    'Lv.0'
  ]

  build() {
    Row() {
      Text("199/晚").displayPriority(this.users.length)
      Blank().width(10).displayPriority(this.users.length)
      ForEach(this.users, (item: string, index) => {
        Text(item)
          .badgeStyle()
          .displayPriority(this.users.length - index) // 根据宽度，自动隐藏超出的组件
      }, (item: string) => item)
    }
    .size({width: '100%', height: '100%'})
    .backgroundColor(Color.Green)
    .justifyContent(FlexAlign.Start)
  }
}

@Extend(Text) function badgeStyle() {
  .maxLines(1)
  .textAlign(TextAlign.Center)
  .padding({left: 20, right: 20, top: 4, bottom: 4})
  .constraintSize({minWidth: 80, maxWidth: 100})
  .fontColor(Color.White)
  .fontWeight(600)
  .border({
    radius: {
      bottomLeft: 1000,
      topRight: 1000
    }
  })
  .textOverflow({
    overflow: TextOverflow.Ellipsis
  })
  .backgroundColor(Color.Orange)
  .flexShrink(0)
}