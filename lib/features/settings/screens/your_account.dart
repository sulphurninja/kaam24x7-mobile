import 'package:kaam24x7/common/widgets/search_nav_bar.dart';
import 'package:kaam24x7/features/address/screens/address_list_screen.dart';
import 'package:kaam24x7/features/address/screens/new_address_screen.dart';
import 'package:kaam24x7/features/order/screens/your_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:kaam24x7/features/settings/screens/settings_screen.dart';

class YourAccountScreen extends StatefulWidget {
  static const String routeName = '/your-account';
  const YourAccountScreen({Key? key}) : super(key: key);

  @override
  State<YourAccountScreen> createState() => _YourAccountScreenState();
}

class _YourAccountScreenState extends State<YourAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchNavBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AccountHeader(title: 'Orders'),
              const SizedBox(
                height: 10,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, YourOrderScreen.routName);
                      },
                      title: const Text('Your Orders'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const AccountHeader(title: 'Account Settings'),
              const SettingBottomView(),
              const SizedBox(
                height: 10,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AllAddressScreen.routeName);
                      },
                      title: const Text('Your Address'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AddAddressScreen.routeName);
                      },
                      title: const Text('Add Address'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountHeader extends StatelessWidget {
  final String title;
  const AccountHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
