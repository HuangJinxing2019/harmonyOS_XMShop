import { Request, Response } from "express";
import { LoginBody, RegisterBody } from "../../entitiy";
import userService from '../../services/user/index'
import { SUCCESS, DATA_ERROR, UNKNOWN_ERROR, PASSWORD_ERROR, ACCOUNT_ERROR } from "../../config/error_config";
import { getToken } from "../../libs/utils";
import { EXPIRES_IN } from "../../config/encryption_config";
import { LoginInfo, ResLoginData } from "../../entitiy";

export class AuthController{
  // 登录
  async login(req: Request<{}, {}, LoginBody>, res: Response<ResLoginData>){
    console.log('执行登录')
    try {
      const { account, password } = req.body
      const user = await userService.findAccount(account)
      if(user && user.dataValues.password === password){
        const data: LoginInfo = {
          token: await getToken(account),
          validTime: EXPIRES_IN,
          userInfo: { ...user.dataValues },
        }
        delete data.userInfo.password
        res.send({ ...SUCCESS, data })
      } else if(user && user.password !== password){
        res.send(PASSWORD_ERROR)
      } else {
        res.send(ACCOUNT_ERROR)
      }
    } catch (err){
      console.log(err)
      res.send(UNKNOWN_ERROR)
    }
  }
  // 登出
  async logout(req: Request, res: Response){
    res.send('登出')
  }
  // 注册
  async register(req: Request<{}, {}, RegisterBody>, res: Response<ResLoginData>){
    try {
      const { nickname, account} = req.body
      // 检查账号或密码是是否存在
      const user = await userService.findAccountOrNickname(nickname, account)
      if(user){
        res.send({ ...DATA_ERROR, msg: user.nickname === nickname ? '昵称已存在' : '账号已存在' })
        return
      }
      // 创建用户
      const result = await userService.createUser(req.body)
      const data: LoginInfo = {
        token: await getToken(result.account),
        validTime: EXPIRES_IN,
        userInfo: {...result},
      }
      delete data.userInfo.password
      res.send({ ...SUCCESS, data })
    } catch (err) {
      console.log(err)
      res.send(UNKNOWN_ERROR)
    }
  }
}

export default new AuthController();
