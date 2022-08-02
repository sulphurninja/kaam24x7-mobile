import 'package:kaam24x7/constants/global_variables.dart';
import 'package:kaam24x7/home/screens/category_deals_screen.dart';
import 'package:flutter/material.dart';

class TopCategoriestwo extends StatelessWidget {
  const TopCategoriestwo({Key? key}) : super(key: key);

  void navigateToCategory(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      height: 600,
      width: 500,
      child: ListView.builder(
        itemCount: 9,
        scrollDirection: Axis.vertical,
        itemExtent: 200,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToCategory(
                context, GlobalVariables.categoryImages[index]['title']!),
            child: Column(
              children: [
                Positioned(
                  left: 40,
                  child: Image.asset(
                    GlobalVariables.categoryImages[index]['image']!,
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
