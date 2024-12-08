import { toolBarList, ToolBarItem } from '../config/index'
import { Home } from '../components/toobar/Home'
import { My } from '../components/toobar/My'
import { PRIMARY_COLOR } from '../config/style_config'

@Entry
@ComponentV2
struct Index {
  @Provider('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.navPageInfos){
      Tabs({ index: 1, barPosition: BarPosition.End }){
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
      .onContentWillChange((currentIndex: number, index: number) => {
        toolBarList.forEach(item => item.active = false)
        toolBarList[index].active = true
        return true
      })
    }
    .hideToolBar(true)
  }
}

@Builder function TabBarItem($$: ToolBarItem){
  Column(){
    Image($$.active ? $$.activeIcon : $$.icon)
      .width(32)
      .height(32)
    Text($$.text)
      .fontColor($$.active ? PRIMARY_COLOR : Color.Gray)
  }
}