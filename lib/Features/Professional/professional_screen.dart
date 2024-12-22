import 'package:flutter/material.dart';

class ProfessionalScreen extends StatelessWidget {
  const ProfessionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: const Text('Professional',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),),
        backgroundColor: Colors.blue,
      ),
        body:const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 80,
                color: Colors.pink,
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
        ));
  }
}
