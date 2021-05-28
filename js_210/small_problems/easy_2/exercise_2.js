// function addToString(string, char, times) {
//   for (let iterator = 1; iterator <= times; iterator += 1) {
//     string += char;
//   }
  
//   return string;
// }

// function logInBox(text) {
//   let horizontalBorder = '+';
//   horizontalBorder = addToString(horizontalBorder, '-', text.length + 2);
//   horizontalBorder += '+';
  
//   let padding = '|';
//   padding = addToString(padding, ' ', text.length + 2);
//   padding += '|';
  
//   let content = `| ${text} |`;
  
//   console.log(horizontalBorder);
//   console.log(padding);
//   console.log(content);
//   console.log(padding);
//   console.log(horizontalBorder);
// }

// Given Solution

// function logInBox(message) {
//   const horizontalRule = `+${repeatChar('-', message.length + 2)}+`;
//   const emptyLine = `|${repeatChar(' ', message.length + 2)}|`;

//   console.log(horizontalRule);
//   console.log(emptyLine);
//   console.log(`| ${message} |`);
//   console.log(emptyLine);
//   console.log(horizontalRule);
// }

// function repeatChar(char, times) {
//   let repeated = '';
//   while (repeated.length < times) {
//     repeated += char;
//   }

//   return repeated;
// }

// logInBox('To boldly go where no one has gone before.');

// // +--------------------------------------------+
// // |                                            |
// // | To boldly go where no one has gone before. |
// // |                                            |
// // +--------------------------------------------+

// logInBox('');

// // +--+
// // |  |
// // |  |
// // |  |
// // +--+


// Further Exploration

// function logInBox(message, maxBoxWidth) {
//   if (!maxBoxWidth) {
//     maxBoxWidth = message.length + 4;
//   }
  
//   if (message.length > (maxBoxWidth - 4)) {
//     message = truncatedString(message, maxBoxWidth - 4);
//   }
  

//   const horizontalRule = `+${repeatChar('-', maxBoxWidth - 2)}+`;
//   const emptyLine = `|${repeatChar(' ', maxBoxWidth - 2)}|`;

//   console.log(horizontalRule);
//   console.log(emptyLine);
//   console.log(`| ${message}${repeatChar(' ', maxBoxWidth - 3 - message.length)}|`);
//   console.log(emptyLine);
//   console.log(horizontalRule);
// }

// function repeatChar(char, times) {
//   let repeated = '';
//   while (repeated.length < times) {
//     repeated += char;
//   }

//   return repeated;
// }

// function truncatedString(string, length) {
//   let result = '';
//   for (let index = 0; index < length; index += 1) {
//     result += string[index];
//   }
  
//   return result;
// }

// logInBox('To boldly go where no one has gone before.', 80);
// logInBox('To boldly go where no one has gone before.', 20);

// Word Wrap

function logInBox(message, maxBoxWidth) {
  if (!maxBoxWidth) {
    maxBoxWidth = message.length + 4;
  }
  
  let lines = [];
  if (message.length > (maxBoxWidth - 4)) {
    lines = wrappedWords(message, maxBoxWidth - 4);
  }

  const horizontalRule = `+${repeatChar('-', maxBoxWidth - 2)}+`;
  const emptyLine = `|${repeatChar(' ', maxBoxWidth - 2)}|`;

  console.log(horizontalRule);
  console.log(emptyLine);
  lines.forEach(function(line) {
    console.log(`| ${line}${repeatChar(' ', maxBoxWidth - 3 - line.length)}|`);
  });
  console.log(emptyLine);
  console.log(horizontalRule);
}

function repeatChar(char, times) {
  let repeated = '';
  while (repeated.length < times) {
    repeated += char;
  }

  return repeated;
}

function wrappedWords(string, length) {
  let lines = [];
  let words = string.split(' ');
  
  let line = '';
  for (let index = 0; index <= words.length; index += 1) {
    let extendedLine = [line, words[index]].join(' ').trim();
    if (extendedLine.length > length || index === words.length) {
      lines.push(line);
      line = words[index];
    } else {
      line = extendedLine;
    }
  }
  
  return lines;
}

logInBox('To boldly go where no one has gone before. This is just to extend the text, and add a comma.', 20);
