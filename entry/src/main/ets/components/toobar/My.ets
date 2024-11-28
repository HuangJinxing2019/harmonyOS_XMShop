@ComponentV2
export struct My{
  @Consumer('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();

  build() {
    Column(){
      Text('我的')
      Button('去登录')
        .onClick(() => {
          this.navPageInfos.pushPath({ name: 'Login' })
        })
    }
  }
}