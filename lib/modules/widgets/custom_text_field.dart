import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gluon_flutter_test/modules/widgets/custom_tooltip.dart';

// custom textfield with showing error tooltip
class CustomTextField extends StatefulWidget {
  final String label;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? enabled;
  final Function(String)? onChange;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool? showInputCorrectIcon;
  const CustomTextField(
      {super.key,
      required this.label,
      this.prefixIcon,
      this.keyboardType,
      this.onChange,
      this.enabled,
      this.maxLines,
      this.showInputCorrectIcon,
      this.inputFormatters,
      this.controller});

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  String currentValue = '';
  bool isInitState = true;
  bool isValidValue = false;

  @override
  void dispose() {
    super.dispose();
  }

  // method to check is current value valid or not
  void validateUserInput() {
    isValidValue = (currentValue.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.label,
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: (isInitState || isValidValue)
                        ? Colors.grey
                        : Colors.red),
              ),
              child: TextField(
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                enabled: widget.enabled,
                maxLines: widget.maxLines,
                style: const TextStyle(color: Colors.black),
                inputFormatters: widget.inputFormatters,
                decoration: InputDecoration(
                  // isDense: true,
                  suffixIcon: (!isInitState &&
                          (isValidValue &&
                              (widget.showInputCorrectIcon ?? false)))
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : null,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  prefixIcon: widget.prefixIcon,
                  hintText: widget.label,
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  setState(() {
                    validateUserInput();
                  });
                },
                onChanged: (value) {
                  if (widget.onChange != null) {
                    widget.onChange!(value);
                  }
                  isInitState = false;
                  setState(() {
                    currentValue = value;
                    validateUserInput();
                  });
                },
              ),
            ),
          ],
        ),
        if (!(isInitState || isValidValue))
          Positioned(
            right: 12,
            top: 4,
            child: CustomErrorTooltip(
              message: "${widget.label} cannot be empty",
            ),
          )
      ],
    );
  }
}
