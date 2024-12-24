import 'package:dreams_sample/pages/add_note_page.dart';
import 'package:dreams_sample/pages/dreams_details_page.dart';
import 'package:dreams_sample/pages/note_list_page.dart';
import 'package:dreams_sample/resources/dimens.dart';
import 'package:dreams_sample/resources/strings.dart';
import 'package:dreams_sample/utils/context_extensions.dart';
import 'package:dreams_sample/widgets/touchable_list_tile_widget.dart';
import 'package:flutter/material.dart';

///Dreams List တွေကို ပြပေးမယ့် widget class
class DreamsListPage extends StatelessWidget {
  const DreamsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigateToNextPage(NoteListPage());
        },
        child: const Icon(
          Icons.note_rounded,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          kDreamListTitleText,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.navigateToNextPage(AddNotePage());
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
        height: kSP10x,
      ),
    );
  }
}

///ListView ထဲက Dream Item တစ်ခုခြင်းဆီကို render ပေးမယ့် widget class
class _DreamsItemView extends StatelessWidget {
  const _DreamsItemView();

  @override
  Widget build(BuildContext context) {
    return TouchableListTileWidget(
      onTap: () {
        context.navigateToNextPage(DreamsDetailsPage(
          title: 'This is Title',
        ));
      },
      subTitle: 'Explore more',
      title: 'This is Title',
      leadingIcon: Icons.pageview,
    );
  }
}
