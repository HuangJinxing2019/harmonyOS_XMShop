import httpRequest from '../libs/request'
import { domain } from './domain'
import { http } from '@kit.NetworkKit';

const loginApi = domain + '/apis/auth/login';
const registerApi = domain + '/apis/auth/register';

export function login(data: object): Promise<http.HttpResponse>{
  return httpRequest.post(loginApi, data)
}
export function register(data: object): Promise<http.HttpResponse>{
  return httpRequest.post(registerApi, data)
}
