@ComponentV2
export struct Agreement{
  build() {
    Row(){
      Text('已阅读并同意小米账号')
        .fontSize(14)
      Text('用户协议')
        .fontSize(14)
        .fontColor($r('app.color.font_primary'))
        .decoration({ type: TextDecorationType.Underline, color: $r('app.color.font_primary') })
      Text('和')
        .fontSize(14)
      Text('隐私政策')
        .fontSize(14)
        .fontColor($r('app.color.font_primary'))
        .decoration({ type: TextDecorationType.Underline, color: $r('app.color.font_primary') })
    }
  }
}
