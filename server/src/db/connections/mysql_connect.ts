import { Sequelize, Options } from 'sequelize'
import { MYSQL_CON  } from '../../config/db_config'

const seq = new Sequelize(MYSQL_CON.conf.dbName, MYSQL_CON.conf.user, MYSQL_CON.conf.pwd, MYSQL_CON.base as Options)
export default seq
