import 'package:client/features/model/course_md.dart';
import 'package:flutter/material.dart';
import 'package:client/features/view/widgets/banner.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, this.onTap});

  final Course course;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        // this will clip the banner image to rounded corners. Its needed when provided rounded corners to the card
        clipBehavior: Clip.antiAlias,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseTileBanner(course: course),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                course.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
