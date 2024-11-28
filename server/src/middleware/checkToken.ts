import {NextFunction, Request, Response} from "express";
import { verifyToken } from "../libs/utils";
import { TOKEN_INVALID, TOKEN_NULL } from "../config/error_config";

export function checkToken(req: Request, res: Response, next: NextFunction){
  const token = req.headers.authorization
  if(token){
    verifyToken(token).then((tokenInfo: any) => {
      req.body._account = tokenInfo.account
      console.log(req.body._account)
      next()
    }).catch(err => {
      console.log(err)
      res.send(TOKEN_INVALID)
    })
  } else {
    res.send(TOKEN_NULL)
  }
}
