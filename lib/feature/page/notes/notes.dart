import 'package:flutter/material.dart';
import 'package:listfull/core/base/base_widget.dart';
import 'package:listfull/feature/page/notes/notes_vm.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends BaseState<NotesViewModel, NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotesPage'),
      ),
    );
  }
}
