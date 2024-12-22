import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 50,left: 20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pranjay Tiwari',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'B. Tech Student',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 40,),
            ListTile(
              title: Text('Courses',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,),),
              leading: Icon(Icons.school,color: Color.fromARGB(255, 13, 5, 173),size: 26,),
            ),
            ListTile(
              title: Text('Assignments',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
              leading: Icon(Icons.assignment,color: Color.fromARGB(255, 13, 5, 173),size: 26,),
            ),
            ListTile(
              title: Text('Progress',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
              leading: Icon(Icons.auto_graph_rounded,color: Color.fromARGB(255, 13, 5, 173),size: 26,),
            ),
            ListTile(
              title: Text('Reports',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
              leading: Icon(Icons.report_sharp,color: Color.fromARGB(255, 13, 5, 173),size: 26,),
            ),
            ListTile(
              title: Text('Blogs',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
              leading: Icon(Icons.article,color: Color.fromARGB(255, 13, 5, 173),size: 26,),
            ),
            SizedBox(height: 40,),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
            ),ListTile(
              title: Text('Logout Account'),
              leading: Icon(Icons.logout,color: Colors.red,),
            ),
          ],
        ),
      )),
    );
  }
}
