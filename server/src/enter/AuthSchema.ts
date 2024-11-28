import { z } from 'zod'
import { REG_MOBILE, REG_EMAIL, REG_PWD} from "../config/reg_config";

export const RegisterSchema = z.object({
  nickname: z.string().nonempty({message: '昵称不能为空'}).max(12, {message: '不能超出12个字符'}),
  account: z.string().nonempty({ message: '账号不能为空' }).refine(
    (value) => REG_MOBILE.test(value) || REG_EMAIL.test(value),
    { message: '输入必须是有效的手机号或邮箱' }
  ),
  password: z.string().nonempty({ message: '密码不能为空' }).refine(
    (value) => REG_PWD.test(value),
    { message: '请输入包含大小写特殊字符的密码' }
  )
})

export type RegisterBody = z.infer<typeof RegisterSchema>
