import 'dart:convert';

import 'package:kaam24x7/constants/error_handling.dart';
import 'package:kaam24x7/constants/global_variables.dart';
import 'package:kaam24x7/constants/utils.dart';
import 'package:kaam24x7/models/all_product.dart';
import 'package:kaam24x7/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class YourOrderServices {
  Future<List<AllProduct>> fetchRecentOrderProducts({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<AllProduct> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/api/orders/products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              AllProduct.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
