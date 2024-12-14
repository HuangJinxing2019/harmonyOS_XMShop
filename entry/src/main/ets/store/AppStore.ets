import { AppStorageV2, window } from '@kit.ArkUI';

@ObservedV2
class AppStore{
  @Trace topRect: window.Rect | null = null;
  @Trace bottomRect: window.Rect | null = null;
}
export default AppStorageV2.connect(AppStore, () => new AppStore())!