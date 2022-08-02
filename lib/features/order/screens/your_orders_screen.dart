import 'package:kaam24x7/common/widgets/loader.dart';
import 'package:kaam24x7/common/widgets/search_nav_bar.dart';
import 'package:kaam24x7/features/account/services/acount_services.dart';
import 'package:kaam24x7/features/account/widgets/single_product.dart';
import 'package:kaam24x7/features/order/screens/order_details_screen.dart';
import 'package:kaam24x7/features/order/services/your_order_services.dart';
import 'package:kaam24x7/features/order/widgets/order_top_view.dart';
import 'package:kaam24x7/features/order/widgets/your_order_cell.dart';
import 'package:kaam24x7/models/all_product.dart';
import 'package:kaam24x7/models/order.dart';
import 'package:kaam24x7/models/products.dart';
import 'package:flutter/material.dart';

class YourOrderScreen extends StatefulWidget {
  static const String routName = '/your-order';
  const YourOrderScreen({Key? key}) : super(key: key);

  @override
  State<YourOrderScreen> createState() => _YourOrderScreenState();
}

class _YourOrderScreenState extends State<YourOrderScreen> {
  final YourOrderServices orderServices = YourOrderServices();

  List<AllProduct>? products;
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    products = await orderServices.fetchRecentOrderProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchNavBar(),
      ),
      body: products == null
          ? const Loader()
          : Column(
              children: [
                const OrderTopView(),
                Expanded(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {},
                        child: YourOrderCell(
                          product: products![index],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
    );
  }
}
