import 'package:dreams_sample/bloc/dreams_list_bloc.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:dreams_sample/pages/add_note_page.dart';
import 'package:dreams_sample/pages/dreams_details_page.dart';
import 'package:dreams_sample/pages/note_list_page.dart';
import 'package:dreams_sample/resources/dimens.dart';
import 'package:dreams_sample/resources/strings.dart';
import 'package:dreams_sample/utils/context_extensions.dart';
import 'package:dreams_sample/utils/enums.dart';
import 'package:dreams_sample/widgets/loading_widget.dart';
import 'package:dreams_sample/widgets/touchable_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Dreams List တွေကို ပြပေးမယ့် widget class
class DreamsListPage extends StatelessWidget {
  const DreamsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DreamsListBloc>(
      create: (_) => DreamsListBloc(),
      child: Scaffold(
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
        body: Selector<DreamsListBloc, LoadingState>(
            selector: (_, bloc) => bloc.getLoadingState,
            builder: (_, loadingState, __) {
              if (loadingState == LoadingState.kLoading) {
                return LoadingWidget();
              }
              if (loadingState == LoadingState.kError) {
                return _APIErrorMessageView();
              }
              return _DreamsListView();
            }),
      ),
    );
  }
}

///API Fetch ရင်း Error တစ်ခုခု တတ်ရင် ပြမယ် View
class _APIErrorMessageView extends StatelessWidget {
  const _APIErrorMessageView();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Selector<DreamsListBloc, String?>(
            selector: (_, bloc) => bloc.getErrorMessage,
            builder: (_, errorMessage, __) {
              return Text(errorMessage.toString(),
                  style: TextStyle(
                    fontSize: kFontSize18x,
                  ));
            }));
  }
}

///Scrollable Dream List View တွေအတွက် widget class
class _DreamsListView extends StatelessWidget {
  const _DreamsListView();

  @override
  Widget build(BuildContext context) {
    return Selector<DreamsListBloc, List<BlogHeaderVO>?>(
        selector: (_, bloc) => bloc.getBlogHeaderList,
        builder: (_, dreamsList, __) {
          if (dreamsList != null && dreamsList.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (_, index) {
                return _DreamsItemView(
                  blogHeaderVO: dreamsList[index],
                );
              },
              itemCount: 10,
              separatorBuilder: (_, index) => const SizedBox(
                height: kSP10x,
              ),
            );
          }
          return const SizedBox.shrink();
        });
  }
}

///ListView ထဲက Dream Item တစ်ခုခြင်းဆီကို render ပေးမယ့် widget class
class _DreamsItemView extends StatelessWidget {
  const _DreamsItemView({
    required this.blogHeaderVO,
  });

  final BlogHeaderVO blogHeaderVO;
  @override
  Widget build(BuildContext context) {
    return TouchableListTileWidget(
      onTap: () {
        context.navigateToNextPage(DreamsDetailsPage(
          blogID: blogHeaderVO.id,
          title: blogHeaderVO.title,
        ));
      },
      subTitle: 'Explore more',
      title: blogHeaderVO.title,
      leadingWidget: CircleAvatar(
        child: Text(blogHeaderVO.prefixWord ?? ''),
      ),
    );
  }
}
