import 'package:get/get.dart';
import 'package:skill_it/Models/notification_model.dart';

class NotificationsController extends GetxController {
  var allNotifications = <Notifications>[].obs;

  @override
  void onInit() {
    fetchCourses();
    super.onInit();
  }

  void fetchCourses() {
    var notifications = [
    Notifications(
      message: 'Neelu Verma has assigned a new assignment in Machine Learning.',
      date: 'Today at 10:49 AM',
      view: true,
      where: 'Assignment',
    ),
    Notifications(
      message: 'Continue a lesson to maintain your 36 daystreak',
      date: 'Today at 9:00 AM',
      view: true,
      where: 'Challenge',
    ),
    Notifications(
      message: 'New Challenge Alert! Solve the latest coding challenge and make it to the leaderboard!',
      date: 'Wednesday at 10:49 AM',
      view: false,
      where: '',
    ),
    Notifications(
      message: 'Congratulations Champion! You\'ve made it to the leaderboard owing to your unmatched consistency.',
      date: 'Aug 23 at 10:49 AM',
      view: true,
      where: 'Leaderboard',
    ),
  ];

    allNotifications.assignAll(notifications);
  }
}
