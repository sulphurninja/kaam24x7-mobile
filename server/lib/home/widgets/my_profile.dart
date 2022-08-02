import 'package:kaam24x7/features/address/screens/address_list_screen.dart';
import 'package:kaam24x7/features/settings/screens/your_account.dart';
import 'package:kaam24x7/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return GestureDetector(
      onTap: (() {
        Navigator.pushNamed(context, YourAccountScreen.routeName);
      }),
      child: Container(
        height: 40,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            stops: [
              0.5,
              1.0,
            ],
          ),
        ),
        padding: const EdgeInsets.only(left: 330),
        child: Row(
          children: [
            const Icon(
              Icons.account_circle,
              size: 40,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 3),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 2,
                top: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
