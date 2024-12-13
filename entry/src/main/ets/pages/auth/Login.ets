import { REG_EMAIL, REG_MOBILE, REG_PWD } from '../../libs/reggular';
import { Agreement } from './Components/Agreement'
import { promptAction } from '@kit.ArkUI';
import { login } from '../../apis/auth'

@Builder
export  function LoginBuilder(){
  Login()
}

@ComponentV2
struct Login{
  @Consumer('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();

  build() {
    NavDestination(){
      Column(){
        Image($r('app.media.logo'))
          .width(60)
          .height(60)
          .margin({ top: 100 })
        Text('让每个人都能享受科技的乐意')
          .fontColor($r('app.color.font_secondary'))
          .margin({ top: 10 })
        LoginFormComponent()
        Row(){
          Text('没有账号，去注册>>')
            .fontSize(14)
            .fontColor($r('app.color.font_primary'))
            .onClick(() => {
              this.navPageInfos.pushPath({ name: 'Register' })
            })
        }
        .width('100%')
        .margin({ top: 10 })
        .justifyContent(FlexAlign.End)
        .padding({ right: 30 })
      }
    }
    .title('小米账号登录')
  }
}


@ObservedV2
class LoginForm{
  @Trace account: string | undefined = undefined;
  @Trace password: string | undefined = undefined;
}

interface LoginInfo{
  token: string;
}

@ComponentV2
struct LoginFormComponent{
  @Consumer('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();
  @Local loginForm: LoginForm = new LoginForm();
  @Local isAgreement: boolean = false;
  @Local accountErrorText: string = '';
  @Local pwsErrorText: string = '';

  async login(){
    if(!this.isAgreement){
      promptAction.showToast({ message: '请阅读协议' })
      return
    }
    if(!this.validForm()){
      promptAction.showToast({ message: '输入有误' })
      return
    }
    const params: LoginForm = {
      account: this.loginForm.account,
      password: this.loginForm.password
    };
    const loginInfo = await login<LoginInfo>(params);
    console.log('登录信息' + JSON.stringify(loginInfo))
    promptAction.showToast({ message: '登录成功' });
    this.navPageInfos.pop();
  }
  validForm(){
    let flag: boolean = true;
    const loginForm = this.loginForm
    if(!loginForm.account){
      this.accountErrorText = '请输入登录账号'
      flag = false
    } else if(!REG_MOBILE.test(loginForm.account) && !REG_EMAIL.test(loginForm.account)){
      this.accountErrorText = '请输入合法的邮箱或手机号'
      flag = false
    } else {
      this.accountErrorText = '';
    }
    if(!loginForm.password){
      this.pwsErrorText = '请输入登录密码'
      flag = false
    } else if(!REG_PWD.test(loginForm.password)){
      this.pwsErrorText = '请输入8~16的字符，包含大小写字母、特殊字符'
      flag = false
    } else {
      this.pwsErrorText = '';
    }
    return flag
  }

  build() {
    Column(){
      TextInput({
        placeholder: '请输入邮箱或手机号',
        text: this.loginForm.account
      })
        .showError(this.accountErrorText)
        .height(50)
        .onChange((val: string) => this.loginForm.account = val)
      TextInput({
        placeholder: '请输入登录密码',
        text: this.loginForm.password
      })
        .type(InputType.Password)
        .showPassword(false)
        .showError(this.pwsErrorText)
        .height(50)
        .margin({ top: 10 })
        .onChange((val: string) => this.loginForm.password = val)
      Row(){
        Checkbox()
          .select(this.isAgreement)
          .onChange((val: boolean) => this.isAgreement = val)
        Agreement()
          .onClick(() => {
            this.isAgreement = !this.isAgreement
          })
      }
      .margin({ top: 20 })
      Button('登录')
        .width('100%')
        .height(50)
        .margin({ top: 30 })
        .onClick(() => {
          this.login()
        })
    }
    .padding({ left: 30, right: 30, top: 30 })
  }
}

