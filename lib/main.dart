import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_target/db_target/db_target.dart';
import 'package:my_target/pages/target_add/target_add_binding.dart';
import 'package:my_target/pages/target_add/target_add_get.dart';
import 'package:my_target/pages/target_add/target_add_view.dart';
import 'package:my_target/pages/target_first/target_details/target_details_binding.dart';
import 'package:my_target/pages/target_first/target_details/target_details_view.dart';
import 'package:my_target/pages/target_first/target_first_binding.dart';
import 'package:my_target/pages/target_first/target_first_view.dart';
import 'package:my_target/pages/target_pool/target_pool_binding.dart';
import 'package:my_target/pages/target_pool/target_pool_view.dart';
import 'package:my_target/pages/target_second/target_second_binding.dart';
import 'package:my_target/pages/target_second/target_second_view.dart';
import 'package:my_target/pages/target_tab/target_tab_binding.dart';
import 'package:my_target/pages/target_tab/target_tab_view.dart';

Color primaryColor = Colors.black;
Color bgColor = const Color(0xff16171e);
List<Color> itemColors = const [
  Color(0xff74f7d6),
  Color(0xffffc4ed),
  Color(0xfffff580),
  Color(0xffffa280),
  Color(0xffa4ff8e),
  Color(0xff5cb0ff),
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBTarget().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RPages,
      initialRoute: '/target',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: const Color(0xffc4c4c4).withOpacity(0.6)),
          unselectedItemColor: const Color(0xffc4c4c4).withOpacity(0.6),
          selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          selectedItemColor: Colors.white,
          elevation: 0,
          backgroundColor: const Color(0xff2c2c2c),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> RPages = [
  GetPage(name: '/target', page: () => const TargetPoolView(), binding: TargetPoolBinding()),
  GetPage(name: '/targetTab', page: () => TargetTabPage(), binding: TargetTabBinding()),
  GetPage(name: '/targetFirst', page: () => TargetFirstPage(), binding: TargetFirstBinding()),
  GetPage(name: '/targetPool', page: () => const TargetAddGet()),
  GetPage(name: '/targetSecond', page: () => TargetSecondPage(), binding: TargetSecondBinding()),
  GetPage(name: '/targetAdd', page: () => TargetAddPage(), binding: TargetAddBinding()),
  GetPage(name: '/targetDetails', page: () => TargetDetailsPage(), binding: TargetDetailsBinding()),
];
