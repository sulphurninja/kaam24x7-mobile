import 'package:kaam24x7/common/widgets/search_nav_bar.dart';
import 'package:kaam24x7/constants/global_variables.dart';
import 'package:kaam24x7/features/search/screens/search_screen.dart';
import 'package:kaam24x7/features/settings/screens/settings_screen.dart';
import 'package:kaam24x7/home/widgets/address_bar.dart';
import 'package:kaam24x7/home/widgets/carousel_image.dart';
import 'package:kaam24x7/home/widgets/deal_of_day.dart';
import 'package:kaam24x7/home/widgets/feature_category.dart';
import 'package:kaam24x7/home/widgets/pocket_friendly_store.dart';
import 'package:kaam24x7/home/widgets/top_categories.dart';
import 'package:flutter/material.dart';
import 'package:kaam24x7/home/widgets/my_profile.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Myprofile(),
            Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 100,
            ),
            const Text(
              'Serving every Household!',
              style: TextStyle(fontFamily: 'Trajan Pro'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'What ',
              style: TextStyle(
                fontSize: 50,
                color: GlobalVariables.textcolor,
              ),
            ),
            const Text(
              'are you looking for?',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            const SearchNavBar(),
            const SizedBox(
              height: 30,
            ),
            const TopCategories(),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                SettingScreen.routeName,
              ),
              child: Image.asset(
                'assets/images/more.png',
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CarouselImage(),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 237, 233, 225),
            ),
            const DealOfDay(),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 237, 233, 225),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 5,
                bottom: 10,
              ),
              child: Text(
                'Kaam24x7 Exclusive',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                'https://m.media-amazon.com/images/I/71DIdPcx3ML._SR1050,1050_.jpg',
                width: double.maxFinite,
                fit: BoxFit.fill,
                height: 380,
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              color: Color.fromARGB(255, 237, 233, 225),
            ),
          ],
        ),
      ),
    );
  }
}
