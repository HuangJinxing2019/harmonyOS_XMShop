export interface ResponseData<T = any>{
  code: number;
  msg: string;
  data: T;
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
export const ACCOUNT_ERROR: ResponseData = {
  code: 40002,
  msg: '登录账号错误',
  data: null,
}
export const PASSWORD_ERROR: ResponseData = {
  code: 40003,
  msg: '登录密码错误',
  data: null,
}

export const TOKEN_NULL: ResponseData = {
  code: 49998,
  msg: '用户未登录',
  data: null,
}
export const TOKEN_INVALID: ResponseData = {
  code: 49999,
  msg: '登录失效',
  data: null,
}
export const SUCCESS: ResponseData = {
  code: 200,
  msg: '成功',
  data: null,
}
export const UNKNOWN_ERROR: ResponseData = {
  code: 500,
  msg: '未置错误，请联系管理员',
  data: null,
}

