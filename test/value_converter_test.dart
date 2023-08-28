import 'package:flutter_test/flutter_test.dart';

import 'package:gluon_flutter_test/utils/converter.dart';

void main() {
  group('ValueConverter', () {
    late ValueConverter valueConverter;

    setUp(() {
      valueConverter = ValueConverter();
    });

    test('convertDecimalToWords should return "zero" when given number is 0',
        () {
      expect(valueConverter.convertDecimalToWords(0), 'zero');
    });

    test(
        'convertDecimalToWords should return the correct words for small numbers',
        () {
      expect(valueConverter.convertDecimalToWords(1), 'one');
      expect(valueConverter.convertDecimalToWords(10), 'ten');
      expect(valueConverter.convertDecimalToWords(19), 'nineteen');
      expect(valueConverter.convertDecimalToWords(20), 'twenty');
      expect(valueConverter.convertDecimalToWords(99), 'ninety nine');
    });

    test(
        'convertDecimalToWords should return the correct words for large numbers',
        () {
      expect(valueConverter.convertDecimalToWords(100), 'one hundred');
      expect(valueConverter.convertDecimalToWords(999),
          'nine hundred ninety nine');
      expect(valueConverter.convertDecimalToWords(1000), 'one thousand');
      expect(valueConverter.convertDecimalToWords(12345),
          'twelve thousand three hundred forty five');
      expect(valueConverter.convertDecimalToWords(123456789),
          'one hundred twenty three million four hundred fifty six thousand seven hundred eighty nine');
    });
  });
}
