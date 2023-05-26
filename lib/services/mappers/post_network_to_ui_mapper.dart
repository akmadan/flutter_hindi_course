import 'package:flutter_hindi_course/services/models/post_model.dart';
import 'package:flutter_hindi_course/widgets/post_tile.dart';

class PostMapper {
  static map(PostResponse response) {
    return PostTileWidgetUiModel(title: response.title, body: response.body);
  }
}
