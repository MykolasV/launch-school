// Write a function that counts the number of occurrences of each element in a
// given array. Once counted, log each element alongside the number of
// occurrences.

// Solution 1

// function countOccurrences(array) {
//   let occurrences = {};
//   for (let index = 0; index < array.length; index += 1) {
//     let currentElement = array[index];
//     if (occurrences[currentElement]) continue;

//     let count = array.filter(element => element === currentElement).length;
//     occurrences[currentElement] = count;
//   }
  
//   for (let item in occurrences) {
//     console.log(`${item} => ${occurrences[item]}`);
//   }
// }

// Solution 2

// function countOccurrences(array) {
//   let occurrences = {};

//   for (let index = 0; index < array.length; index += 1) {
//     let currentElement = array[index];

//     if (occurrences[currentElement]) {
//       occurrences[currentElement] += 1;
//     } else {
//       occurrences[currentElement] = 1;
//     }
//   }

//   for (let item in occurrences) {
//     console.log(`${item} => ${occurrences[item]}`);
//   }
// }

// Given Solution

function countOccurrences(elements) {
  const occurrences = {};

  for (let i = 0; i < elements.length; i += 1) {
    occurrences[elements[i]] = occurrences[elements[i]] || 0;
    occurrences[elements[i]] += 1;
  }

  logOccurrences(occurrences);
}

function logOccurrences(occurrences) {
  for (let item in occurrences) {
    console.log(`${item} => ${String(occurrences[item])}`);
  }
}

const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                  'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
