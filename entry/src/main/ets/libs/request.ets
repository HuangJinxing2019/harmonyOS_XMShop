import { http } from '@kit.NetworkKit';
import { mergeObject } from './utils'
import qs from 'qs'

interface PostRequestData{
  params: object
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
  public async get(url: string, config?: http.HttpRequestOptions): Promise<http.HttpResponse>{
    let _config: http.HttpRequestOptions = {
      method: http.RequestMethod.GET,
    }
    // 有传config参数，进行合并。
    if(config){
      _config = mergeObject(_config, config)
    }
    return this.request(url, _config)
  }

  public async post(url: string, data: Object | PostRequestData | ArrayBuffer, config?: http.HttpRequestOptions): Promise<http.HttpResponse>{
    if(Object.keys(data).includes('params')){
      return this.formPost(url, (data as PostRequestData).params, config)
    } else {
      return this.jsonPost(url, data, config)
    }
  }
  public async jsonPost(url: string, data: Object, config?: http.HttpRequestOptions): Promise<http.HttpResponse>{
    let _config: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      header: { 'content-Type': 'application/json' },
    }
    _config.extraData = data;
    if(config) _config = mergeObject(_config, config)
    this.request(url, _config)
  }
  public async formPost(url: string, data: object, config?: http.HttpRequestOptions): Promise<http.HttpResponse>{
    let _config: http.HttpRequestOptions = {
      method: http.RequestMethod.POST,
      header: { 'content-Type': 'application/x-www-form-urlencoded'},
    }
    _config.extraData = qs.stringify((data as PostRequestData).params)
    if(config) _config = mergeObject(_config, config)
    this.request(url, _config)
  }
  public async request(url: string, config?: http.HttpRequestOptions): Promise<http.HttpResponse>{
    const httpRequest = http.createHttp()
    this.beforRequest(url, config)
    this.requestMap.set(url, httpRequest)
    return httpRequest.request(url, config)
      .then((response: http.HttpResponse) => {
        this.afterRequest(url, response)
        return response
      })
  }
  private beforRequest(url: string, config?: http.HttpRequestOptions){

  }

  private afterRequest(url: string, response: http.HttpResponse){
    console.dir(response)
    this.requestMap.delete(url)
  }
}
export default new HttpRequest()