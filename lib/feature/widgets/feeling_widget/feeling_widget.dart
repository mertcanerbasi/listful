import 'package:flutter/material.dart';
import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/feature/widgets/feeling_widget/feeling_vm.dart';

class FeelingWidget extends StatefulWidget {
  const FeelingWidget({super.key});

  @override
  _FeelingState createState() => _FeelingState();
}

class _FeelingState extends BaseState<FeelingViewModel, FeelingWidget> {
  @override
  Widget build(BuildContext context) {
    final double chipWidth = (MediaQuery.of(context).size.width - 60) / 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "How are you feeling this morning?",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Select the emoji that best describes your mood",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8.0, // Space between the chips horizontally
          runSpacing: 8.0, // Space between the chips vertically
          children: viewModel.moods.map((mood) {
            return SizedBox(
              width: chipWidth, // Ensure 3 chips per row
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center the content horizontally
                  children: [
                    Text(
                      mood['emoji']!,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      mood['label']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
