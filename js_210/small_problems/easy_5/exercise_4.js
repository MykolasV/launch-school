// Write a function that takes a non-empty string argument and returns the
// middle character(s) of the string. If the string has an odd length, you
// should return exactly one character. If the string has an even length,
// you should return exactly two characters.

// Solution

// function centerOf(string) {
//   let stringLength = string.length;
//   let middleIndex = Math.ceil((stringLength / 2) - 1);

//   if (stringLength % 2 === 0) {
//     return string.slice(middleIndex, middleIndex + 2);
//   } else {
//     return string[middleIndex];
//   }
// }

// Given Solution

function centerOf(string) {
  if (string.length % 2 === 1) {
    let centerIndex = (string.length - 1) / 2;
    return string[centerIndex];
  } else {
    let leftIndex = string.length / 2 - 1;
    return string.substring(leftIndex, leftIndex + 2);
  }
}

console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"
