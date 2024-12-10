@ComponentV2
export struct Home {
  build() {
    Column() {
      Column()
        .width('100%')
        .height('126px')
        .backgroundColor(Color.Blue)
      Text('首页')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}