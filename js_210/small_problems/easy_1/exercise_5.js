// let readlineSync = require('readline-sync');

// let input = readlineSync.question('Please enter an integer greater than 0: ', 
// { limit: /^[1-9]+[0]*[0-9]*$/});

// input = parseInt(input, 10);

// let operation = readlineSync.question('Enter "s" to compute the sum, or "p" ' + 
// 'to compute the product. ', { limit: ['s', 'p'], caseSensitive: true });

// if (operation === 's') {
//   let total = 0;
//   for (let iterator = 1; iterator <= input; iterator += 1) {
//     total += iterator;
//   }
  
//   console.log();
//   console.log(`The sum of the integers between 1 and ${input} is ${total}.`);
// } else {
//   let total = 1;
//   for (let iterator = 1; iterator <= input; iterator += 1) {
//     total *= iterator;
//   }
  
//   console.log();
//   console.log(`The product of the integers between 1 and ${input} is ${total}.`);
// }

// Given Solution

// function computeSum(number) {
//   let total = 0;

//   for (let i = 1; i <= number; i += 1) {
//     total += i;
//   }

//   return total;
// }

// function computeProduct(number) {
//   let total = 1;

//   for (let i = 1; i <= number; i += 1) {
//     total *= i;
//   }

//   return total;
// }

// const number = parseInt(prompt('Please enter an integer greater than 0'), 10);
// const operation = prompt('Enter "s" to compute the sum, or "p" to compute the product.');

// if (operation === 's') {
//   let sum = String(computeSum(number));
//   console.log(`The sum of the integers between 1 and ${String(number)} is ${sum}.`);
// } else if (operation === 'p') {
//   let product = String(computeProduct(number));
//   console.log(`The product of the integers between 1 and ${String(number)} is ${product}.`);
// } else {
//   console.log('Oops. Unknown operation.');
// }

// Further Exploraiton

function computeSum(numbers) {
  return numbers.reduce((acc, current) => acc + current);
}

function computeProduct(numbers) {
  return numbers.reduce((acc, current) => acc * current);
}

let readlineSync = require('readline-sync');

let input = readlineSync.question('Please enter any number of integers greater than 0, separated by a comma: ', 
{ limit: /^[\d+,?]+$/});

input = input.split(',').map(numStr => parseInt(numStr, 10));
input = input.filter(num => num); // in case of '' turned into NaN

let operation = readlineSync.question('Enter "s" to compute the sum, or "p" ' + 
'to compute the product. ', { limit: ['s', 'p'], caseSensitive: true });

if (operation === 's') {
  let sum = computeSum(input);
  
  console.log();
  console.log(`The sum of integers ${input} is ${sum}.`);
} else {
  let product = computeProduct(input);
  
  console.log();
  console.log(`The product of integers ${input} is ${product}.`);
}
