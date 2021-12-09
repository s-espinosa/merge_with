function merge_with(hash1, hash2, collisionFunction) {
  const keys1 = Object.keys(hash1);
  const keys2 = Object.keys(hash2);
  const allKeys = keys1.concat(keys2);
  const unique = [...new Set(allKeys)];
  let returnObject = {}
  unique.forEach((key) => {
    if((hash1[key] != undefined) && (hash2[key] != undefined)) {
      const newValue = collisionFunction(hash1[key], hash2[key])
      returnObject[key] = newValue
    } else if (hash1[key] != undefined) {
      returnObject[key] = hash1[key]
    } else {
      returnObject[key] = hash2[key]
    }
  } )
  return returnObject
}

function addValues(a, b) {
  return a + b
}

function subtractValues(a, b) {
  return a - b
}

function concatenateValues(a, b) {
  return a + " " + b
}

const added = merge_with({"a": 1}, {"a": 2, "b": 1}, addValues)
const subtracted = merge_with({"a": 1}, {"a": 2, "b": 1}, subtractValues)
const concatenated = merge_with({"a": 1}, {"a": 2, "b": 1}, concatenateValues)

console.log(added)
console.log(subtracted)
console.log(concatenated)
