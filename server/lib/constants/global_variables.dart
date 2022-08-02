import 'package:flutter/material.dart';

String uri =
    'https://kaam24x7mobile.herokuapp.com'; // Please enter your local Ip  or //'https://arpa-amazon-clone.herokuapp.com'; //

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 255, 255, 255),
    ],
    stops: [0.5, 1.0],
  );

  static const appColor = Color.fromARGB(255, 0, 0, 0);
  static const textcolor = Color.fromARGB(255, 0, 0, 0);
  static const secondaryColor = Color.fromARGB(225, 171, 108, 40);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Color.fromARGB(255, 151, 85, 28);
  static const unselectedNavBarColor = Color.fromARGB(255, 151, 85, 28);

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://res.cloudinary.com/kaam-24x7/image/upload/v1659455368/Your_Furniture_tells_a_story...._holkwm.png',
    'https://res.cloudinary.com/kaam-24x7/image/upload/v1659455583/Can_t_lay_back_on_your_beloved_sofa_ovliyq.png',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Painting',
      'image': 'assets/images/painting.png',
    },
    {
      'title': 'Electronics',
      'image': 'assets/images/electronics.png',
    },
    {
      'title': 'Cleaning',
      'image': 'assets/images/cleaning.png',
    },
    {
      'title': 'Home Repair',
      'image': 'assets/images/household.png',
    },
    {
      'title': 'Sofa Repair',
      'image': 'assets/images/sofa.png',
    },
    {
      'title': 'Appliances Repair',
      'image': 'assets/images/appliancerepair.png',
    },
    {
      'title': 'Salon & Spa',
      'image': 'assets/images/massaging.png',
    },
    {
      'title': 'Photography',
      'image': 'assets/images/camera.png',
    },
    {
      'title': 'Mehndi',
      'image': 'assets/images/henna.png',
    },
  ];

  static const List<Map<String, String>> pfsImages = [
    {
      'title': 'Top picks under ₹199',
      'image':
          'https://m.media-amazon.com/images/I/31t0jAW8FoL._SR420,420_.jpg',
    },
    {
      'title': 'Top picks under ₹299',
      'image':
          'https://m.media-amazon.com/images/I/31E71zRxUCL._SR420,420_.jpg',
    },
    {
      'title': 'Top picks under ₹399',
      'image':
          'https://m.media-amazon.com/images/I/31BZoGXNQlL._SR420,420_.jpg',
    },
    {
      'title': 'Top picks under ₹499',
      'image':
          'https://m.media-amazon.com/images/I/31utcnt9VkL._SR420,420_.jpg',
    },
  ];
}
