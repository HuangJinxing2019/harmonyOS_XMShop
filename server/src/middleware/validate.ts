import { NextFunction, Request, Response } from "express";
import { RegisterBody } from "../entitiy";
import { PARAMS_ERROR } from "../config/error_config";
import { z } from 'zod'

export function validateRequestBody(schema: z.ZodSchema){
  return function (req: Request<{}, {}, RegisterBody>, res: Response, next: NextFunction){
    try {
      req.body = schema.parse(req.body);
      next();
    } catch (err) {
      if(err instanceof z.ZodError){
        const data = { ...PARAMS_ERROR }
        data.msg = err.errors.reduce((pre: string, item: any) => {
          return pre +=  `${item.path.join('、')}：${item.message}; `
        }, '')
        res.send(data)
      } else {
        console.log(err);
        res.status(500).json({
          status: 500,
          message: '服务器出错'
        })
      }
    }
  }
}
