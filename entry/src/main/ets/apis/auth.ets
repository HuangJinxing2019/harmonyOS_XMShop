import httpRequest, { ResultData } from '../libs/request'
import { domain } from './domain'

const loginApi = domain + '/api/auth/login';
const registerApi = domain + '/api/auth/register';

export function login<T>(data: object): Promise<ResultData<T>>{
  return httpRequest.post<T>(loginApi, data)
}

export function register<T>(data: object): Promise<ResultData<T>>{
  return httpRequest.post(registerApi, data)
}
