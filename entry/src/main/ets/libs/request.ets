import { http } from '@kit.NetworkKit';
import { mergeObject } from './utils'
import qs from 'qs'
import { promptAction } from '@kit.ArkUI';

interface PostRequestData{
  params: object
}
export interface ResultData<T>{
  code: number;
  msg: string;
  data: T
}

class HttpRequest{
  static Singleton: HttpRequest | null = null;
  private requestMap: Map<string, http.HttpRequest> = new Map();

  constructor() {
    if(HttpRequest.Singleton) return HttpRequest.Singleton
      else {
        HttpRequest.Singleton = this;
        return this;
      }
  }
  private beforRequest(url: string, config?: http.HttpRequestOptions){

  }

  private async afterRequest<T>(url: string, response: http.HttpResponse): Promise<ResultData<T>>{
    this.requestMap.delete(url)
    if(response.responseCode === 200){
      if((response.result as ResultData<T>).code === 200){
        return Promise.resolve(response.result as ResultData<T>)
      } else {
        promptAction.showToast({
          message: (response.result as ResultData<T>).msg,
          textColor: Color.Red
        })
        return Promise.reject(response.result as ResultData<T>)
      }
    } else {
      return Promise.reject(response)
    }
  }
  public async get<T>(url: string, config?: http.HttpRequestOptions): Promise<ResultData<T>>{
    let _config: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
      expectDataType: http.HttpDataType.OBJECT,
    }
    // 有传config参数，进行合并。
    if(config){
      _config = mergeObject(_config, config)
    }
    return this.request(url, _config)
  }

  public async post<T>(url: string, data: Object | PostRequestData | ArrayBuffer, config?: http.HttpRequestOptions): Promise<ResultData<T>>{
    if(Object.keys(data).includes('params')){
      return this.formPost<T>(url, (data as PostRequestData).params, config)
    } else {
      return this.jsonPost<T>(url, data, config)
    }
  }
  public async jsonPost<T>(url: string, data: Object, config?: http.HttpRequestOptions): Promise<ResultData<T>>{
    let _config: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      expectDataType: http.HttpDataType.OBJECT,
      header: { 'content-Type': 'application/json' },
    }
    _config.extraData = data;
    if(config) _config = mergeObject(_config, config)
    return this.request(url, _config)
  }
  public async formPost<T>(url: string, data: object, config?: http.HttpRequestOptions): Promise<ResultData<T>>{
    let _config: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      expectDataType: http.HttpDataType.OBJECT,
      header: { 'content-Type': 'application/x-www-form-urlencoded'},
    }
    _config.extraData = qs.stringify((data as PostRequestData).params)
    if(config) _config = mergeObject(_config, config)
    return this.request<T>(url, _config)
  }
  public async request<T>(url: string, config?: http.HttpRequestOptions): Promise<ResultData<T>>{
    const httpRequest = http.createHttp()
    this.beforRequest(url, config)
    this.requestMap.set(url, httpRequest)
    return httpRequest.request(url, config)
      .then((response: http.HttpResponse) => {
        return this.afterRequest(url, response as http.HttpResponse) as Promise<ResultData<T>>
      }).catch((err: Record<string, string>)=> {
        promptAction.showToast({
          message: err.message,
          textColor: Color.Red
        })
        return Promise.reject(err)
      })
  }
}
export default new HttpRequest()