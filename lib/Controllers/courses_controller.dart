import 'package:get/get.dart';
import 'package:skill_it/Models/courses.dart';

class CoursesController extends GetxController {
  var allCourses = <Courses>[].obs;

  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  void fetchCourses() {
    var courses = [
      Courses(
        name: 'HTML',
        price: '1999',
        level: 'Beginner',
        imgUrl: 'assets/images/html.png',
        isVideo: false,
        completion: '0.53',
      ),
      Courses(
        name: 'HTML',
        price: '1999',
        level: 'Beginner',
        imgUrl: 'assets/images/html.png',
        isVideo: true,
        completion: '0.53',
      ),
      Courses(
        name: 'HTML',
        price: '1999',
        level: 'Beginner',
        imgUrl: 'assets/images/html.png',
        isVideo: false,
        completion: '0.53',
      ),
      Courses(
        name: 'HTML',
        price: '1999',
        level: 'Beginner',
        imgUrl: 'assets/images/html.png',
        isVideo: false,
        completion: '0.53',
      ),
      Courses(
        name: 'HTML',
        price: '1999',
        level: 'Beginner',
        imgUrl: 'assets/images/html.png',
        isVideo: false,
        completion: '0.53',
      ),
    ];

    allCourses.assignAll(courses);
  }
}
