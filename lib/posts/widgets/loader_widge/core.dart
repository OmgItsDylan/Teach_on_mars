import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:teach_on_mars_test/theme/app_color.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
    this.size = 40,
    this.color,
  });
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.stretchedDots(
      size: size,
      color: color ?? AppColor.loaderColor,
    );
  }
}
