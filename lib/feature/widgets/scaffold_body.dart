import 'package:flutter/material.dart';

class ScaffoldBody extends StatelessWidget {
  final bool isLoading;
  final Widget body;
  const ScaffoldBody({super.key, this.isLoading = false, required this.body});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : body,
    ));
  }
}
