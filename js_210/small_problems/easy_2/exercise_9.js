// Given a string that consists of some words and an assortment of
// non-alphabetic characters, write a function that returns that string with all
// of the non-alphabetic characters replaced by spaces. If one or more
// non-alphabetic characters occur in a row, you should only have one space
// in the result (i.e., the result string should never have consecutive spaces).

// Solution

// function cleanUp(string) {
//   const alphabet = [
//     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
//     'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
//     's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
//   ];
  
// let result = '';
// for (let index = 0; index < string.length; index += 1) {
//   let currentChar = string[index];

//   if (alphabet.includes(currentChar.toLowerCase())) {
//     result += currentChar;
//   } else if (result.charAt(result.length - 1) !== ' ') {
//     result += ' ';
//   }
// }
 
// return result;
// }

// Given Solution

// function cleanUp(text) {
//   let cleanText = '';

//   for (let i = 0; i < text.length; i += 1) {
//     if (isLowerCaseLetter(text[i]) || isUpperCaseLetter(text[i])) {
//       cleanText += text[i];
//     } else if (cleanText[cleanText.length - 1] !== ' ') {
//       cleanText += ' ';
//     }
//   }

//   return cleanText;
// }

// const isLowerCaseLetter = (char) => char >= 'a' && char <= 'z';
// const isUpperCaseLetter = (char) => char >= 'A' && char <= 'Z';

// Further Exploration

function cleanUp(string) {
  return string.replace(/[^a-z]+/ig, ' ');
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "
