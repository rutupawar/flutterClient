import 'package:client/features/view/widgets/videolist.dart';
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
            children: [
              Text('starts here'),
              VideoList(playListId: 'PLafSq5UblCNWzrBiEOwBeIdoU8AFXfTqp'),
              Text('ends here'),
            ],
          ),
        ),
      ),
    );
  }
}
