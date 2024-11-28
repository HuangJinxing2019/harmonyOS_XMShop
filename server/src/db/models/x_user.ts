import { INTEGER, STRING, InferAttributes, InferCreationAttributes, Model } from 'sequelize'
import { Model_type } from "../../type/db_models.data";
import seq from "../connections/mysql_connect";
export const XUser: Model_type = {
  tableName: 'x_user',
  attributes: {
    id: {
      comment: 'ID',
      type: INTEGER.UNSIGNED, // 自增ID
      primaryKey: true, // 主键
      autoIncrement: true, // 实现自增
    },
    name: {
      comment: '姓名',
      type: STRING(16),
      allowNull: true,
    },
    nickname: {
      comment: '姓名',
      type: STRING(16),
      allowNull: true,
    },
    account: {
      comment: '账号',
      type: STRING(11),
      unique: true, // 不能重复
    },
    password: {
      comment: '密码',
      type: STRING(32),
    },
    sex: {
      comment: '性别: 0未知、1男、2女',
      type: INTEGER,
      defaultValue: 0,
      allowNull: true, //允许为空
    },
    phone: {
      comment: '手机号码',
      type: STRING(12),
      allowNull: true, //允许为空
      unique: true, // 不能重复
    },
    type: {
      comment: '用户类型：0超级管理员、1商城管理、2普通用户',
      type: INTEGER,
      defaultValue: 2,
      allowNull: true, //允许为空
    },
    birthday: {
      comment: '生日',
      type: STRING(10),
      allowNull: true, //允许为空
    },
  },
  options: {
    tableName: 'x_user',
    createdAt: 'created_time',
    updatedAt: 'updated_time',
  }
}
export class XUserModel extends Model<InferAttributes<XUserModel>, InferCreationAttributes<XUserModel>> {
  declare id?: number;
  declare name?: string;
  declare nickname: string;
  declare account: string;
  declare password: string;
  declare phone?: string;
  declare sex?: number;
  declare type?: number;
  declare birthday?: string;
}
XUserModel.init(XUser.attributes, { sequelize: seq, ...XUser.options })

