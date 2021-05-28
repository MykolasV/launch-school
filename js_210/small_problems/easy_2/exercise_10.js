// Write a function that takes a year as input and returns the century.
// The return value should be a string that begins with the century number,
// and ends with 'st', 'nd', 'rd', or 'th' as appropriate for that number.

// New centuries begin in years that end with 01. So, the years 1901 - 2000
// comprise the 20th century.

// Solution

// input: number (year)
// output: string (century)
// rules:
// - returned string should contain a century number with an ending
// (i.e. '21st', '18th', '3rd', '2nd')

// algo:
// - finding the century: Math.ceil(year / 100);
// - adding the ending to the century name:
// 1st, 2nd, 3rd, 4-20th,
// 21st, 22nd, 23rd, 24-30th,
// 31st, 32nd, 33rd, 34-40th,
// repeat...
// 100th...when century > 100, then 100 + (the above rule)

// function addSuffixToCentury(century) {
//   let centuryNumberEnding = (century % 100);
//   if (centuryNumberEnding >= 20) centuryNumberEnding %= 10;

//   let suffix;
//   if (centuryNumberEnding === 1) {
//     suffix = 'st';
//   } else if (centuryNumberEnding === 2) {
//     suffix = 'nd';
//   } else if (centuryNumberEnding === 3) {
//     suffix = 'rd';
//   } else {
//     suffix = 'th';
//   }

//   return century + suffix;
// }

// function century(year) {
//   const CALCULATED_CENTURY = Math.ceil(year / 100);

//   return addSuffixToCentury(CALCULATED_CENTURY);
// }

// Given Solution

function century(year) {
  let centuryNumber = Math.floor(year / 100) + 1;

  if (year % 100 === 0) {
    centuryNumber -= 1;
  }

  return String(centuryNumber) + centurySuffix(centuryNumber);
}

function centurySuffix(centuryNumber) {
  if (catchWithTh(centuryNumber % 100)) {
    return 'th';
  }

  let lastDigit = centuryNumber % 10;
  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

function catchWithTh(lastTwo) {
  return lastTwo === 11 || lastTwo === 12 || lastTwo === 13;
}

console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"
