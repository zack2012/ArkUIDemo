// xxx.ets
@Entry
@Component
struct ProgressExample {
  build() {
    Scroll() {
      Column({ space: 15 }) {
        Text('Linear Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Progress({ value: 10, type: ProgressType.Linear }).width(200)
        Progress({ value: 20, total: 150, type: ProgressType.Linear }).color(Color.Grey).value(50).width(200)


        Text('Eclipse Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Row({ space: 40 }) {
          Progress({ value: 10, type: ProgressType.Eclipse }).width(100)
          Progress({ value: 20, total: 150, type: ProgressType.Eclipse }).color(Color.Grey).value(50).width(100)
        }

        Text('ScaleRing Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Row({ space: 40 }) {
          Progress({ value: 10, type: ProgressType.ScaleRing }).width(100)
          Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
            .color(Color.Grey).value(50).width(100)
            .style({ strokeWidth: 15, scaleCount: 15, scaleWidth: 5 })
        }

        // scaleCount和scaleWidth效果对比
        Row({ space: 40 }) {
          Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
            .color(Color.Grey).value(50).width(100)
            .style({ strokeWidth: 20, scaleCount: 20, scaleWidth: 5 })
          Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
            .color(Color.Grey).value(50).width(100)
            .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 3 })
        }

        Text('Ring Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Row({ space: 40 }) {
          Progress({ value: 10, type: ProgressType.Ring }).width(100)
          Progress({ value: 20, total: 150, type: ProgressType.Ring })
            .color(Color.Grey).value(50).width(100)
            .style({ strokeWidth: 20 })
        }

        Text('Capsule Progress').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Row({ space: 40 }) {
          Progress({ value: 10, type: ProgressType.Capsule }).width(100).height(50)
          Progress({ value: 20, total: 150, type: ProgressType.Capsule })
            .color(Color.Grey)
            .value(50)
            .width(100)
            .height(50)
        }

        Text('Gradient Color').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Progress({ value: 70, total: 100, type: ProgressType.Ring })
          .width(100).style({ strokeWidth: 20 })
          .color(this.gradientColor)

        Text('Shadow').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Progress({ value: 70, total: 100, type: ProgressType.Ring })
          .width(120).color(Color.Orange)
          .style({ strokeWidth: 20, shadow: true })

        Text('Loading Effect').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Progress({ value: 0, total: 100, type: ProgressType.Ring })
          .width(100).color(Color.Blue)
          .style({ strokeWidth: 20, status: ProgressStatus.LOADING })

        Text('Scan Effect').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Progress({ value: 30, total: 100, type: ProgressType.Ring })
          .width(100).color(Color.Orange)
          .style({ strokeWidth: 20, enableScanEffect: true })
      }
    }.width('100%').margin({ top: 30 })
  }

  private gradientColor: LinearGradient = new LinearGradient([{ color: Color.Yellow, offset: 0.5 },
    { color: Color.Orange, offset: 1.0 }])
}
