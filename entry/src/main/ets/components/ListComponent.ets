import os from '@ohos.util';

@Entry
@Component
struct ListComponent {
  @State cities: Array<string> = ["1", "2", "3","4", "5", "6","7", "8", "9"]

  @Builder header(title: string) {
    Text(title).fontSize(30)
  }

  build() {
    Column() {
      List() {
        ListItemGroup({ header: this.header("世界") }) {
          ListItem() { Text('1').fontSize(20) }
          ListItem() { Text('2').fontSize(20) }
          ListItem() { Text('3').fontSize(20) }
          ListItem() { Text('4').fontSize(20) }
          ListItem() { Text('5').fontSize(20) }
          ListItem() { Text('6').fontSize(20) }
        }

        ForEach(this.cities, (item: string) => {
          ListItem() {
            Text(item)
              .fontSize(20)
          }
        }, (item: string) => {
          return item
        })
      }
      .onScrollIndex((start, end, center) => {
        console.log(start.toString(), end.toString(), center.toString())
      })
      .sticky(StickyStyle.Header)
      .width('100%')
      .height(200)
      .alignListItem(ListItemAlign.Center)
      .backgroundColor(Color.Red)
    }
    .justifyContent(FlexAlign.Center)
    .height('100%')
  }
}

@Preview
@Component
struct HorizontalScrollComponent {
  @State simpleList: Array<string> = ['one', 'two', 'three', 'four', '123', '1', '2', '3', '5', '56'];

  build() {
    List({space: 2}) {
      ForEach(this.simpleList, (item: string, index) => {
        ListItem() {
          Stack() {
            Rect().rectStyle(1)
            Text(item)
          }
          .margin(4)
          .clip(true)
          .borderRadius(20)
        }
      }, (item: string) => item)
    }
    .listDirection(Axis.Horizontal)
    .width('100%')
    .backgroundColor(Color.Pink)
  }
}

@Extend(Rect) function rectStyle(ratio: number) {
  .size({ width: '40%' }).fill(Color.Red).aspectRatio(ratio).constraintSize({maxWidth: 150})
}