// Write a function that takes a floating point number representing an angle
// between 0 and 360 degrees and returns a string representing that angle in
// degrees, minutes, and seconds. You should use a degree symbol (˚) to
// represent degrees, a single quote (') to represent minutes, and a double
// quote (") to represent seconds. There are 60 minutes in a degree, and 60
// seconds in a minute.

// Solution

// function format(number) {
//   return String(number).length < 2 ? `0${number}` : String(number);
// }

// function dms(angle) {
//   let degrees = Math.floor(angle);
//   let remainder = angle - degrees;
//   let minutes = Math.floor(remainder * 60);
//   remainder = (remainder * 60) - minutes;
//   let seconds = Math.floor(remainder * 60);
  
//   return `${degrees}°${format(minutes)}'${format(seconds)}"`;
// }

// Given Solution

// const DEGREE = '\xB0';
// const MINUTES_PER_DEGREE = 60;
// const SECONDS_PER_MINUTE = 60;
// const SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE;

// function dms(degreesFloat) {
//   const degreesInt = Math.floor(degreesFloat);
//   const minutes = Math.floor((degreesFloat - degreesInt) * MINUTES_PER_DEGREE);
//   const seconds = Math.floor(
//     (degreesFloat - degreesInt - (minutes / MINUTES_PER_DEGREE)) *
//     SECONDS_PER_DEGREE
//   );

//   return `${String(degreesInt) + DEGREE + padZeroes(minutes)}'${padZeroes(seconds)}"`;
// }

// function padZeroes(number) {
//   const numString = String(number);
//   return numString.length < 2 ? (`0${numString}`) : numString;
// }

// console.log(dms(30));           // 30°00'00"
// console.log(dms(76.73));        // 76°43'48"
// console.log(dms(254.6));        // 254°35'59"
// console.log(dms(93.034773));    // 93°02'05"
// console.log(dms(0));            // 0°00'00"
// console.log(dms(360));          // 360°00'00" or 0°00'00"


// Further Exploration

const DEGREE = '\xB0';
const MINUTES_PER_DEGREE = 60;
const SECONDS_PER_MINUTE = 60;
const SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE;

const MAX_DEGREES = 360;

function dms(degreesFloat) {
  if (degreesFloat < 0) {
    while (degreesFloat < 0) {
      degreesFloat = MAX_DEGREES + degreesFloat;
    }
  } else if (degreesFloat > MAX_DEGREES) {
    while (degreesFloat > MAX_DEGREES) {
     degreesFloat = degreesFloat - MAX_DEGREES; 
    }
  }

  const degreesInt = Math.floor(degreesFloat);
  const minutes = Math.floor((degreesFloat - degreesInt) * MINUTES_PER_DEGREE);
  const seconds = Math.floor(
    (degreesFloat - degreesInt - (minutes / MINUTES_PER_DEGREE)) *
    SECONDS_PER_DEGREE
  );

  return `${String(degreesInt) + DEGREE + padZeroes(minutes)}'${padZeroes(seconds)}"`;
}

function padZeroes(number) {
  const numString = String(number);
  return numString.length < 2 ? (`0${numString}`) : numString;
}

console.log(dms(-1));   // 359°00'00"
console.log(dms(400));  // 40°00'00"
console.log(dms(-40));  // 320°00'00"
console.log(dms(-420)); // 60°00'00"  ??? 300°00'00" ???
