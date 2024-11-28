@Builder
export  function RegisterBuilder(){
  Register()
}
@ComponentV2
struct Register{
  @Consumer('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();
  build() {
    NavDestination(){
      Text('注册页面')
      Button('回到首页')
        .onClick(() => {
          this.navPageInfos.clear()
        })
    }
  }
}