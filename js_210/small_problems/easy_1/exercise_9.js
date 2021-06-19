// Write a function that computes the sum of all numbers between 1 and some
// other number, inclusive, that are multiples of 3 or 5. For instance, if
// the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

// You may assume that the number passed in is an integer greater than 1.

// function multisum(maxNumber) {
//   let multiples = [];

//   for (let currentNumber = 1; currentNumber <= maxNumber; currentNumber += 1) {
//     if (currentNumber % 3 === 0 || currentNumber % 5 === 0) {
//       multiples.push(currentNumber);
//     }
//   }

//   return multiples.reduce((acc, num) => acc + num);
// }

// Given Solution

function isMultiple(number, divisor) {
  return number % divisor === 0;
}

function multisum(maxValue) {
  let sum = 0;

  for (let number = 1; number <= maxValue; number += 1) {
    if (isMultiple(number, 3) || isMultiple(number, 5)) {
      sum += number;
    }
  }

  return sum;
}

console.log(multisum(3));       // 3
console.log(multisum(5));       // 8
console.log(multisum(10));      // 33
console.log(multisum(1000));    // 234168