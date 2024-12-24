import 'package:flutter/material.dart';

class TouchableListTileWidget extends StatelessWidget {
  const TouchableListTileWidget({
    super.key,
    required this.onTap,
    required this.subTitle,
    required this.title,
    required this.leadingIcon,
  });

  final IconData leadingIcon;
  final String title;
  final String subTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: Icon(leadingIcon),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_circle_right),
    );
  }
}
