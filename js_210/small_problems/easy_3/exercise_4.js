// Write a function that returns true if the string passed as an argument is a
// palindrome, or false otherwise. A palindrome reads the same forwards and
// backwards. For this problem, the case matters and all characters matter.

// Solution 1

// function isPalindrome(string) {
//   let chars = string.split('');
//   let reversedString = chars.slice(0, chars.length).reverse().join('');
  
//   return string == reversedString;
// }

// Solution 2

// function isPalindrome(string) {
//   let startIndex = 0;
//   let endIndex = string.length - 1;
//   while (startIndex < endIndex) {
//     if (string[startIndex] !== string[endIndex]) return false;
//     startIndex += 1;
//     endIndex -= 1;
//   }

//   return true;
// }

// Given Solution

function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

console.log(isPalindrome('madam'));               // true
console.log(isPalindrome('Madam'));               // false (case matters)
console.log(isPalindrome("madam i'm adam"));      // false (all characters matter)
console.log(isPalindrome('356653'));              // true
