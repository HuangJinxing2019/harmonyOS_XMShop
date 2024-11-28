import { XUserModel } from "../../db/models/x_user";
import { Op } from 'sequelize';
import { RegisterBody } from "../../enter/AuthSchema";

class UsrService{
  async createUser(user: RegisterBody){
    return await XUserModel.create(user);
  }
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
}
export default new UsrService()
