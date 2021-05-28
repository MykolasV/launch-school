// Create a simple tip calculator. The program should prompt for a bill amount
// and a tip rate. The program must compute the tip, and then log both the tip
// and the total amount of the bill to the console. You can ignore input
// validation and assume that the user will put in numbers.

// Example:

// What is the bill? 200
// What is the tip percentage? 15

// The tip is $30.00
// The total is $230.00

// Solution

// let readlineSync = require('readline-sync');

// let bill = readlineSync.question('What is the bill? ');
// bill = Number(bill);
// let tipPercentage = readlineSync.question('What is the tip percentage? ');
// tipPercentage = Number(tipPercentage);

// let tip = (tipPercentage * bill) / 100;
// let total = bill + tip;

// console.log('The tip is $' + tip.toFixed(2));
// console.log('The total is $' + total.toFixed(2));

// Given solution

const bill = parseFloat(prompt('What is the bill?'));
const percentage = parseFloat(prompt('What is the percentage?'));

const tip = bill * (percentage / 100);
const total = bill + tip;

console.log(`The tip is $${tip.toFixed(2)}`);
console.log(`The total is $${total.toFixed(2)}`);
