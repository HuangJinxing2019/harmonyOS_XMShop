import { Request, Response } from "express";
import { RegisterBody, RegisterSchema } from "../../enter/AuthSchema";
import userService from '../../services/user/index'
import { SUCCESS, DATA_ERROR } from "../../config/error_config";

export class AuthController{
  // 登录
  async login(req: Request, res: Response){
    res.send('登录')
  }
  // 登出
  async logout(req: Request, res: Response){
    res.send('登出')
  }
  // 注册
  async register(req: Request<{}, {}, RegisterBody>, res: Response){
    const { nickname, account} = req.body
    const user = await userService.findAccountOrNickname(nickname, account)
    if(user){
      res.send({ ...DATA_ERROR, msg: '昵称或账号已存在' })
      return
    }
    const result = await userService.createUser(req.body)
    res.send({ ...SUCCESS, data: result })
  }
}

export default new AuthController();
