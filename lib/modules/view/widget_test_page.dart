import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class WidgetTestPage extends StatelessWidget {
  const WidgetTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Test"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: const Column(
          children: [
            Text(
                "Please enter some text and then delete it using backspace. An error icon will be appear when the username is empty"),
            SizedBox(height: 24),
            CustomTextField(
              prefixIcon: Icon(Icons.person, color: Colors.grey),
              label: "Username",
            ),
          ],
        ),
      ),
    );
  }
}
