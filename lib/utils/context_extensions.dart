import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Future navigateToNextPage(Widget nextPage) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => nextPage));
}
