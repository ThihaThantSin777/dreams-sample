import 'package:dreams_sample/pages/add_note_page.dart';
import 'package:dreams_sample/pages/dreams_details_page.dart';
import 'package:dreams_sample/pages/note_list_page.dart';
import 'package:flutter/material.dart';

///Dreams List တွေကို ပြပေးမယ့် widget class
class DreamsListPage extends StatelessWidget {
  const DreamsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => NoteListPage(),
            ),
          );
        },
        child: const Icon(
          Icons.note_rounded,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Explore your dreams meaning',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddNotePage(),
                ),
              );
            },
            icon: const Icon(Icons.note_add),
          )
        ],
      ),
      body: _DreamsListView(),
    );
  }
}

///Scrollable Dream List View တွေအတွက် widget class
class _DreamsListView extends StatelessWidget {
  const _DreamsListView();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return _DreamsItemView();
      },
      itemCount: 10,
      separatorBuilder: (_, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}

///ListView ထဲက Dream Item တစ်ခုခြင်းဆီကို render ပေးမယ့် widget class
class _DreamsItemView extends StatelessWidget {
  const _DreamsItemView();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DreamsDetailsPage(title: 'This is Title'),
          ),
        );
      },
      leading: const Icon(Icons.pageview),
      title: const Text('This is Title'),
      subtitle: const Text('Explore more'),
      trailing: const Icon(Icons.arrow_circle_right),
    );
  }
}
