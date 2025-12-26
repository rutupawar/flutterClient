import 'package:client/features/view/widgets/course_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(title: const material.Text('Course List')),
      body: ListView(
        children: [
          CourseList(playListId: 'PL1utRShoP_twtWi_uGZvdVay7qmJ6p1WS'),
          CourseList(playListId: 'PL1utRShoP_twtWi_uGZvdVay7qmJ6p1WS'),
          CourseList(playListId: 'PL1utRShoP_twtWi_uGZvdVay7qmJ6p1WS'),
          CourseList(playListId: 'PL1utRShoP_twtWi_uGZvdVay7qmJ6p1WS'),
          CourseList(playListId: 'PL1utRShoP_twtWi_uGZvdVay7qmJ6p1WS'),
          CourseList(playListId: 'PL1utRShoP_twtWi_uGZvdVay7qmJ6p1WS'),
          CourseList(playListId: 'PL1utRShoP_twtWi_uGZvdVay7qmJ6p1WS'),
          CourseList(playListId: 'PL1utRShoP_twtWi_uGZvdVay7qmJ6p1WS'),
        ],
      ),
    );
  }
}
