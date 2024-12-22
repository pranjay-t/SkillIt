import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_it/Constants/card_slider.dart';
import 'package:skill_it/Controllers/courses_controller.dart';

class ContinueLearningScreen extends StatelessWidget {
  const ContinueLearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CoursesController coursesController = Get.put(CoursesController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Continue Learning',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All >',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            Column(
              children: [
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: coursesController.allCourses.length, 
                    itemBuilder: (BuildContext context, int index) {
                      final course = index < 2
                          ? coursesController.allCourses[index]
                          : null;
                      if (course != null) {
                        return SizedBox(
                          height: 130,
                          width: double.infinity,
                          child: CardSlider(
                            courseName: index == 1 ? 'Web Development' : course.name,
                            courseSliderValue: double.parse(course.completion),
                            isVideo: course.isVideo,
                          ),
                        );
                      } else {
                        return const SizedBox(); 
                      }
                    },
                  );
                }),
                const SizedBox(height: 20,),
                Card(
                  elevation: 1,
                  borderOnForeground: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/img2.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          top: 26
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'It takes just two minutes to',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            const Text(
                              'Level Up Your Skills!',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                fixedSize: const Size(190, 45),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide.none,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Take Flash Quiz',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 25,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
