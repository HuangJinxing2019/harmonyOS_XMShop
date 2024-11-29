import { FormSchema, Schema, BasicForm, ComponentType } from './BasicForm'
import { Rule } from './FormItem';

export { FormSchema, BasicForm, ComponentType }

interface UseFormOption{
  schema: Schema[]
}



export class FormData {
  value: FormSchema[] = [];
  validate(){
    const list: FormSchema[] = this.value.filter(item => {
      let flag = false
      if(item.required || item.rules?.length){
        if(item.required && !item.options?.text) {
          item.errMsg = `${item.label}不能为空`
          flag = true;
        } else if(item.rules?.length){
          item.errMsg = validRule(item.options?.text, item.rules)
          if(item.errMsg) flag = true
        }
      }
      return flag
    })
    return list
  }
}

function validRule(value: ResourceStr | undefined, rules: Rule[]): string{
  let item: Rule | undefined = rules.find((rule: Rule) => {
    if(rule.required && !value) return true
    if(!rule.required && value && rule.pattern && rule.pattern instanceof RegExp) return !rule.pattern.test(value + '')
    return false
  })
  return item ? item.message : ''
}


export function useForm(options: UseFormOption): FormData {
  const formData = new FormData();
  const list = options.schema.map((item: Schema) => {
    return new FormSchema(item)
  });
  formData.value = list
  return formData
}