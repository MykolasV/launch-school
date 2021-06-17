// Write a program that solicits six numbers from the user and logs a message
// that describes whether the sixth number appears among the first five numbers.

const readlineSync = require('readline-sync');
let numbers = [];

let firstNumber = readlineSync.question('Enter the 1st number: ');
numbers.push(firstNumber);
let secondNumber = readlineSync.question('Enter the 2nd number: ');
numbers.push(secondNumber);
let thirdNumber = readlineSync.question('Enter the 3rd number: ');
numbers.push(thirdNumber);
let fourthNumber = readlineSync.question('Enter the 4th number: ');
numbers.push(fourthNumber);
let fifthNumber = readlineSync.question('Enter the 5th number: ');
numbers.push(fifthNumber);
let lastNumber = readlineSync.question('Enter the last number: ');

if (numbers.includes(lastNumber)) {
  console.log(`The number ${lastNumber} appears in [${numbers.join(', ')}].`);
} else {
  console.log(`The number ${lastNumber} does not appear in [${numbers.join(', ')}].`);
}

// Given Solution

// const numbers = [];

// numbers.push(prompt('Enter the 1st number:'));
// numbers.push(prompt('Enter the 2nd number:'));
// numbers.push(prompt('Enter the 3rd number:'));
// numbers.push(prompt('Enter the 4th number:'));
// numbers.push(prompt('Enter the 5th number:'));

// let lastNumber = prompt('Enter the last number:');

// if (numbers.includes(lastNumber)) {
//   console.log(`The number ${lastNumber} appears in [${numbers.join(', ')}].`);
// } else {
//   console.log(`The number ${lastNumber} does not appear in [${numbers.join(', ')}].`);
// }
