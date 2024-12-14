import { toolBarList, ToolBarItem } from '../config/index'
import { Home } from '../components/toobar/Home'
import { My } from '../components/toobar/My'
import { PRIMARY_COLOR } from '../config/style_config'
import { navigationInterception } from '../libs/utils'
import appStore from '../store/AppStore'

@Entry
@ComponentV2
struct Index {
  @Provider('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();
  @Local active: number = 0;
  aboutToAppear(): void {
    navigationInterception(this.navPageInfos)
  }
  build() {
    Navigation(this.navPageInfos){
      Column(){
        Tabs({ index: 0, barPosition: BarPosition.End }){
          ForEach(toolBarList, (item: ToolBarItem) => {
            TabContent(){
              if(item.text === '首页'){
                Home()
              } else if(item.text === '我的') {
                My()
              }
            }.tabBar(TabBarItem(item))
          }, (item: ToolBarItem) => item.text)
        }
        .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
        .onContentWillChange((currentIndex: number, index: number) => {
          toolBarList.forEach(item => item.active = false)
          toolBarList[index].active = true
          this.active = index
          return true
        })
      }
    }
    .hideToolBar(true)
    .hideTitleBar(true)
  }
}

@Builder function TabBarItem($$: ToolBarItem){
  Column(){
    Image($$.active ? $$.activeIcon : $$.icon)
      .width(32)
      .height(32)
    Text($$.text + appStore.bottomRect?.height)
      .fontColor($$.active ? PRIMARY_COLOR : Color.Gray)
    Row().height(appStore.bottomRect?.height)
      .width('100%')
      .backgroundColor(Color.White)
  }
}