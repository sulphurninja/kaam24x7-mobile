import 'package:kaam24x7/common/widgets/search_nav_bar.dart';
import 'package:kaam24x7/constants/global_variables.dart';
import 'package:kaam24x7/features/account/services/acount_services.dart';
import 'package:kaam24x7/features/order/screens/your_orders_screen.dart';
import 'package:kaam24x7/features/webview/screen/web_screen.dart';
import 'package:kaam24x7/features/settings/screens/your_account.dart';
import 'package:flutter/material.dart';
import 'package:kaam24x7/home/widgets/top_categories.dart';
import 'package:kaam24x7/home/widgets/top_categories2.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = '/setting-screen';
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text('Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
          const SizedBox(
            height: 20,
          ),
          const TopCategoriestwo(),
        ],
      ),
    );
  }
}
