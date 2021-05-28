// function getGrade(first, second, third) {
// const meanAverage = (first + second + third) / 3;
 
// if (meanAverage >= 90) {
//   return 'A';
// } else if (meanAverage >= 80) {
//   return 'B';
// } else if (meanAverage >= 70) {
//   return 'C';
// } else if (meanAverage >= 60) {
//   return 'D';
// } else {
//   return 'F';
// }
// }

// Given Solution

function getGrade(grade1, grade2, grade3) {
  const average = (grade1 + grade2 + grade3) / 3;

  if (average >= 90 && average <= 100) {
    return 'A';
  } else if (average >= 80 && average < 90) {
    return 'B';
  } else if (average >= 70 && average < 80) {
    return 'C';
  } else if (average >= 60 && average < 70) {
    return 'D';
  } else {
    return 'F';
  }
}

console.log(getGrade(95, 90, 93));    // "A"
console.log(getGrade(50, 50, 95));    // "D"
