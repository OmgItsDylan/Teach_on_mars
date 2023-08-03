import 'package:flutter/material.dart';
import 'package:teach_on_mars_test/theme/app_color.dart';

abstract class AppTextStyle {
  static TextStyle basicAppTextStyle = const TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
  );

  static TextStyle appBarTextStyle = basicAppTextStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static TextStyle postCardTitleTextStyle = basicAppTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.postCardTitleColor,
  );

  static TextStyle postCardBodyTextStyle = basicAppTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.postCardBodyTextColor,
  );

  static TextStyle primaryButtonTextStyle = basicAppTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle postDetail1BodyTextStyle = basicAppTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.postCardBodyTextColor,
  );
  static TextStyle postDetail2BodyTextStyle = basicAppTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.postCardBodyTextColor,
  );
}
