import 'package:flutter/material.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Learning',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.blue,
      ),
      body:
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Icon(
            Icons.error_outline,
            color: Colors.pink,
            size: 80,
          ),
          SizedBox(height: 20),
          Text(
            'Oops! Data not found.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink
            ),
          ),
        ],
      ),
    )
    );
  }
}