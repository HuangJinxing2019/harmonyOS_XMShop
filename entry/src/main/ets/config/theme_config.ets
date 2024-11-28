import { CustomTheme, CustomColors, ThemeControl } from '@kit.ArkUI';
import { PRIMARY_COLOR } from './style_config'
// 自定义主题颜色
class customColors implements CustomColors {
  fontPrimary = Color.Black;
  brand = PRIMARY_COLOR;
}

class PageCustomTheme implements CustomTheme {
  colors?: CustomColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}
export function customThemeColor(){
  // 创建实例
  const BlueColorsTheme = new PageCustomTheme(new customColors());
  // 在页面build之前执行ThemeControl.setDefaultTheme，设置App默认样式风格为BlueColorsTheme。
  ThemeControl.setDefaultTheme(BlueColorsTheme);
}