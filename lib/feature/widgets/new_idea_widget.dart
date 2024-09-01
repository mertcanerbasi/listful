import 'package:flutter/material.dart';
import 'package:listfull/core/res/colors.gen.dart';

class NewIdeaWidget extends StatelessWidget {
  const NewIdeaWidget({
    super.key,
    required TextEditingController ideaController,
    required this.onSave,
  }) : _ideaController = ideaController;

  final TextEditingController _ideaController;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Got something on your mind?",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 16),
          controller: _ideaController,
          decoration: InputDecoration(
            hintText: "Write it down...",
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: AppColors.cardBackground,
            suffixIcon: InkWell(
              onTap: onSave,
              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
