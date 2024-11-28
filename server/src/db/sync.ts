import seq from "./connections/mysql_connect";
import { syncMysqlModels } from "./models";

syncMysqlModels()
// 测试连接
seq.authenticate().then(() => {
  console.log('数据库连接成功')
}).catch(err => {
  console.log('数据库连接失败')
})

// 同步数据库表
seq.sync({
  // force: true, // true 同步并重置（清空）表数据
  alter: true, // 自动生成 SQL 语句以添加或修改字段，而不会删除表数据。 不会自动删除模型中已移除的字段和修改allowNull ，需手动调整。
}).then(() => {
  console.log('数据库表同步成功')
  // 关闭
  process.exit();
})
