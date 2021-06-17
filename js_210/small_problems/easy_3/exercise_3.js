const readlineSync = require('readline-sync');

const age = parseInt(readlineSync.question('What is your age? '), 10);
const retirementAge = parseInt(readlineSync.question('At what age would you like to retire? '), 10);
const yearsToGo = retirementAge - age;

const currentYear = new Date().getFullYear();
const retirementYear = currentYear + yearsToGo;

console.log(`\nIt's ${currentYear}. You will retire in ${retirementYear}.`);
console.log(`You have only ${yearsToGo} years of work to go!`);
