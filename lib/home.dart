import 'package:flutter/material.dart';

import 'modules/view/logic_test_page.dart';
import 'modules/view/widget_test_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(32),
        child: Row(
          children: [
            const Expanded(child: WidgetTestPage()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const VerticalDivider(),
            ),
            Expanded(child: LogicTestPage())
          ],
        ),
      ),
    );
  }
}
