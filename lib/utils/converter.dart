class ValueConverter {
  // convert decimal into words
  String convertDecimalToWords(int number) {
    if (number == 0) {
      return 'zero';
    } else {
      return _convertNumber(number);
    }
  }

  String _convertNumber(int number) {
    List<String> ones = [
      '',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine'
    ];
    List<String> tens = [
      '',
      'ten',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];
    List<String> teens = [
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];

    String text = '';

    if (number < 10) {
      text += ones[number];
    } else if (number < 20) {
      text += teens[number - 10];
    } else if (number < 100) {
      text += '${tens[number ~/ 10]} ';
      text += _convertNumber(number % 10);
    } else if (number < 1000) {
      text += '${ones[number ~/ 100]} hundred ';
      text += _convertNumber(number % 100);
    } else if (number < 1000000) {
      text += '${_convertNumber(number ~/ 1000)} thousand ';
      text += _convertNumber(number % 1000);
    } else if (number < 1000000000) {
      text += '${_convertNumber(number ~/ 1000000)} million ';
      text += _convertNumber(number % 1000000);
    } else if (number < 1000000000000) {
      text += '${_convertNumber(number ~/ 1000000000)} billion ';
      text += _convertNumber(number % 1000000000);
    } else if (number < 1000000000000000) {
      text += '${_convertNumber(number ~/ 1000000000000)} trillion ';
      text += _convertNumber(number % 1000000000000);
    }

    return text.trim();
  }
}
