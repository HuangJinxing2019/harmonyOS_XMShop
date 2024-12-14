import { window } from '@kit.ArkUI';

export function mergeObject(target: object, source: object): object{
  for (let key of Object.keys(source)){
    target[key] = source[key]
  }
  return target
}

export function navigationInterception(pageStack: NavPathStack){
  pageStack.setInterception({
    willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
      operation: NavigationOperation, animated: boolean) => {
      if (typeof to === "string") {
        console.log("pageStack --- target page is navigation home page.");
        setWindowLayoutFull(true)
        return;
      } else {
        setWindowLayoutFull(false)
      }
      let target: NavDestinationContext = to as NavDestinationContext;
      console.log('pageStack---' + target.pathInfo.name)
    }
  })
}
export function setWindowLayoutFull(flag: boolean){
  window.getLastWindow(getContext())
    .then(windowClass => {
      if (windowClass == null) {
        console.error("Failed to obtaining the window. Cause: The data is empty");
        return;
      }
      windowClass.setWindowLayoutFullScreen(flag)
    })
}