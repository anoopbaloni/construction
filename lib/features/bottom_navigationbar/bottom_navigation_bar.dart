import 'package:flutter/material.dart';

import '../../utils/strings.dart';
import '../assignment_screen/persentation/assignment.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 2;

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.currency_rupee_rounded,
    Icons.pie_chart_outline,
    Icons.access_time_outlined,
    Icons.bubble_chart_outlined,
  ];

  final List<String> labels = [
    Strings.home,
    Strings.cashFlow,
    Strings.analytics,
    Strings.progress,
    Strings.material
  ];

  final List<Widget> screens = [
    Center(child: Text("Home Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Cash Flow Screen", style: TextStyle(fontSize: 24))),
    Assignment(),
    Center(child: Text("Progress Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Material Screen", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(

        decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
    topRight: Radius.circular(24),
    ),
    boxShadow: [
    BoxShadow(
    color: Colors.black12,
    blurRadius: 10,
    offset: Offset(0, -2),
    ),
    ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final bool isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icons[index],
                    color: isSelected ? Colors.blueAccent : Colors.black54,
                    size: 28,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    labels[index],
                    style: TextStyle(
                      color:
                      isSelected ? Colors.blueAccent : Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
