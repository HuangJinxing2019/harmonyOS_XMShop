@Builder
export  function LoginBuilder(){
  Login()
}

@ComponentV2
struct Login{
  @Consumer('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();
  build() {
    NavDestination(){
      Text('登录页面')
      TextInputExample()
      Button('去注册页面')
        .onClick(() => {
          this.navPageInfos.pushPath({ name: 'Register' })
        })
    }
  }
}

@Component
struct TextInputExample {
 /* @State passWordSrc1: Resource = $r('app.media.onIcon')
  @State passWordSrc2: Resource = $r('app.media.offIcon')*/
  @State textError: string = ''
  @State text: string = ''
  @State nameText: string = 'test'

  @Builder itemEnd() {
    Select([
      { value: 'KB' },
      { value: 'MB' },
      { value: 'GB' },
      { value: 'TB', }
    ])
      .height("48vp")
      .borderRadius(0)
      .selected(2)
      .align(Alignment.Center)
      .value('MB')
      .font({ size: 20, weight: 500 })
      .fontColor('#182431')
      .selectedOptionFont({ size: 20, weight: 400 })
      .optionFont({ size: 20, weight: 400 })
      .backgroundColor(Color.Transparent)
      .responseRegion({ height: "40vp", width: "80%", x: '10%', y: '6vp' })
      .onSelect((index: number) => {
        console.info('Select:' + index)
      })
  }

  build() {
    Column({ space: 20 }) {
      Select([
        { value: 'KB' },
        { value: 'MB' },
        { value: 'GB' },
        { value: 'TB', }
      ]).value('GB')
      // 自定义密码显示图标
      TextInput({ placeholder: 'user define password icon' })
        .type(InputType.Password)
        .width(380)
        .height(60)
        // .passwordIcon({ onIconSrc: this.passWordSrc1, offIconSrc: this.passWordSrc2 })
      // 下划线模式
      TextInput({ placeholder: 'underline style' })
        .showUnderline(true)
        .width(380)
        .height(60)
        .showError('Error')
        .showUnit(this.itemEnd)

      Text(`用户名：${this.text}`)
        .width('95%')
      TextInput({ placeholder: '请输入用户名', text: this.text })
        .showUnderline(true)
        .width(380)
        .showError(this.textError)
        .onChange((value: string) => {
          this.text = value
        })
        .onSubmit((enterKey: EnterKeyType, event: SubmitEvent) => {
          // 用户名不正确会清空输入框和用户名并提示错误文本
          if (this.text == this.nameText) {
            this.textError = ''
          } else {
            this.textError = '用户名输入错误'
            this.text = ''
            // 调用keepEditableState方法，输入框保持编辑态
            event.keepEditableState()
          }
        })

    }.width('100%')
  }
}