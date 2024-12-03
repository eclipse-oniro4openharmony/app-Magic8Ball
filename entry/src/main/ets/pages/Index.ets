import { Magic8Ball } from '../entryability/Magic8Ball';

@Entry
@Component
struct Index {
  @State isAnswer: boolean = false;
  private magicBall: Magic8Ball = new Magic8Ball();

  build() {
    Row() {
      Column() {
        Text($r('app.string.ask_label'))
          .fontSize($r('app.integer.default_font_size'))
          .fontWeight(FontWeight.Bold)
        Divider()
          .height(10)
          .color(Color.White)

        Stack({ alignContent: Alignment.Center }) {
          Image($r('app.media.8ball_empty'))
            .autoResize(true)
            .height($r('app.string.half_size'))
          if (this.isAnswer) {
            Text(this.magicBall.drawAnAnswer())
              .fontSize($r('app.integer.default_font_size'))
              .fontColor(Color.White)
              .textAlign(TextAlign.Center)
          } else {
            Image($r('app.media.8center'))
              .autoResize(true)
              .height('23%')
          }
        }

        Button($r('app.string.button_label'))
          .type(ButtonType.Capsule)
          .onClick(() => {
            this.isAnswer = !this.isAnswer;
          })
          .fontSize($r('app.integer.default_font_size'))
          .fontWeight(FontWeight.Bold)
          .height($r('app.integer.button_height'))
      }
      .width('100%')
    }
    .height('100%')
  }
}