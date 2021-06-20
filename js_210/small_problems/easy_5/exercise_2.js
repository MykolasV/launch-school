// Write a function that takes a string, doubles every consonant character
// in the string, and returns the result as a new string. The function should
// not double vowels ('a','e','i','o','u'), digits, punctuation, or whitespace.

// Solution

// function doubleConsonants(string) {
//   let newString = '';
//   for (let index = 0; index < string.length; index += 1) {
//     let currentChar = string[index];
//     newString += currentChar;
    
//     if (!currentChar.match(/(\W|[aeiou]|\d)/i)) {
//       newString += string[index];
//     }
//   }
  
//   return newString;
// }

// Given Solution

const CONSONANTS = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
                  'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'];

function doubleConsonants(string) {
  const stringArray = [];

  for (let i = 0; i < string.length; i += 1) {
    stringArray.push(string[i]);
    if (CONSONANTS.includes(string[i].toLowerCase())) {
      stringArray.push(string[i]);
    }
  }

  return stringArray.join('');
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""
