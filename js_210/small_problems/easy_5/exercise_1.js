// Write a function that takes a string, doubles every character in the string,
// and returns the result as a new string.

// Solution

// function repeater(string) {
//   let newString = '';
//   for (let index = 0; index < string.length; index += 1) {
//     newString += (string[index] + string[index]);
//   }
  
//   return newString;
// }

// Given Solution

function repeater(string) {
  const stringArray = [];

  for (let i = 0; i < string.length; i += 1) {
    stringArray.push(string[i], string[i]);
  }

  return stringArray.join('');
}

console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""
