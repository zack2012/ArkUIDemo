@Entry
@Component
struct CalendarPickerExample {
  private selectedDate: Date = new Date()
  build() {
    Column() {
      Text('月历日期选择器').fontSize(30)
      Column() {
        CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
          .edgeAlign(CalendarAlign.END)
          .textStyle({ color: "#ff182431", font: { size: 20, weight: FontWeight.Normal } })
          .margin(10)
          .onChange((value) => {
            console.info("CalendarPicker onChange:" + JSON.stringify(value))
          })
      }.alignItems(HorizontalAlign.End).width("100%")
    }.width('100%').margin({top:350})
  }
}
