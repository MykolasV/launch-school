// Write a function that takes two arrays as arguments and returns an array
// containing the union of the values from the two. There should be no
// duplication of values in the returned array, even if there are duplicates in
// the original arrays. You may assume that both arguments will always be arrays.

// Solution

// function union(array1, array2) {
//   // 1

//   // let result = [];
//   // [...array1, ...array2].forEach(element => {
//   //   if (!result.includes(element)) {
//   //     result.push(element);
//   //   }
//   // });
  
//   // return result;
  
//   // 2
  
//   let result = [];
  
//   for (let index = 0; index < array1.length; index += 1) {
//     if (result.indexOf(array1[index]) >= 0) {
//       continue;
//     }
    
//     result.push(array1[index]);
//   }
  
//   for (let index = 0; index < array2.length; index += 1) {
//     if (result.indexOf(array2[index]) >= 0) {
//       continue;
//     }
    
//     result.push(array2[index]);
//   }
  
//   return result;
// }

// Given Solution 1

// function copyNonDupsTo(resultArray, array) {
//   array.forEach(value => {
//                   if (!resultArray.includes(value)) {
//                     resultArray.push(value);
//                   }
//                 });
// }

// function union(array1, array2) {
//   const newArray = [];
//   copyNonDupsTo(newArray, array1);
//   copyNonDupsTo(newArray, array2);
//   return newArray;
// }

// Given Solution 2

function copyNonDupsTo(resultArray, array) {
  array.forEach(value => {
                  if (!resultArray.includes(value)) {
                    resultArray.push(value);
                  }
                });
}

function union(...args) {
  const newArray = [];

  args.forEach(value => copyNonDupsTo(newArray, value));

  return newArray;
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]
