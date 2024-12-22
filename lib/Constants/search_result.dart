import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_it/Controllers/courses_controller.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final CoursesController coursesController = Get.put(CoursesController());
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 190, left: 20,right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        height: 500,
        width: double.infinity,
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: coursesController.allCourses.length,
          itemBuilder: (BuildContext context, int index) {
            final course = coursesController.allCourses[index];
            return SizedBox(
              width: double.infinity,
              height: 120,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                elevation: 5,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          course.imgUrl,
                          width: 55,
                        ),
                         Text(
                          course.name,
                          style:const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 215, 213, 213),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child:  Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                            child: Text(course.level,
                                style:const TextStyle(
                                    color: Color.fromARGB(255, 139, 139, 139))),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 215, 213, 213),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child:  Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                            child: Text('INR ${course.price}',
                                style:const TextStyle(
                                    color: Color.fromARGB(255, 139, 139, 139))),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child:  Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                            child:const Text(
                              'Explore',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
