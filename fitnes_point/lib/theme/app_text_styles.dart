import 'package:flutter/material.dart';
import 'package:fitnes_point/theme/app_colors.dart';

abstract class  AppTextStyle{
  static TextStyle title = const TextStyle(
    fontSize: 24,
    color: AppColors.textTitle,
  );
  static TextStyle body = const TextStyle(
    fontSize: 16,
    color: AppColors.text,
  );
  static TextStyle subtitle = const TextStyle(
    fontSize: 12,
    color: AppColors.subtitle,
  );
}