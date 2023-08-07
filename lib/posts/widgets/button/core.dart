import 'package:flutter/material.dart';
import 'package:teach_on_mars_test/posts/widgets/loader_widge/core.dart';

enum ButtonType { primary, back }

class Button extends StatefulWidget {
  const Button._({
    required this.type,
    super.key,
    this.label = 'Placeholder label',
    this.decoration,
    this.height,
    this.textStyle,
    this.onPressed,
    this.loaderColor,
  });

  factory Button.primary({
    Key? key,
    String label = 'Placeholder label',
    BoxDecoration? decoration = const BoxDecoration(
      color: Color(0xFF2E66D4),
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
    double? height,
    TextStyle? textStyle,
    Future<void> Function()? onPressed,
    Color? loaderColor,
  }) {
    return Button._(
      key: key,
      label: label,
      type: ButtonType.primary,
      decoration: decoration,
      height: height,
      textStyle: textStyle,
      onPressed: onPressed,
      loaderColor: loaderColor,
    );
  }
  factory Button.back({
    Key? key,
    String label = 'Placeholder label',
    double? height,
    Future<void> Function()? onPressed,
  }) {
    return Button._(
      key: key,
      label: label,
      type: ButtonType.back,
      height: height,
      onPressed: onPressed,
    );
  }

  final String label;
  final ButtonType type;
  final BoxDecoration? decoration;
  final Color? loaderColor;
  final double? height;
  final TextStyle? textStyle;
  final Future<void> Function()? onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return () {
      switch (widget.type) {
        case ButtonType.primary:
          return FilledButton(
            onPressed: () async {
              if (mounted && !isLoading) setState(() => isLoading = true);
              await widget.onPressed?.call();
              if (mounted && isLoading) setState(() => isLoading = false);
            },
            child: SizedBox(
              height: widget.height ?? 40,
              child: Center(
                child: isLoading
                    ? LoaderWidget(
                        size: 20,
                        color: widget.loaderColor ?? Colors.white,
                      )
                    : Text(
                        widget.label,
                        style: widget.textStyle ?? Theme.of(context).textTheme.labelLarge,
                      ),
              ),
            ),
          );
        case ButtonType.back:
          return InkWell(
            onTap: () async {
              if (mounted && !isLoading) setState(() => isLoading = true);
              await widget.onPressed?.call();
              if (mounted && isLoading) setState(() => isLoading = false);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                width: widget.height ?? 40,
                height: widget.height ?? 40,
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
          );
      }
    }();
  }
}
