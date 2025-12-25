import 'package:client/features/model/course_md.dart';
import 'package:client/features/view/widgets/video_list.dart';
import 'package:flutter/material.dart';
import 'package:client/features/view/widgets/course_tile_banner.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoList(playListId: course.id),
          ),
        );
      },
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
