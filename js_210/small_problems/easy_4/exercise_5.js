// function interleave(firstArray, secondArray) {
//   let result = [];
//   for (let index = 0; index < firstArray.length; index += 1) {
//     result.push(firstArray[index]);
//     result.push(secondArray[index]);
//   }
  
//   return result;
// }

// Given Solution

function interleave(array1, array2) {
  const newArray = [];

  for (let i = 0; i < array1.length; i += 1) {
    newArray.push(array1[i], array2[i]);
  }

  return newArray;
}

console.log(interleave([1, 2, 3], ['a', 'b', 'c']));    // [1, "a", 2, "b", 3, "c"]
