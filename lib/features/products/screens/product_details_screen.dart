// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:kaam24x7/common/widgets/custom_button.dart';
import 'package:kaam24x7/common/widgets/rating_stars.dart';
import 'package:kaam24x7/common/widgets/search_nav_bar.dart';
import 'package:kaam24x7/features/cart/screens/cart_screen.dart';
import 'package:kaam24x7/features/products/services/product_services.dart';
import 'package:kaam24x7/models/products.dart';
import 'package:kaam24x7/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:kaam24x7/constants/global_variables.dart';
import 'package:kaam24x7/features/search/screens/search_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-detail';
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductServices productService = ProductServices();
  double avgRating = 0;
  double myRating = 0;
  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.rating!.length; i++) {
      totalRating += widget.product.rating![i].rating;

      if (widget.product.rating![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.rating![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.product.rating!.length;
    }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void addToCart() {
    productService.addToCart(context: context, product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SearchNavBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  Stars(rating: avgRating),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.product.name,
                style: const TextStyle(fontSize: 15),
              ),
              CarouselSlider(
                items: widget.product.images.map((i) {
                  return Builder(
                      builder: (BuildContext context) => Image.network(
                            i,
                            fit: BoxFit.fitHeight,
                            height: 200,
                          ));
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 300,
                ),
              ),
              Container(
                height: 5,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Deal Price: ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '₹ ${widget.product.price}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 5,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Add to Cart',
                onTap: addToCart,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Jump to Cart',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    CartScreen.routeName,
                  );
                },
                color: const Color.fromRGBO(254, 216, 19, 1),
                textColor: Color.fromARGB(255, 255, 255, 255),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.description,
              ),
              Container(
                height: 5,
                color: Colors.black12,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Rate The Service',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RatingBar.builder(
                initialRating: myRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: GlobalVariables.secondaryColor,
                ),
                onRatingUpdate: (rating) {
                  productService.rateProduct(
                    context: context,
                    product: widget.product,
                    rating: rating,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
