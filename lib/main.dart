import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/assignment_screen/persentation/assignement_provider.dart';
import 'features/assignment_screen/persentation/assignment.dart';
import 'features/bottom_navigationbar/bottom_navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => AssignmentProvider()),

      ],
      child: MaterialApp(
        title: 'Assignment', debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
            })),
        home: const CustomBottomNavBar(),
      ),
    );
  }
}

