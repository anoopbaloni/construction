import 'package:assignment/features/assignment_screen/persentation/assignement_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedImageCarousel extends StatefulWidget {
  const AnimatedImageCarousel({super.key});

  @override
  State<AnimatedImageCarousel> createState() => _AnimatedImageCarouselState();
}

class _AnimatedImageCarouselState extends State<AnimatedImageCarousel> {


  @override
  Widget build(BuildContext context) {
    return Consumer<AssignmentProvider>(
      builder: (context,controller,child) {
        return Column(
          children: [
            SizedBox(
              height: 178,
              child: PageView.builder(
                itemCount: controller.imageUrls.length,
                controller: controller.pageController,
                onPageChanged: (index) {

                    controller.setCurrentPage(index);

                },
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: controller.pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (controller.pageController.position.haveDimensions) {
                        value = controller.pageController.page! - index;
                        value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                      }
                      return Center(
                        child: SizedBox(
                          height: Curves.easeOut.transform(value) * 178,
                          width: Curves.easeOut.transform(value) * 260,
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          controller. imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),

            Text(
              controller.imageNames[controller.currentPage],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.imageUrls.length,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentPage == index ? Colors.blue : Colors.grey[300],
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
