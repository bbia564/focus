import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus_mode/db_focus/db_focus.dart';
import 'package:focus_mode/pages/focus_add/focus_add_binding.dart';
import 'package:focus_mode/pages/focus_add/focus_add_view.dart';
import 'package:focus_mode/pages/focus_details/focus_details_binding.dart';
import 'package:focus_mode/pages/focus_details/focus_details_view.dart';
import 'package:focus_mode/pages/focus_first/focus_first_binding.dart';
import 'package:focus_mode/pages/focus_first/focus_first_view.dart';
import 'package:focus_mode/pages/focus_out/focus_out_binding.dart';
import 'package:focus_mode/pages/focus_out/focus_out_view.dart';
import 'package:focus_mode/pages/focus_second/focus_second_binding.dart';
import 'package:focus_mode/pages/focus_second/focus_second_view.dart';
import 'package:focus_mode/pages/focus_tab/focus_tab_binding.dart';
import 'package:focus_mode/pages/focus_tab/focus_tab_view.dart';
import 'package:focus_mode/pages/no_network/no_network_binding.dart';
import 'package:focus_mode/pages/no_network/no_network_view.dart';
import 'package:focus_mode/pages/records/records_binding.dart';
import 'package:focus_mode/pages/records/records_view.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff2878ff);
Color bgColor = const Color(0xfff4f4f4);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBFocus().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Focus,
      initialRoute: '/focusTab',
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
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
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
List<GetPage<dynamic>> Focus = [
  GetPage(name: '/error_net', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/focusTab', page: () => FocusTabPage(), binding: FocusTabBinding()),
  GetPage(name: '/focusSecond', page: () => FocusSecondPage(), binding: FocusSecondBinding()),
  GetPage(name: '/focusFirst', page: () => FocusFirstPage(), binding: FocusFirstBinding()),
  GetPage(name: '/focusDetails', page: () => FocusDetailsPage(), binding: FocusDetailsBinding()),
  GetPage(name: '/focusAdd', page: () => FocusAddPage(), binding: FocusAddBinding()),
  GetPage(name: '/focusOut', page: () => FocusOutPage(), binding: FocusOutBinding()),
  GetPage(name: '/records', page: () => RecordsPage(), binding: RecordsBinding()),
];