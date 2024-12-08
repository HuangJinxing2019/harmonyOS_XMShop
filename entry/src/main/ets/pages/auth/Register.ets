import { Agreement } from "./Components/Agreement";
import { promptAction } from '@kit.ArkUI'
import { REG_MOBILE, REG_EMAIL, REG_PWD } from '../../libs/reggular'

@Builder
export  function RegisterBuilder(){
  Register()
}

@ComponentV2
struct Register{
  @Consumer('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();
  build() {
    NavDestination(){
      Column(){
        Text('系统会根据法律规定存储您的个人信息')
          .fontColor($r('app.color.font_primary'))
        RegisterFormComponent()
          .margin({ top: 30 })
        Row(){
          Text('<<账号登录')
            .fontSize(14)
            .fontColor($r('app.color.font_primary'))
            .onClick(() => {
              this.navPageInfos.pop()
            })
        }
        .width('100%')
        .margin({ top: 10 })
        .justifyContent(FlexAlign.Start)
        .padding({ right: 30 })
      }
      .padding(30)
    }
    .title('注册小米账号')
  }
}
@ObservedV2
class RegisterForm{
  @Trace account: string | undefined = undefined;
  @Trace password: string | undefined = undefined;
  @Trace confirmPwd: string | undefined = undefined;
}


@ComponentV2
struct RegisterFormComponent{
  @Local registerForm: RegisterForm = new RegisterForm()
  @Local isAgreement: boolean = false;
  @Local accountErrorText: string = '';
  @Local pwsErrorText: string = '';
  @Local cPwsErrorText: string = '';


  register(){
    if(!this.isAgreement){
      promptAction.showToast({ message: '请阅读协议' })
      return
    }
    if(!this.validForm()){
      promptAction.showToast({ message: '输入有误' })
      return
    }
    promptAction.showToast({ message: '注册成功' })
  }
  validForm(){
    let flag: boolean = true;
    const registerForm = this.registerForm
    if(!registerForm.account){
      this.accountErrorText = '请输入登录账号'
      flag = false
    } else if(!REG_MOBILE.test(registerForm.account) && !REG_EMAIL.test(registerForm.account)){
      this.accountErrorText = '请输入合法的邮箱或手机号'
      flag = false
    } else {
      this.accountErrorText = ''
    }

    if(!registerForm.password){
      this.pwsErrorText = '请输入登录密码'
      flag = false
    } else if(!REG_PWD.test(registerForm.password)){
      this.pwsErrorText = '请输入8~16的字符，包含大小写字母、特殊字符'
      flag = false
    } else {
      this.pwsErrorText = ''
    }

    if(!registerForm.confirmPwd){
      this.cPwsErrorText = '请输入确认密码'
      flag = false
    } else if(registerForm.password !== registerForm.confirmPwd){
      this.cPwsErrorText = '确认密码与密码不一致'
      flag = false
    } else {
      this.cPwsErrorText = ''
    }

    return flag
  }

  build() {
    Column(){
      TextInput({
        placeholder: '请输入邮箱或手机号',
        text: this.registerForm.account
      })
        .showError(this.accountErrorText)
        .height(50)
        .onChange((val: string) => this.registerForm.account = val)
      TextInput({
        placeholder: '请输入登录密码',
        text: this.registerForm.password
      })
        .type(InputType.Password)
        .showPassword(false)
        .showError(this.pwsErrorText)
        .height(50)
        .margin({ top: 10 })
        .onChange((val: string) => this.registerForm.password = val)
      TextInput({
        placeholder: '请输入确认登录密码',
        text: this.registerForm.confirmPwd
      })
        .type(InputType.Password)
        .showPassword(false)
        .showError(this.cPwsErrorText)
        .height(50)
        .margin({ top: 10 })
        .onChange((val: string) => this.registerForm.confirmPwd = val)
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
      Button('立即注册')
        .width('100%')
        .height(50)
        .margin({ top: 30 })
        .onClick(() => {
          this.register()
        })
    }
  }
}