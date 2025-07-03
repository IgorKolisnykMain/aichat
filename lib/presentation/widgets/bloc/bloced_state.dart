import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aichat/presentation/widgets/bloc/bloced_mixin.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocedState<T extends StatefulWidget, B extends BlocBase<S>, S> extends State<T> with BlocedMixin<B, S> {
  late final B bloc;

  StreamSubscription<S>? _subscription;

  @override
  void initState() {
    super.initState();
    bloc = blocOf(context);
    _subscribe();
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  void didChangeBlocState(S? previousState, S state) {}

  void _subscribe() {
    S? previousState;
    _subscription = bloc.stream.startWith(bloc.state).listen((state) {
      didChangeBlocState(previousState, state);
      previousState = state;
    });
  }

  void _unsubscribe() {
    _subscription?.cancel();
    _subscription = null;
  }
}
