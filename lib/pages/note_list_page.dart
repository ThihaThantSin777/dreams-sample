import 'package:dreams_sample/bloc/note_list_bloc.dart';
import 'package:dreams_sample/resources/dimens.dart';
import 'package:dreams_sample/resources/strings.dart';
import 'package:dreams_sample/utils/enums.dart';
import 'package:dreams_sample/widgets/loading_widget.dart';
import 'package:dreams_sample/widgets/touchable_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Save ထားတဲ့ note list တွေပြဖို့အတွက် widget class
class NoteListPage extends StatelessWidget {
  const NoteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteListBloc>(
      create: (_) => NoteListBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(kNoteListTitleText),
        ),
        body: Selector<NoteListBloc, LoadingState>(
            selector: (_, bloc) => bloc.getLoadingState,
            builder: (_, loadingState, __) {
              if (loadingState == LoadingState.kLoading) {
                return LoadingWidget();
              }
              if (loadingState == LoadingState.kError) {
                return _DatabaseErrorMessageView();
              }
              return _NoteListView();
            }),
      ),
    );
  }
}

///DataBase Fetch ရင်း Error တစ်ခုခု တတ်ရင် ပြမယ် View
class _DatabaseErrorMessageView extends StatelessWidget {
  const _DatabaseErrorMessageView();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Selector<NoteListBloc, String?>(
            selector: (_, bloc) => bloc.getErrorMessage,
            builder: (_, errorMessage, __) {
              return Text(errorMessage.toString(),
                  style: TextStyle(
                    fontSize: kFontSize18x,
                  ));
            }));
  }
}

///Scrollable Note List View တွေအတွက် widget class
class _NoteListView extends StatelessWidget {
  const _NoteListView();

  @override
  Widget build(BuildContext context) {
    return Selector<NoteListBloc, List<String>?>(
        selector: (_, bloc) => bloc.getUserNoteList,
        builder: (_, userNoteList, __) {
          if (userNoteList != null && userNoteList.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (_, index) {
                return _NoteItemView(
                  note: userNoteList[index],
                );
              },
              itemCount: userNoteList.length,
              separatorBuilder: (_, index) => const SizedBox(
                height: kSP10x,
              ),
            );
          }
          return const SizedBox.shrink();
        });
  }
}

///ListView ထဲက Note Item တစ်ခုခြင်းဆီကို render ပေးမယ့် widget class
class _NoteItemView extends StatelessWidget {
  const _NoteItemView({
    required this.note,
  });

  final String note;
  @override
  Widget build(BuildContext context) {
    return TouchableListTileWidget(
      isShowTrailing: false,
      onTap: () {},
      subTitle: '',
      title: note,
      leadingWidget: Icon(
        Icons.pageview,
      ),
    );
  }
}
