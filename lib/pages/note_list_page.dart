import 'package:flutter/material.dart';

///Save ထားတဲ့ note list တွေပြဖို့အတွက် widget class
class NoteListPage extends StatelessWidget {
  const NoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note List'),
      ),
      body: _NoteListView(),
    );
  }
}

///Scrollable Note List View တွေအတွက် widget class
class _NoteListView extends StatelessWidget {
  const _NoteListView();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return _NoteItemView();
      },
      itemCount: 10,
      separatorBuilder: (_, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}

///ListView ထဲက Note Item တစ်ခုခြင်းဆီကို render ပေးမယ့် widget class
class _NoteItemView extends StatelessWidget {
  const _NoteItemView();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.pageview),
      title: const Text('This is Title'),
      subtitle: const Text('Explore more'),
      trailing: const Icon(Icons.arrow_circle_right),
    );
  }
}
