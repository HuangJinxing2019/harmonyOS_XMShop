import {z} from "zod";
import { Request } from "express";

export * from './auth/AuthSchema'
export * from './auth/AuthVo'
export * from './user/UserSchema'
export * from './user/UserVo'

export interface ReqBodyBasic{
  _account: string;
}
export const IdSchema = z.object({
  id:  z.number().min(1, { message: 'ID不能为空' })
})
export type FindByIdBody = z.infer<typeof IdSchema>
