import {Request, Response} from "express";
import { ReqBodyBasic, ResUserInfo } from "../../entitiy";
import userService from '../../services/user/index'
import { SUCCESS, UNKNOWN_ERROR } from "../../config/error_config";


export class UserController {
  async queryUserInfo(req: Request<{}, {}, ReqBodyBasic>, res: Response<ResUserInfo>){
    try {
      console.log(req.body)
      const user = await userService.findAccountExcludePwd(req.body._account)
      res.send({ ...SUCCESS, data: user?.dataValues! })
    } catch (err) {
      console.log(err)
      res.send(UNKNOWN_ERROR)
    }
  }
  async queryUserById(){

  }
}
export default new UserController();
