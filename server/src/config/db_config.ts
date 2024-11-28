export const MYSQL_CON = {
    base: {
      host: 'localhost',
      dialect: 'mysql',
      pool: {
        max: 5,
        min: 0,
        idle: 10000,
      },
    },
    conf: {
      dbName: 'xiaomi_shop',
      user: 'root',
      pwd: '123456'
    }
  }

