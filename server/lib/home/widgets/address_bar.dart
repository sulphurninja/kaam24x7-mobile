import 'package:kaam24x7/features/address/screens/address_list_screen.dart';
import 'package:kaam24x7/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return GestureDetector(
      onTap: (() {
        Navigator.pushNamed(context, AllAddressScreen.routeName);
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
        padding: const EdgeInsets.only(left: 320),
        child: Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  ' ${user.name}  ${user.address} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 2,
                top: 2,
              ),
              child: Icon(
                Icons.arrow_drop_down_outlined,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
