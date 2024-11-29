import { useForm, BasicForm, FormSchema, ComponentType, FormData } from '../../components/basicForm/Index'
@ComponentV2
struct Demo{
  aboutToAppear(): void {
    this.formData  = useForm({
      schema: [
        {
          filed: 'account',
          label: '登录',
          options: {
            text: '123',
            placeholder: '请输入账号'
          },
          required: true,
          component: ComponentType.TEXT_INPUT,
          componentProps: {
            onChange(value: string){
              console.log(value)
            }
          }
        },
        {
          filed: 'password',
          label: '密码',
          options: {
            text: '123',
            placeholder: '请输入密码'
          },
          required: false,
          component: ComponentType.TEXT_INPUT,
        }
      ]
    })
    this.formSchema = this.formData.value;
  }
  @Consumer('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();
  formData: FormData = new FormData();
  formSchema: FormSchema[] = []
  build() {
    NavDestination(){
      Text('登录页面')
      BasicForm({ schema: this.formSchema })
      Button('提交')
        .onClick(() => {
          this.formData.validate();
        })
    }
  }
}