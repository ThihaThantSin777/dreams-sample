import 'package:flutter/material.dart';

///ListTile ကို onTap Action ပါတဲ့ reusable widget class
class TouchableListTileWidget extends StatelessWidget {
  const TouchableListTileWidget({
    super.key,
    required this.onTap,
    required this.subTitle,
    required this.title,
    required this.leadingWidget,
    this.isShowTrailing = true,
  });

  final Widget leadingWidget;
  final String title;
  final String subTitle;
  final Function onTap;
  final bool isShowTrailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: leadingWidget,
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: isShowTrailing ? const Icon(Icons.arrow_circle_right) : null,
    );
  }
}
