import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house/db_house/db_house.dart';
import 'package:my_house/pages/house_first/add_house/add_house_binding.dart';
import 'package:my_house/pages/house_first/add_house/add_house_view.dart';
import 'package:my_house/pages/house_first/add_tenant/add_tenant_binding.dart';
import 'package:my_house/pages/house_first/add_tenant/add_tenant_view.dart';
import 'package:my_house/pages/house_first/house_edit/house_edit_binding.dart';
import 'package:my_house/pages/house_first/house_edit/house_edit_view.dart';
import 'package:my_house/pages/house_first/house_first_binding.dart';
import 'package:my_house/pages/house_first/house_first_view.dart';
import 'package:my_house/pages/house_first/house_list/house_fact.dart';
import 'package:my_house/pages/house_first/house_list/house_list_binding.dart';
import 'package:my_house/pages/house_first/house_list/house_list_view.dart';
import 'package:my_house/pages/house_first/tenant_list/tenant_list_binding.dart';
import 'package:my_house/pages/house_first/tenant_list/tenant_list_view.dart';
import 'package:my_house/pages/house_second/house_second_binding.dart';
import 'package:my_house/pages/house_second/house_second_view.dart';
import 'package:my_house/pages/house_tab/house_tab_binding.dart';
import 'package:my_house/pages/house_tab/house_tab_view.dart';

Color primaryColor = const Color(0xff2188f8);
Color bgColor = const Color(0xfff8f8f8);
List<String> types = [
  'Two rooms',
  'One room with one living room',
  'Two rooms with one living room',
  'Three rooms with one living room',
  'Four rooms with one living room'
];
List<String> equipments = [
  'Sit north and south',
  'Complete set',
  'Fine decoration',
  '''There's air conditioning''',
  'Have a kitchen',
  '''There's a balcony''',
  'Lone Guard',
  'By the subway',
  'Near the bus stop',
  'Can be rented for short periods',
  'One for one',
  'Open the house anytime'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBHouse().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Rooms,
      initialRoute: '/',
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
List<GetPage<dynamic>> Rooms = [
  GetPage(name: '/', page: () => const HouseEditView(), binding: HouseEditBinding()),
  GetPage(name: '/house_tab', page: () => HouseTabPage(), binding: HouseTabBinding()),
  GetPage(name: '/house_second', page: () => HouseSecondPage(), binding: HouseSecondBinding()),
  GetPage(name: '/house_fact', page: () => const HouseFact()),
  GetPage(name: '/house_first', page: () => HouseFirstPage(), binding: HouseFirstBinding()),
  GetPage(name: '/house_list', page: () => HouseListPage(), binding: HouseListBinding()),
  GetPage(name: '/tenant_list', page: () => TenantListPage(), binding: TenantListBinding()),
  GetPage(name: '/add_house', page: () => AddHousePage(), binding: AddHouseBinding()),
  GetPage(name: '/add_tenant', page: () => AddTenantPage(), binding: AddTenantBinding()),
];