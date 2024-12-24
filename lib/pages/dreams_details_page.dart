import 'package:dreams_sample/bloc/dreams_details_bloc.dart';
import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/resources/asset_images.dart';
import 'package:dreams_sample/resources/dimens.dart';
import 'package:dreams_sample/resources/strings.dart';
import 'package:dreams_sample/utils/enums.dart';
import 'package:dreams_sample/widgets/loading_widget.dart';
import 'package:dreams_sample/widgets/text_field_widget.dart';
import 'package:dreams_sample/widgets/touchable_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Dreams Details Page အတွက် widget class
class DreamsDetailsPage extends StatelessWidget {
  const DreamsDetailsPage({
    super.key,
    required this.title,
    required this.blogID,
  });

  final String title;
  final int blogID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DreamsDetailsBloc>(
      create: (_) => DreamsDetailsBloc(blogID: blogID),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Selector<DreamsDetailsBloc, LoadingState>(
            selector: (_, bloc) => bloc.getLoadingState,
            builder: (_, loadingState, __) {
              if (loadingState == LoadingState.kLoading) {
                return LoadingWidget();
              }
              if (loadingState == LoadingState.kError) {
                return _APIErrorMessageView();
              }
              return _DreamsDetailsSearchAndListView();
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
        child: Selector<DreamsDetailsBloc, String?>(
            selector: (_, bloc) => bloc.getErrorMessage,
            builder: (_, errorMessage, __) {
              return Text(errorMessage.toString(),
                  style: TextStyle(
                    fontSize: kFontSize18x,
                  ));
            }));
  }
}

///Dream List နဲ့ Search View အတွက် widget class
class _DreamsDetailsSearchAndListView extends StatelessWidget {
  const _DreamsDetailsSearchAndListView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DreamsDetailsBloc>();
    return Padding(
      padding: const EdgeInsets.all(kSP10x),
      child: Column(
        spacing: kSP10x,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Search Text Field View
          TextFieldWidget(
            isAddValidator: true,
            hintText: 'Search',
            prefixIcon: Icons.search,
            onChanged: (keyword) {
              bloc.onSearchWithKeyWord(keyword);
            },
          ),

          ///Dreams List View
          Expanded(
            child: _DreamsListView(),
          ),
        ],
      ),
    );
  }
}

///Data Search လို့ မတွေ့ရင် ပေါ်မယ့် widget class
class _DataNotFoundView extends StatelessWidget {
  const _DataNotFoundView();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSP10x,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(kNotFoundImagePath),
        Text(
          kNotFoundDataText,
          style: TextStyle(
            fontSize: kFontSize18x,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

///Scrollable Dream List View တွေအတွက် widget class
class _DreamsListView extends StatelessWidget {
  const _DreamsListView();

  @override
  Widget build(BuildContext context) {
    return Selector<DreamsDetailsBloc, List<BlogDetailsVO>?>(
        selector: (_, bloc) => bloc.getSearchBlogDetailsList,
        builder: (_, searchList, __) {
          if (searchList != null && searchList.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (_, index) {
                return _DreamsItemView(
                  blogDetailsVO: searchList[index],
                );
              },
              itemCount: searchList.length,
              separatorBuilder: (_, index) => const SizedBox(
                height: kSP10x,
              ),
            );
          }

          return _DataNotFoundView();
        });
  }
}

///ListView ထဲက Dream Item တစ်ခုခြင်းဆီကို render ပေးမယ့် widget class
class _DreamsItemView extends StatelessWidget {
  const _DreamsItemView({
    required this.blogDetailsVO,
  });

  final BlogDetailsVO blogDetailsVO;
  @override
  Widget build(BuildContext context) {
    return TouchableListTileWidget(
      isShowTrailing: false,
      onTap: () {},
      subTitle: '',
      title: blogDetailsVO.blogContent,
      leadingWidget: Icon(
        Icons.settings_system_daydream,
      ),
    );
  }
}
