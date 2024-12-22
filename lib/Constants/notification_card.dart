import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  final String date;
  final bool  view;
  final String? where;
  const NotificationCard({super.key, required this.message, required this.date, required this.view, required this.where});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/admin.png'),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      message,
                      style:const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      ),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(height: 5,),
                    view? InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding:const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'View $where',
                          style:const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                    :const SizedBox(),
                    const SizedBox(height: 5,),
                     Text(
                      date,
                      style:const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5,),
    
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
