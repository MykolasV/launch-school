// Given a string of words separated by spaces, write a function that swaps
// the first and last letters of every word.

// You may assume that every word contains at least one letter, and that
// the string will always contain at least one word. You may also assume that
// each string contains nothing but words and spaces, and that there are no
// leading, trailing, or repeated spaces.

// Solution

// function swap(string) {
//   let words = string.split(' ');
//   let sortedWords = words.map(word => {
//     if (word.length === 1) return word;

//     let newWord = word[word.length - 1];
//     for (let index = 1; index < word.length - 1; index += 1) {
//       newWord += word[index];
//     }
    
//     newWord += word[0];
//     return newWord;
//   });
  
//   return sortedWords.join(' ');
// }

// Given Solution

function swap(words) {
  const wordsArray = words.split(' ');

  for (let i = 0; i < wordsArray.length; i += 1) {
    wordsArray[i] = swapFirstLastCharacters(wordsArray[i]);
  }

  return wordsArray.join(' ');
}

function swapFirstLastCharacters(word) {
  if (word.length === 1) {
    return word;
  }

  return word[word.length - 1] + word.slice(1, -1) + word[0];
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"
