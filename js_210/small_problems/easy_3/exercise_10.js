// Modify the wordSizes function from the previous exercise to exclude
// non-letters when determining word size. For instance,
// the word size of "it's" is 3, not 4.

// Solution

// function wordSizes(string) {
//   if (string.length === 0) return {};

//   let result = {};

//   let words = string.split(' ');
//   let letterCounts = words.map(word => word.replace(/\W/g, '').length);
  
//   letterCounts.forEach(count => {
//     if (result[count]) {
//       result[count] += 1;
//     } else {
//       result[count] = 1;
//     }
//   });
  
//   return result;
// }

// Given Solution

function wordSizes(words) {
  const wordsArray = words.split(' ');
  const count = {};

  for (let i = 0; i < wordsArray.length; i += 1) {
    let cleanWordSize = removeNonLetters(wordsArray[i].toLowerCase()).length;
    if (cleanWordSize === 0) {
      continue;
    }

    count[cleanWordSize] = count[cleanWordSize] || 0;
    count[cleanWordSize] += 1;
  }

  return count;
}

function removeNonLetters(string)  {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    if (isLetter(string[i])) {
      result += string[i];
    }
  }

  return result;
}

function isLetter(char) { return char >= 'a' && char <= 'z' }

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}
