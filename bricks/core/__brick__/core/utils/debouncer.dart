import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer _timer;

  Debouncer({this.milliseconds = 300}) : _timer = Timer(Duration(milliseconds: milliseconds), () {});

  run(void Function() action) {
    _timer.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
