function rotatedChar(alphabet, char, rotation) {
  let currentPlace = alphabet.indexOf(char);
  let rotatedPlace = currentPlace + rotation;

  if (rotatedPlace > (alphabet.length - 1)) {
    rotatedPlace -= alphabet.length;
  }

  return alphabet[rotatedPlace];
}

function rot13(string) {
  const ROTATION = 13;

  const LOWER_CASE_ALPHABET = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
    'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r',
    's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  ];

  const UPPER_CASE_ALPHABET = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I',
    'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
  ];

  let result = '';
  for (let index = 0; index < string.length; index += 1) {
    let currentChar = string[index];

    if (LOWER_CASE_ALPHABET.includes(currentChar)) {
      let newChar = rotatedChar(LOWER_CASE_ALPHABET, currentChar, ROTATION);
      result += newChar;
    } else if (UPPER_CASE_ALPHABET.includes(currentChar)) {
      let newChar = rotatedChar(UPPER_CASE_ALPHABET, currentChar, ROTATION);
      result += newChar;
    } else {
      result += currentChar;
    }
  }

  return result;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));

// logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

// logs:
// Teachers open the door, but you must enter by yourself.
