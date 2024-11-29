import { CustomTextInput, InputOptions, InputProps, TextInputProps } from './CustomTextInput'
export enum  ComponentType {
  SELECT = 'Select',
  TEXT_INPUT = 'TextInput',
  RADIO = 'Radio',
}
export interface Schema {
  label: string | undefined;
  filed: string | undefined;
  component: ComponentType | undefined;
  options?: TextInputOptions | undefined;
  componentProps?: TextInputProps | undefined;
  required?: boolean | false;
  rules?: Rule[] | undefined;
  errMsg?: string;
  defaultValue?: ResourceStr
}
export interface Rule{
  required: boolean;
  message: string;
  trigger?: 'change' | 'blur';
  pattern?: RegExp;
}

@ObservedV2
export class FormSchema implements Schema{
  label: string | undefined;
  filed: string | undefined;
  component: ComponentType | undefined;
  options: TextInputOptions | undefined;
  componentProps: TextInputProps | undefined;
  required?: boolean | false;
  rules?: Rule[] | undefined;
  @Trace errMsg?: string = '';
  constructor(config?: Schema){
    this.label = config?.label;
    this.filed = config?.filed;
    console.log('textInput=======================')
    console.log(this.component)
    if(config?.component === ComponentType.TEXT_INPUT){
      console.log(`textInput=${config?.options?.text}`)
      this.options = new InputOptions(config?.options || { text: '', placeholder: '请输入' });
    }
    this.component = config?.component;
    this.componentProps = config?.componentProps;
    this.required = config?.required || false;
    this.rules = config?.rules;
  }
}

@ComponentV2
export struct FormItem{
  @Param item: Schema = new FormSchema();
  build() {
    Column(){
      if(this.item.label){
        Text(this.item.label)
          .margin({ bottom: 8 })
      }
      if(this.item.component === ComponentType.TEXT_INPUT){
        CustomTextInput({
          options: this.item.options as InputOptions,
          inputProps: this.item.componentProps as InputProps
        })
      }
      Text(this.item.errMsg)
        .fontColor(Color.Red)
        .height(20)
    }
    .alignItems(HorizontalAlign.Start)
  }
}