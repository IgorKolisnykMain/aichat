import 'package:rxdart/rxdart.dart';

class StreamModel<T> {
  final ValueStream<T?> stream;
  final T? value;

  StreamModel({required this.stream, required this.value});
}
