@Entry
@Component
struct Index {
  @State buttonState: ButtonState = ButtonState.Normal
  @State buttonContent: string = 'Click me'

  updateContent(content: string, state: ButtonState = ButtonState.Normal, animated: boolean = true) {
    const update = () => {
      this.buttonContent = content
      this.buttonState = state
    }
    if (animated) {
      animateTo({duration: 150}, () => {
        update()
      })
    } else {
      update()
    }
  }

  build() {
    Column() {
      AirButton({ state: this.buttonState, buttonContent: this.buttonContent, onDidTap: () => {
        setTimeout(() => {
          this.updateContent('Click me', ButtonState.Normal)
        }, 2000)

        if (this.buttonState === ButtonState.Normal) {
          this.updateContent('Loading', ButtonState.Loading)
        } else {
          this.updateContent('Click me', ButtonState.Normal)
        }
      }})
        .constraintSize({
          maxWidth: 200,
        })
        .width('35%')
        .height(30)
        .align(Alignment.Center)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
export struct AirButton {
  @Prop buttonContent: string = ''
  @Prop state: ButtonState = ButtonState.Normal
  onDidTap?: () => void

  build() {
    Button({type: ButtonType.Capsule, stateEffect: true}) {
      if (this.state === ButtonState.Loading) {
        Row({ space: 2 }) {
          LoadingProgress().width(20).color(0xFFFFFF)
          this.Content()
        }
      } else {
        this.Content()
      }
    }
    .width('100%')
    .height('100%')
    .enabled(this.state === ButtonState.Normal)
    .onClick(() => {
      this.onDidTap?.()
    })
  }

  @Builder Content() {
    Text(this.buttonContent).fontSize(12).fontColor(0xffffff)
      .geometryTransition('content')
  }
}

enum ButtonState {
  Normal,
  Loading,
  Disabled
}