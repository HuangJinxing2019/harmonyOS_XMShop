import jwt from 'jsonwebtoken'
import { PRIVATE_KEY, EXPIRES_IN } from "../config/encryption_config";

export async function getToken(account: string){
  return jwt.sign({ account }, PRIVATE_KEY, { expiresIn: EXPIRES_IN })
}
export async function verifyToken(token: string) {
  return jwt.verify(token, PRIVATE_KEY)
}
