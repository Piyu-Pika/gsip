import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class NotesPage extends StatefulWidget {
  final int id;

  NotesPage({required this.id});

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  Map<String, dynamic>? _note;

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  Future<void> _loadNote() async {
    final databaseReference = FirebaseDatabase.instance.reference();
    final snapshot = await databaseReference.child('notes').child(widget.id.toString()).get();
    if (snapshot.exists) {
      setState(() {
        _note = snapshot.value as Map<String, dynamic>;
      });
    } else {
      print('No data available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note'),
      ),
      body: _note != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _note!['title'],
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    _note!['content'],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}