// Write a function that takes one argument, a positive integer, and returns
// a list of the digits in the number.

// Solution

// function digitList(number) {
//   let result = [];

//   while (number > 0) {
//     let digit = number % 10;
//     result.unshift(digit);
//     number = (number - digit) / 10;
//   }
  
//   return result;
// }

// Solution 2

// function digitList(number) {
//   return String(number).split('').map(str => Number(str));
// }

// Interesting Student Solution

function digitList(num) {
  return [...String(num)].map(Number);
}

console.log(digitList(12345));       // [1, 2, 3, 4, 5]
console.log(digitList(7));           // [7]
console.log(digitList(375290));      // [3, 7, 5, 2, 9, 0]
console.log(digitList(444));         // [4, 4, 4]
