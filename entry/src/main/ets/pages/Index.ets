import { Magic8Ball } from '../entryability/Magic8Ball';

@Entry
@Component
struct Index {
  @State private answer: ResourceStr = '';
  private readonly magicBall: Magic8Ball<ResourceStr> = new Magic8Ball<ResourceStr>([
    $r('app.string.answer_01'), $r('app.string.answer_02'), $r('app.string.answer_03'),
    $r('app.string.answer_04'), $r('app.string.answer_05'), $r('app.string.answer_06'),
    $r('app.string.answer_07'), $r('app.string.answer_08'), $r('app.string.answer_09'),
    $r('app.string.answer_10'), $r('app.string.answer_11'), $r('app.string.answer_12'),
    $r('app.string.answer_13'), $r('app.string.answer_14'), $r('app.string.answer_15'),
    $r('app.string.answer_16'), $r('app.string.answer_17'), $r('app.string.answer_18'),
    $r('app.string.answer_19'), $r('app.string.answer_20')
  ]);

  private revealAnswer(): void {
    this.answer = this.magicBall.drawAnAnswer();
  }

  build() {
    Column() {
      Text($r('app.string.EntryAbility_label'))
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.ink'))
        .textAlign(TextAlign.Center)
        .width('100%')

      Text(this.answer === '' ? $r('app.string.ask_label') : $r('app.string.answer_label'))
        .fontSize(18)
        .fontColor($r('app.color.ink'))
        .textAlign(TextAlign.Center)
        .margin({ top: 12 })
        .width('100%')

      Column() {
        Stack({ alignContent: Alignment.Center }) {
          if (this.answer === '') {
            Image($r('app.media.8ball_empty'))
              .width('100%')
              .height('100%')
              .objectFit(ImageFit.Contain)
              .accessibilityLevel('no')
          } else {
            Image($r('app.media.8ball_answer'))
              .width('100%')
              .height('100%')
              .objectFit(ImageFit.Contain)
              .accessibilityLevel('no')

            Text(this.answer)
              .fontColor($r('app.color.surface'))
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .maxLines(4)
              .minFontSize(14)
              .maxFontSize(21)
              .width('34%')
              .height('24%')
              .offset({ y: 8 })
              .accessibilityLevel('yes')
          }
        }
        .width('100%')
        .aspectRatio(1)
        .constraintSize({ maxWidth: 300, maxHeight: 300 })
        .onClick(() => this.revealAnswer())
        .accessibilityLevel('yes')
        .accessibilityText($r('app.string.ball_accessibility'))
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)

      Column() {
        if (this.answer === '') {
          Text($r('app.string.tap_ball_hint'))
            .fontSize(17)
            .fontColor($r('app.color.accent'))
            .textAlign(TextAlign.Center)
            .width('100%')
        } else {
          Button($r('app.string.ask_again_button'))
            .type(ButtonType.Capsule)
            .backgroundColor($r('app.color.accent'))
            .fontColor($r('app.color.surface'))
            .fontSize(19)
            .fontWeight(FontWeight.Bold)
            .height(56)
            .width('100%')
            .onClick(() => this.revealAnswer())
        }
      }
      .width('100%')
      .height(64)
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(24)
    .backgroundColor($r('app.color.surface'))
  }
}
