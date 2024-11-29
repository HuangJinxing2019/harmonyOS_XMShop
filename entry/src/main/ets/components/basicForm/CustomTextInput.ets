export interface TextInputProps {
  type?: InputType,
  placeholderColor?: ResourceColor | string | number | Color,
  placeholderFont?: Font,
  maxLength?: number,
  onChange?: (value: string, previewText: PreviewText) => void
}

@ObservedV2
export class InputOptions implements TextInputOptions {
  @Trace placeholder?: string | Resource;
  @Trace text?: string | Resource;
  controller?: TextInputController | undefined;

  constructor(options?: TextInputOptions) {
    this.placeholder = options?.placeholder || '请输入';
    this.text = options?.text || '';
    this.controller = options?.controller || undefined;
  }
}

@ObservedV2
export class InputProps implements TextInputProps {
  type?: InputType;
  placeholderColor?: ResourceColor;
  placeholderFont?: Font;
  maxLength?: number;
  onChange?: (value: string, previewText: PreviewText) => void
  constructor(options?: TextInputProps) {
    this.type = options?.type || InputType.Normal;
    this.placeholderColor = options?.placeholderColor || '';
    this.placeholderFont = options?.placeholderFont;
    this.maxLength = options?.maxLength
    this.onChange = options?.onChange
  }
}

@ComponentV2
export struct CustomTextInput {

  @Param options: InputOptions = new InputOptions()
  @Param inputProps?: InputProps = new InputProps();

  build() {
    TextInput(this.options)
      .type(this.inputProps?.type)
      .placeholderColor(this.inputProps?.placeholderColor)
      .placeholderFont(this.inputProps?.placeholderFont)
      .maxLength(this.inputProps?.maxLength)
      .onChange((value: string, previewText: PreviewText) => {
        this.options.text = value
        if(this.inputProps?.onChange) this.inputProps?.onChange(value, previewText)
      })
  }
}