// Write a function that calculates and returns the index of the first Fibonacci
// number that has the number of digits specified by the argument.
// (The first Fibonacci number has an index of 1.)

// You may assume that the argument is always an integer greater than
// or equal to 2.

// function findFibonacciIndexByLength(numberOfDigits) {
//   let firstNum = 1n;
//   let secondNum = 1n;
//   let lastIndex = 2n;
//   while (true) {
//     [firstNum, secondNum] = [secondNum, firstNum + secondNum];
//     lastIndex += 1n;
//     if (String(secondNum).length >= numberOfDigits) return lastIndex;
//   }
// }

// Given Solution

function findFibonacciIndexByLength(length) {
  let first = 1n;
  let second = 1n;
  let count = 2n;
  let fibonacci;

  do {
    fibonacci = first + second;
    count += 1n;
    first = second;
    second = fibonacci;
  } while (String(fibonacci).length < length);

  return count;
}

console.log(findFibonacciIndexByLength(2n) === 7n);    // 1 1 2 3 5 8 13
console.log(findFibonacciIndexByLength(3n) === 12n);   // 1 1 2 3 5 8 13 21 34 55 89 144
console.log(findFibonacciIndexByLength(10n) === 45n);
console.log(findFibonacciIndexByLength(16n) === 74n);
console.log(findFibonacciIndexByLength(100n) === 476n);
console.log(findFibonacciIndexByLength(1000n) === 4782n);
console.log(findFibonacciIndexByLength(10000n) === 47847n);

// The last example may take a minute or so to run.
