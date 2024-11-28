import { XUserModel } from "../../db/models/x_user";
import { Op } from 'sequelize';
import { RegisterBody } from "../../entitiy/auth/AuthSchema";

class UsrService{
  async createUser(user: RegisterBody){
    return await XUserModel.create(user);
  }
  // 查询过账号或昵称
  async findAccountOrNickname(nickname: string, account: string){
    return await XUserModel.findOne({
      where: {
        [Op.or]: [
          { nickname: nickname },
          { account: account },
        ]
      }
    })
  }
  // 根据账号查询用户信息
  async findAccount(account: string){
    return await XUserModel.findOne({
      where: { account }
    })
  }
  async findAccountExcludePwd(account: string){
    return await XUserModel.findOne({
      attributes: { exclude: ['password'] },
      where: { account }
    })
  }

  async findId(id: number){
    return await XUserModel.findOne({
      where: { id }
    })
  }
}
export default new UsrService()
