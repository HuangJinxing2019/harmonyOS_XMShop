export function mergeObject(target: object, source: object): object{
  for (let key of Object.keys(source)){
    target[key] = source[key]
  }
  return target
}