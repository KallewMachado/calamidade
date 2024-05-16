import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterItemField extends StatelessWidget {
  const RegisterItemField({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
    required this.validator,
  });

  final String title;
  final String hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = CoopartilharColors.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium
              ?.copyWith(height: 1.125, color: colors.textColor),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(hintText: hint),
          validator: validator,
          style: textTheme.displaySmall
              ?.copyWith(height: 0.9, color: colors.textColor),
        ),
      ],
    );
  }
}
