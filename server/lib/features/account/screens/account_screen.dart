import 'package:kaam24x7/constants/global_variables.dart';
import 'package:kaam24x7/features/account/widgets/app_bar_title.dart';
import 'package:kaam24x7/features/account/widgets/orders.dart';
import 'package:kaam24x7/features/account/widgets/top_tags.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/more.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          AppBarTitle(),
          SizedBox(
            height: 30,
          ),
          TopTags(),
          SizedBox(
            height: 20,
          ),
          Orders(),
        ],
      ),
    );
  }
}
