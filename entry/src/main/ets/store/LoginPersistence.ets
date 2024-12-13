import { PersistenceV2 } from '@kit.ArkUI'

class LoginInfo{
  token: string = '';
  setToken(token: string){
    this.token = token;
  }
}

class LoginPersistence{
  value: LoginInfo = PersistenceV2.connect(LoginInfo, () => new LoginInfo())!;
  remove(){
    PersistenceV2.remove(LoginInfo)
  }
  save(){
    PersistenceV2.save(LoginInfo)
  }
}

export default new LoginPersistence()