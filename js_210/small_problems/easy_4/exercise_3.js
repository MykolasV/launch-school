// Write a function that takes an array as an argument and returns an array
// that contains two elements, each of which is an array. Put the first half of
// the original array elements in the first element of the return value, and put
// the second half in the second element. If the original array contains an odd
// number of elements, place the middle element in the first half array.

// Solution

// function halvsies(array) {
//   let middleIndex = Math.floor(array.length / 2);
//   if (array.length % 2 === 0) middleIndex -= 1;
  
//   let firstHalf = [];
//   for (let index = 0; index <= middleIndex; index += 1) {
//     firstHalf.push(array[index]);
//   }
  
//   let secondHalf = [];
//   for (let index = middleIndex + 1; index < array.length; index += 1) {
//     secondHalf.push(array[index]);
//   }
  
//   return [firstHalf, secondHalf];
// }

// Given Solution

function halvsies(array) {
  const half = Math.ceil(array.length / 2);
  const firstHalf = array.slice(0, half);
  const secondHalf = array.slice(half);

  return [firstHalf, secondHalf];
}

console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
console.log(halvsies([5]));                // [[5], []]
console.log(halvsies([]));                 // [[], []]
