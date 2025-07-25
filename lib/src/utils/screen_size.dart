import 'package:flutter/material.dart';

bool isWideScreen(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final width = size.width / 2;
  final height = size.height / 3;
  return width > height;
}
