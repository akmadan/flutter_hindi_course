import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostTileWidget extends StatelessWidget {
  final PostTileWidgetUiModel uiModel;
  const PostTileWidget({super.key, required this.uiModel});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Text(uiModel.title),
                  Text(uiModel.body)],
              ),
            );
  }
}

class PostTileWidgetUiModel {
  final String title;
  final String body;
  PostTileWidgetUiModel({
    required this.title,
    required this.body,
  });
}
