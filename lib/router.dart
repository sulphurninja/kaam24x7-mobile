import 'package:kaam24x7/common/widgets/bottom_bar.dart';
import 'package:kaam24x7/features/address/screens/address_list_screen.dart';
import 'package:kaam24x7/features/address/screens/address_screen.dart';
import 'package:kaam24x7/features/address/screens/new_address_screen.dart';
import 'package:kaam24x7/features/admin/screen/add_product_screen.dart';
import 'package:kaam24x7/features/auth/screens/auth_screen.dart';
import 'package:kaam24x7/features/cart/screens/cart_screen.dart';
import 'package:kaam24x7/features/order/screens/order_details_screen.dart';
import 'package:kaam24x7/features/order/screens/your_orders_screen.dart';
import 'package:kaam24x7/features/products/screens/product_details_screen.dart';
import 'package:kaam24x7/features/search/screens/search_screen.dart';
import 'package:kaam24x7/features/settings/screens/settings_screen.dart';
import 'package:kaam24x7/features/settings/screens/your_account.dart';
import 'package:kaam24x7/features/webview/screen/web_screen.dart';
import 'package:kaam24x7/home/screens/category_deals_screen.dart';
import 'package:kaam24x7/home/screens/home_screen.dart';
import 'package:kaam24x7/models/order.dart';
import 'package:kaam24x7/models/products.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );

    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );

    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderDetailsScreen.routName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailsScreen(
          order: order,
        ),
      );
    case YourOrderScreen.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const YourOrderScreen(),
      );

    case SettingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SettingScreen(),
      );

    case CartScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CartScreen(),
      );

    case WebViewScreen.routeName:
      var urlString = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        fullscreenDialog: true,
        builder: (_) => WebViewScreen(
          urlString: urlString,
        ),
      );

    case YourAccountScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const YourAccountScreen(),
      );
    case AddAddressScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddAddressScreen(),
      );
    case AllAddressScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AllAddressScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}
