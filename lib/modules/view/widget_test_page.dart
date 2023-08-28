import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class WidgetTestPage extends StatelessWidget {
  const WidgetTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text("Widget Test",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
          SizedBox(height: 24),
          Text(
              "Please enter some text and then delete it using backspace. An error icon will be appear when the username is empty"),
          SizedBox(height: 24),
          CustomTextField(
            prefixIcon: Icon(Icons.person, color: Colors.grey),
            label: "Username",
          ),
        ],
      ),
    );
  }
}
