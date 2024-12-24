import 'package:flutter/material.dart';

///Context ကနေတစ်ဆင့် အသုံးပြုလို့ရမယ့် method တွေ စုထားမယ့် extensions class
extension ContextExtensions on BuildContext {
  ///နောက် Page ကို navigate ရင် သုံးမယ့် method
  Future navigateToNextPage(Widget nextPage) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => nextPage));

  ///အရင် Page ကို ပြန်သွားချင်ရင်  သုံးမယ့် method
  void navigateToBack() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }
}
