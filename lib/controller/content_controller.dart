import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentControllerProvider =
    StateNotifierProvider<ContentController, int>((ref) {
  return ContentController(0);
});

class ContentController extends StateNotifier<int> {
  ContentController(super.state);

  void setPosition(int value) {
    state = value;
  }
}
