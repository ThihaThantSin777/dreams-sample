import 'package:dreams_sample/data/vos/blod_details/blog_details_vo.dart';
import 'package:dreams_sample/data/vos/blog_header/blog_header_vo.dart';
import 'package:dreams_sample/network/response/dreams_response/dreams_response.dart';
import 'package:dreams_sample/pages/dreams_list_page.dart';
import 'package:dreams_sample/persistent/constant.dart';
import 'package:dreams_sample/resources/colors.dart';
import 'package:dreams_sample/resources/dimens.dart';
import 'package:dreams_sample/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(DreamsResponseAdapter());
  Hive.registerAdapter(BlogHeaderVOAdapter());
  Hive.registerAdapter(BlogDetailsVOAdapter());

  await Hive.openBox<DreamsResponse>(kHiveBoxForDreamsResponse);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppNameText,
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kPrimaryColor,
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          color: kPrimaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: kFontSize21x,
          ),
        ),
      ),
      home: const DreamsListPage(),
    );
  }
}
