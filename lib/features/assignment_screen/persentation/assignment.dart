import 'package:assignment/features/assignment_screen/persentation/assignement_provider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/strings.dart';
import 'carasoule_slider.dart';

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AssignmentProvider>(
        builder: (context, controller, child) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 0),
                  // Profile & Notification Row
                  Row(
                    children: [
                      Image.asset("assets/images/profile.png"),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Strings.goodMorning,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: textColor,
                              ),
                            ),
                            Text(
                              Strings.shubham,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: whiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset("assets/images/notification.png"),
                            ),
                          ),
                          Positioned(
                            top: 4,
                            right: 6,
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Buttons list without ListView
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: List.generate(controller.listOfItem.length, (index) {
                            final isFirst = index == 0;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: GestureDetector(
                                onTap: () {
                                  // handle tap
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isFirst ? null : Colors.white,
                                    gradient: isFirst
                                        ? const LinearGradient(
                                      colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                                    )
                                        : null,
                                    borderRadius: BorderRadius.circular(12),
                                    border: isFirst
                                        ? null
                                        : Border.all(color: const Color(0xFF6A11CB), width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.listOfItem[index],
                                        style: TextStyle(
                                          color: isFirst ? whiteColor : blackColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: isFirst ? Colors.white : Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.start,
children: [

  Container(
    width: 250,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Color(0xFF2575FC)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Daily Progress",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: blackColor),
          ),
          const Text(
            "From all projects",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              CircularPercentIndicator(
                radius: 50,
                lineWidth: 10,
                percent: 0.9,
                progressColor: Color(0xFF6A11CB),
                backgroundColor: Colors.grey.shade300,
                circularStrokeCap: CircularStrokeCap.round,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xFF6A11CB),
                      child: Text(
                        "16",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text("Jan", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),

              Transform.translate(
                offset: Offset(0, -25),
                child: Container(

                  decoration: BoxDecoration(
                    color: Color(0xFF6A11CB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("0%", style: TextStyle(color: textColor1,
                            fontSize: 8,fontWeight: FontWeight.w400,
                            )),
                            Text("90%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                            Text("100%",  style: TextStyle(color: textColor1,
                              fontSize: 10,fontWeight: FontWeight.w400,
                            )),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text("Based on Reports",
                          style: TextStyle(color: textColor1,
                            fontSize: 10,fontWeight: FontWeight.w400,
                          )),
                      SizedBox(height: 3,)
                    ],
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    ),
  ),
  const SizedBox(height: 24),

  // Month Summary (January with dots)
  Container(
    width: 250,
    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.access_time),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("January"),  const Text("15 Days Remaining",
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Dots
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(30, (index) {
            final isActive = index < 15; // First 15 days = active
            return Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: isActive ? Color(0xFF6A11CB) : Colors.grey[300],
                shape: BoxShape.circle,
              ),
            );
          }),
        ),
      ],
    ),
  )



],                        ),
                      ),
                    ],
                  ),

                  AnimatedImageCarousel()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
