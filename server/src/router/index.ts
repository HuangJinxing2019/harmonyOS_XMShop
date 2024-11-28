import { Router, Request, Response, Express } from "express";
import authRouter from './auth/index'
import userRouter from  './user/index'

export function addRouter(app: Express): void{
  app.use('/api', authRouter)
  app.use('/api', userRouter)
}
