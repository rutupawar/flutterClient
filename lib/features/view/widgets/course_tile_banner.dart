import 'package:client/features/model/course_md.dart';
import 'package:flutter/material.dart';

class CourseTileBanner extends StatelessWidget {
  // why we didnt pass super.key here?
  const CourseTileBanner({required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            course.thumbnailUrl,
            fit: BoxFit.cover,
          ),

          // Gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black54,
                  Colors.transparent,
                ],
              ),
            ),
          ),

          // Title text
          Positioned(
            left: 12,
            bottom: 12,
            right: 12,
            child: Text(
              course.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}