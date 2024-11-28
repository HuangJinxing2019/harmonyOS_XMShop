interface ResponseData {
  code: number,
  msg: string,
  data: any
}
export const PARAMS_ERROR: ResponseData = {
  code: 40000,
  msg: '参数错误',
  data: null,
}
export const DATA_ERROR: ResponseData = {
  code: 40001,
  msg: '数据已存在',
  data: null,
}
export const SUCCESS: ResponseData = {
  code: 200,
  msg: '成功',
  data: null,
}
export const ERROR: ResponseData = {
  code: 500,
  msg: '服务器错误',
  data: null,
}
