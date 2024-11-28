import { z } from 'zod'

export const AccountSchema = z.object({
  account: z.string().min(1, {message: '账号不能为空'})
})
export type FindByAccountBody = z.infer<typeof AccountSchema>
