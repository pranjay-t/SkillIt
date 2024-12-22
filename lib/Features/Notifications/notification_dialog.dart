import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_it/Controllers/notifications_controller.dart';
import 'package:skill_it/Constants/notification_card.dart';

class NotificationDialog extends StatelessWidget {
  const NotificationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.put(NotificationsController());

    return Dialog(
      alignment: Alignment.topRight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 700),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.more_vert)
              ],
            ),
            DefaultTabController(
              length: 2,
              child: Expanded(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        TabBar(
                          indicatorColor: Colors.pink,
                          labelColor: Colors.pink,
                          isScrollable: true,
                          tabs:  [
                            Tab(text: 'All'),
                            Tab(text: 'Important'),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20,left: 10),
                        child: TabBarView(
                          children: [
                            Obx((){
                              return ListView.builder(
                              itemCount: notificationController.allNotifications.length,
                              itemBuilder: (context, index) {
                                final notification = notificationController.allNotifications[index];
                                return NotificationCard(
                                  message: notification.message,
                                  date: notification.date,
                                  view: notification.view,
                                  where: notification.where,
                                );
                              },
                            );
                            }),
                            const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.pink,
                                    size: 50,
                                  ),
                                   SizedBox(height: 10),
                                   Text(
                                    'Oops! Data not found.',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.pink),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
