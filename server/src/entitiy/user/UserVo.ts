import { ResponseData } from "../../config/error_config";
import { XUserModel } from "../../db/models/x_user";
import {InferAttributes} from "sequelize";

export interface ResUserInfo extends ResponseData<InferAttributes<XUserModel>> {}
