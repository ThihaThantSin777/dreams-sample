import 'package:flutter/material.dart';

///API Loading ဖြစ်နေချိန်ပြမယ့် widget
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
