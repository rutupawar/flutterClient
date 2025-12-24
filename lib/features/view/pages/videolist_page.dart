import 'package:client/features/view/widgets/videolist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

class VideolistPage extends StatelessWidget {
  const VideolistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(title: const material.Text('Video List')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text('starts here'),
            VideoList(playListId: 'PL1utRShoP_tzB0WTFP3Yc4-7b-e_bZHL5'),
            Text('ends here'),
          ],
        ),
      ),
    );
  }
}
