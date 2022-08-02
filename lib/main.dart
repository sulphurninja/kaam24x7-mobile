import 'package:kaam24x7/common/widgets/bottom_bar.dart';
import 'package:kaam24x7/constants/global_variables.dart';
import 'package:kaam24x7/features/admin/screen/admin_screen.dart';
import 'package:kaam24x7/features/auth/screens/auth_screen.dart';
import 'package:kaam24x7/features/auth/services/auth_service.dart';
import 'package:kaam24x7/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaam 24x7',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 0, 0, 0),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      onGenerateRoute: (setttings) => generateRoute(setttings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
