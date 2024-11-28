import { XUserModel } from "../../db/models/x_user";
import { ResponseData } from "../../config/error_config";
import {InferAttributes} from "sequelize";

export interface LoginInfo {
  token: string;
  validTime: number;
  userInfo: InferAttributes<XUserModel>
}
export interface ResLoginData extends ResponseData<LoginInfo> {}
