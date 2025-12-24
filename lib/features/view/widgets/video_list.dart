import 'package:client/features/view/widgets/course_tile.dart';
import 'package:client/features/viewmodel/yt_md_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseList extends ConsumerWidget {
  const CourseList({super.key, required this.playListId});

  final String playListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseListAsync = ref.watch(playlistCourseVmProvider(playListId));

    return courseListAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (courseList) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: courseList.length,
          itemBuilder: (context, index) {
            final course = courseList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: CourseTile(course: course),
            );
          },
        );
      },
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
