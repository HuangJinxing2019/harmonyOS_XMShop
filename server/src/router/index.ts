import { Router, Request, Response, Express } from "express";
import authRouter from './auth/index'

export function addRouter(app: Express): void{
  app.use('/api', authRouter)
}
