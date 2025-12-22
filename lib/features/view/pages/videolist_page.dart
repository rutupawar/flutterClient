import 'package:client/features/view/widgets/video_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

class VideolistPage extends StatelessWidget {
  const VideolistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(title: const material.Text('Video List')),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Text('starts here'),
              VideoFrame(videoId: '3kaGC_DrUnw'),
              Text('ends here'),
            ],
          ),
        ),
      ),
    );
  }
}
