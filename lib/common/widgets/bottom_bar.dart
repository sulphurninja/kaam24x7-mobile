import 'package:kaam24x7/constants/global_variables.dart';
import 'package:kaam24x7/features/account/screens/account_screen.dart';
import 'package:kaam24x7/features/cart/screens/cart_screen.dart';
import 'package:kaam24x7/features/settings/screens/settings_screen.dart';
import 'package:kaam24x7/home/screens/home_screen.dart';
import 'package:kaam24x7/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual_home';

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double borderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const SettingScreen(),
    const CartScreen(),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: borderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
            label: '',
          ),
          // ACCOUNT

          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: borderWidth,
                  ),
                ),
              ),
              child: Image.asset(
                'assets/images/category.png',
                height: 30,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: borderWidth,
                  ),
                ),
              ),
              child: Badge(
                elevation: 0,
                badgeContent: Text(userCartLen.toString()),
                badgeColor: Colors.white,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
