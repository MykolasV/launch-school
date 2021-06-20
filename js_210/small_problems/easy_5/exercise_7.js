// Write a function that takes a string argument consisting of a first name,
// a space, and a last name, and returns a new string consisting of the last
// name, a comma, a space, and the first name

// function swapName(fullName) {
//   return fullName.split(' ').reverse().join(', ');
// }

// console.log(swapName('Joe Roberts'));    // "Roberts, Joe"

// Further Exploration

function swapName(fullName) {
  let names = fullName.split(' ');
  return `${names[names.length - 1]}, ${names.slice(0, -1).join(' ')}`;
}

console.log(swapName('Joe Andrew Saint Roberts'));    // "Roberts, Joe Andrew Saint"
