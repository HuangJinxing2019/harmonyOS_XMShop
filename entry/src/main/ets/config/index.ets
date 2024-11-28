@ObservedV2
export class ToolBarItem {
  @Trace text: string = '';
  @Trace icon: Resource | null = null;
  @Trace activeIcon: Resource | null = null;
  @Trace active: boolean = false;
  constructor(text?: string, icon?: Resource, activeIcon?: Resource, active?: boolean) {
    this.text = text || ''
    this.icon = icon || null
    this.activeIcon = activeIcon || null
    this.active = active || false
  }
}

export const toolBarList: ToolBarItem[] = [
  new ToolBarItem('首页', $r('app.media.home'),  $r('app.media.home_active'), true),
  new ToolBarItem('我的', $r('app.media.my'),  $r('app.media.my_active'), false),
]