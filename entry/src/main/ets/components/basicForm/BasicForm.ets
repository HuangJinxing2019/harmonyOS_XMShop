import { FormItem, FormSchema, Schema, ComponentType } from './FormItem';
export { FormItem, FormSchema, Schema, ComponentType };

@ComponentV2
export struct BasicForm{
  @Param schema: Schema[] = [];
  build() {
    Column(){
      ForEach(this.schema, (item: FormSchema) => {
        FormItem({ item })
      })
    }
  }
}