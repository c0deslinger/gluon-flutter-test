import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/converter.dart';
import '../widgets/custom_text_field.dart';

class LogicTestPage extends StatelessWidget {
  LogicTestPage({super.key});

  final TextEditingController inputConverterController =
      TextEditingController();
  final TextEditingController outputConverterController =
      TextEditingController();
  final ValueConverter converter = ValueConverter();
  final FilteringTextInputFormatter _decimalFormatter =
      FilteringTextInputFormatter.allow(RegExp(r"[0-9]"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logic Test"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
                "Please enter an integer number in the \"Input\" box and tap on \"Convert\" to see the equivalent in words appear in the \"Output\" box"),
            const SizedBox(height: 24),
            CustomTextField(
                label: "Input",
                controller: inputConverterController,
                inputFormatters: [_decimalFormatter],
                showInputCorrectIcon: true,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true)),
            const SizedBox(height: 24),
            CustomTextField(
              enabled: false,
              label: "Output",
              controller: outputConverterController,
              maxLines: 3,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {
                try {
                  outputConverterController.text =
                      converter.convertDecimalToWords(
                          int.parse(inputConverterController.text));
                } catch (e) {
                  debugPrint("Error convert number $e");
                }
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue.shade800,
                foregroundColor: Colors.blue.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(color: Colors.blue.shade800),
              ),
              child: const Text(
                'Convert',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
