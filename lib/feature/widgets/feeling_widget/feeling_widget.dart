import 'package:flutter/material.dart';
import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/widgets/feeling_widget/feeling_vm.dart';

class FeelingWidget extends StatefulWidget {
  const FeelingWidget({super.key});

  @override
  _FeelingState createState() => _FeelingState();
}

class _FeelingState extends BaseState<FeelingViewModel, FeelingWidget> {
  @override
  void initState() {
    super.initState();
    viewModel.getMood();
  }

  @override
  Widget build(BuildContext context) {
    final double chipWidth = (MediaQuery.of(context).size.width - 60) / 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "How are you feeling today?",
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
          spacing: 4.0, // Space between the chips horizontally
          runSpacing: 4.0, // Space between the chips vertically
          alignment: WrapAlignment.center,
          children: viewModel.moodList.map((mood) {
            bool isSelected = mood.emoji == viewModel.selectedMood?.emoji;
            return GestureDetector(
              onTap: () {
                viewModel.setselectedMood(mood);
              },
              child: SizedBox(
                width: chipWidth, // Ensure 3 chips per row
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : Colors.grey,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center the content horizontally
                    children: [
                      Text(
                        mood.emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        mood.label,
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? AppColors.primary : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
