import 'package:flutter/material.dart';

void endFrame(void Function(Duration) callback) {
  WidgetsBinding.instance.addPostFrameCallback(callback);
}
