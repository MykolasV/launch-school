// Log all odd numbers from 1 to 99, inclusive, to the console, with each number
// on a separate line.

// solution 1

// for (let iterator = 1; iterator < 100; iterator += 2) {
//   console.log(iterator);
// }

// solution 2

// let iterator = 1;
// while (iterator < 100) {
//   console.log(iterator);
//   iterator += 2;
// }

// solution 3

// let iterator = 1;
// do {
//   console.log(iterator);
//   iterator += 2;
// } while (iterator < 100);

// further exploration

function oddNumbersUpto(limit) {
  for (let i = 1; i <= limit; i += 2) {
    console.log(i);
  }
}

oddNumbersUpto(99);
