function shortLongShort(string1, string2) {
  // if (string2.length > string1.length) {
  //   return string1 + string2 + string1;
  // } else {
  //   return string2 + string1 + string2;
  // }

  let shortString, longString;
  [shortString, longString] = [string1, string2].sort((str1, str2) => str1.length - str2.length);

  return shortString + longString + shortString;
}

console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
console.log(shortLongShort('', 'xyz'));         // "xyz"
