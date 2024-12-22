import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  final double courseSliderValue;
  final bool isVideo;
  final String courseName;
  const CardSlider(
      {super.key,
      required this.courseName,
      required this.courseSliderValue,
      required this.isVideo});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 5,
      color: isVideo
          ? const Color.fromARGB(255, 47, 186, 85)
          : const Color.fromARGB(255, 51, 175, 177),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: isVideo
                        ? const Icon(
                            Icons.movie_outlined,
                            color: Color.fromARGB(255, 3, 121, 217),
                            size: 40,
                          )
                        : const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.pink,
                            size: 40,
                          )),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseName,
                      style: const TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    isVideo
                        ? const Text(
                            'Chapter-4.3.1 / 08 | 226 mins',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          )
                        : const Text(
                            'Ch-4.3.1 / 08 | 12 Pages',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    activeColor: Colors.white,
                    inactiveColor: const Color.fromARGB(255, 212, 206, 206),
                    value: courseSliderValue,
                    min: 0,
                    max: 1,
                    onChanged: (value) {},
                  ),
                ),
                Text(
                  '${(courseSliderValue * 100).round()}%',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
