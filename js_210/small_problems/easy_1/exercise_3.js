// Build a program that asks the user to enter the length and width of a room in
// meters, and then logs the area of the room to the console in both square
// meters and square feet.

// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. Use the
// readlineSync.prompt method to collect user input.

// Example:

// Enter the length of the room in meters:
// 10
// Enter the width of the room in meters:
// 7
// The area of the room is 70.00 square meters (753.47 square feet).

// let readlineSync = require('readline-sync');

// console.log('Enter the length of the room in meters:');
// let length = Number(readlineSync.prompt());
// console.log('Enter the width of the room in meters:');
// let width = Number(readlineSync.prompt());

// let squareMeters = (length * width).toFixed(2);
// let squareFeet = (squareMeters * 10.7639).toFixed(2);

// console.log(`The area of the room is ${squareMeters} square meters \
// (${squareFeet} square feet).`);

// Given Solution

// let readlineSync = require("readline-sync");

// const SQMETERS_TO_SQFEET = 10.7639;

// console.log("Enter the length of the room in meters:");
// let length = readlineSync.prompt();
// length = parseInt(length, 10);

// console.log("Enter the width of the room in meters:");
// let width = readlineSync.prompt();
// width = parseInt(width, 10);

// let areaInMeters = (length * width);
// let areaInFeet = (areaInMeters * SQMETERS_TO_SQFEET);

// console.log(
//   `The area of the room is ${areaInMeters.toFixed(2)} square meters (${areaInFeet.toFixed(2)} square feet).`
// );

// Further Exploration

let readlineSync = require("readline-sync");

const SQMETERS_TO_SQFEET = 10.7639;

console.log('Would you like to provide the measurments in meters or feet? ("m" or "f")');

let inputType = readlineSync.prompt({ limit: ['m', 'f'], caseSensitive: true });

if (inputType === 'm') {
  inputType = 'meters';
} else if (inputType === 'f') {
  inputType = 'feet';
}

console.log("Enter the length of the room in " + inputType + ":");
let length = readlineSync.prompt();
length = parseInt(length, 10);

console.log("Enter the width of the room in " + inputType + ":");
let width = readlineSync.prompt();
width = parseInt(width, 10);


let areaInMeters;
let areaInFeet;

if (inputType === 'meters') {
  areaInMeters = (length * width);
  areaInFeet = (areaInMeters * SQMETERS_TO_SQFEET);
  
  console.log(`The area of the room is ${areaInMeters.toFixed(2)} square meters (${areaInFeet.toFixed(2)} square feet).`);
} else {
  areaInFeet = (length * width);
  areaInMeters = areaInFeet / SQMETERS_TO_SQFEET;
  
  console.log(`The area of the room is ${areaInFeet.toFixed(2)} square feet (${areaInMeters.toFixed(2)} square meters).`);
}
