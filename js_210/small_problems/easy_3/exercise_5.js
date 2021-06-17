function isPalindrome(string) {
  let startIndex = 0;
  let endIndex = string.length - 1;
  while (startIndex < endIndex) {
    if (string[startIndex] !== string[endIndex]) return false;
    startIndex += 1;
    endIndex -= 1;
  }

  return true;
}

// Solution

// function isRealPalindrome(string) {
//   string = string.toLowerCase().replace(/[^a-z0-9]/gi, '');
//   return isPalindrome(string);
// }

// Given Solution

function isRealPalindrome(string) {
  string = removeNonLetterNumbers(string.toLowerCase());
  return isPalindrome(string);
}

function removeNonLetterNumbers(string) {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    if (isLetter(string[i]) || isNumber(string[i])) {
      result += string[i];
    }
  }

  return result;
}

function isLetter(char) {
  return char >= 'a' && char <= 'z';
}

function isNumber(char) {
return char >= '0' && char <= '9';
}

console.log(isRealPalindrome('madam'));               // true
console.log(isRealPalindrome('Madam'));               // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam"));     // true (only alphanumerics matter)
console.log(isRealPalindrome('356653'));              // true
console.log(isRealPalindrome('356a653'));             // true
console.log(isRealPalindrome('123ab321'));            // false
