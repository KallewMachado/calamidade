// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

import '../../../design_system.dart';

enum ButtonType {
  primary,
  secondary,
  danger,
  outline,
}

class CooButton extends StatelessWidget {
  final Color? backgroundColor;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color? textColor;
  final String label;
  final bool enable;
  final IconData? icon;
  final ButtonType? type;
  final EdgeInsets? padding;
  final Size? size;

  const CooButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor,
    this.enable = true,
    this.backgroundColor,
    this.isLoading = false,
    this.icon,
    this.type = ButtonType.primary,
    this.padding,
    this.size,
  });

  factory CooButton.primary({
    String label = '',
    required VoidCallback onPressed,
    Color? textColor,
    Color? backgroundColor,
    bool isLoading = false,
    bool enable = true,
    IconData? icon,
    Size? size = const Size(double.infinity, 56),
  }) {
    return CooButton(
      label: label,
      onPressed: onPressed,
      textColor: textColor,
      backgroundColor: backgroundColor,
      isLoading: isLoading,
      enable: enable,
      icon: icon,
      type: ButtonType.primary,
      size: size,
    );
  }

  factory CooButton.secondary({
    String label = '',
    required VoidCallback onPressed,
    Color? textColor,
    Color? backgroundColor,
    bool isLoading = false,
    bool enable = true,
    IconData? icon,
  }) {
    return CooButton(
      label: label,
      onPressed: onPressed,
      textColor: textColor,
      backgroundColor: backgroundColor,
      isLoading: isLoading,
      enable: enable,
      icon: icon,
      type: ButtonType.secondary,
    );
  }

  factory CooButton.danger({
    String label = '',
    required VoidCallback onPressed,
    Color? textColor,
    Color? backgroundColor,
    bool isLoading = false,
    bool enable = true,
    IconData? icon,
  }) {
    return CooButton(
      label: label,
      onPressed: onPressed,
      textColor: textColor,
      isLoading: isLoading,
      enable: enable,
      icon: icon,
      type: ButtonType.danger,
    );
  }

  factory CooButton.outline({
    String label = '',
    required VoidCallback onPressed,
    Color? textColor,
    Color? backgroundColor,
    bool isLoading = false,
    bool enable = true,
    IconData? icon,
  }) {
    return CooButton(
      label: label,
      onPressed: onPressed,
      textColor: textColor,
      backgroundColor: backgroundColor,
      isLoading: isLoading,
      enable: enable,
      icon: icon,
      type: ButtonType.outline,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    Color? _backgroundColor = backgroundColor;
    Color? _textColor = textColor;

    switch (type) {
      case ButtonType.primary:
        _backgroundColor = colors.primary;
        _textColor = colors.white;
        break;
      case ButtonType.secondary:
        _backgroundColor = colors.black;
        _textColor = colors.white;
        break;
      case ButtonType.danger:
        _backgroundColor = colors.error;
        _textColor = colors.white;
        break;
      case ButtonType.outline:
        _backgroundColor = colors.primary;
        _textColor = colors.primary;
        break;

      default:
        _backgroundColor = backgroundColor ?? colors.primary;
        _textColor = textColor ?? colors.white;
    }

    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
      child: ButtonType.outline == type
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: size,
                side: BorderSide(
                  color: _backgroundColor,
                  width: 1.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: enable ? onPressed : null,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : _ContentButton(
                      icon: Icon(
                        icon,
                        color: _backgroundColor,
                      ),
                      label: label,
                      textColor: _backgroundColor,
                      colors: colors,
                    ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _backgroundColor,
                fixedSize: size,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: enable ? onPressed : null,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : _ContentButton(
                      icon: Icon(
                        icon,
                        color: _textColor,
                      ),
                      label: label,
                      textColor: _textColor,
                      colors: colors,
                    ),
            ),
    );
  }
}

class _ContentButton extends StatelessWidget {
  const _ContentButton({
    required this.icon,
    required this.label,
    required this.textColor,
    required this.colors,
  });

  final Icon? icon;
  final String label;
  final Color? textColor;
  final CoopartilharColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        icon != null && label.isNotEmpty ? const SizedBox(width: 8) : Container(),
        Text(
          label,
          style: TextStyle(
            color: textColor,
          ),
        ),
        Center(child: icon ?? Container()),
      ],
    );
  }
}
