import 'dart:async';
import 'package:flutter_application_1/pages/classic_bloc/event.dart';
import 'package:flutter_application_1/pages/classic_bloc/state.dart';

class MyBloc {
  final MyState _state = MyState();

  final _controller = StreamController<MyState>();
  Sink<MyState> get _sink => _controller.sink;
  Stream<MyState> get stream => _controller.stream;

  final _eventController = StreamController<MyEvent>();
  StreamSink<MyEvent> get sink => _eventController.sink;
  Stream<MyEvent> get _eventStream => _eventController.stream;

  MyBloc() {
    _eventStream.listen((event) {
      switch (event) {
        case MyEvent.inc:
          _state.number++;
          break;
        case MyEvent.dec:
          _state.number--;
          break;
        case MyEvent.reset:
          _state.number = 0;
          break;
      }
      _sink.add(_state);
    });
  }

  dispose(){
    _controller.close();
    _eventController.close();
  }
}
