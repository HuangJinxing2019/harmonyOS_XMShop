import sql from "../connections/mysql_connect";
import { XUser } from './x_user'
export function syncMysqlModels(){
  sql.define(XUser.tableName, XUser.attributes, XUser.options)
}
