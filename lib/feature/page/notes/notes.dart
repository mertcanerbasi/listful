import 'package:flutter/material.dart';
import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/core/res/colors.gen.dart';
import 'package:listfull/feature/page/notes/notes_vm.dart';
import 'package:listfull/feature/widgets/new_idea_widget.dart';
import 'package:listfull/feature/widgets/scaffold_body.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends BaseState<NotesViewModel, NotesPage> {
  final TextEditingController _ideaController = TextEditingController();
  @override
  void initState() {
    viewModel.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: const LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.secondary,
            ],
          ).createShader,
          child: const Text('My Brilliant Ideas 🧠'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              viewModel.setisAddingNote(true);
            },
          ),
        ],
      ),
      body: ScaffoldBody(
        body: Builder(builder: (context) {
          if (viewModel.notes.notes?.isEmpty == true ||
              viewModel.notes.notes == null) {
            if (viewModel.isAddingNote) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NewIdeaWidget(
                      ideaController: _ideaController,
                      onSave: () async {
                        await viewModel.saveNote(_ideaController.text);
                        _ideaController.clear();
                        viewModel.getNotes();
                      }),
                ],
              );
            } else {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You don't have any notes yet!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Tap the + button to add a new note',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }
          }

          return ListView.builder(
            itemCount: viewModel.notes.notes?.length,
            itemBuilder: (context, index) {
              final note = viewModel.notes.notes?[index];
              return ListTile(
                leading: const Text(
                  '💡',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                title: Text(note?.note ?? ''),
                onTap: () {},
              );
            },
          );
        }),
      ),
    );
  }
}
