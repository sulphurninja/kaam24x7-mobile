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
  bool _expanded = false;
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
          const Expanded(
            child: Text(''),
          ),
          // const SettingBottomView(),
        ],
      ),
    );
  }
}

class SettingTopView extends StatelessWidget {
  const SettingTopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 140,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: 'https://pay.amazon.com/');
                  },
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/a_pay.jpeg',
                          height: 100,
                        ),
                      ),
                      const Text(
                        'Pay',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: 'https://www.amazon.in/minitv');
                  },
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Card(
                          elevation: 2,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/minitv.jpeg',
                            height: 100,
                          ),
                        ),
                      ),
                      const Text(
                        'miniTv',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, WebViewScreen.routeName,
                        arguments: 'https://www.amazongames.com/en-us');
                  },
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/funzone.jpeg',
                          height: 100,
                        ),
                      ),
                      const Text(
                        'Games',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingBottomView extends StatelessWidget {
  const SettingBottomView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, YourOrderScreen.routName),
                  },
                  child: const Text(
                    'Orders',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    AccountServices().logOut(context);
                    const Text('Sign Out');
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
