import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin BlocedMixin<B extends BlocBase<S>, S> {
  B blocOf(BuildContext context) => BlocProvider.of(context);

  Widget blocBuilder({Key? key, BlocBuilderCondition<S>? buildWhen, required BlocWidgetBuilder<S> builder}) =>
      BlocBuilder<B, S>(key: key, buildWhen: buildWhen ?? (p, c) => p != c, builder: builder);

  Widget blocConsumer({
    Key? key,
    BlocListenerCondition<S>? listenWhen,
    required BlocWidgetListener<S> listener,
    BlocBuilderCondition<S>? buildWhen,
    required BlocWidgetBuilder<S> builder,
  }) => BlocConsumer<B, S>(
    key: key,
    listenWhen: listenWhen,
    listener: listener,
    buildWhen: buildWhen ?? (p, c) => p != c,
    builder: builder,
  );

  Widget blocListener({
    Key? key,
    BlocListenerCondition<S>? listenWhen,
    required BlocWidgetListener<S> listener,
    Widget? child,
  }) => BlocListener<B, S>(key: key, listenWhen: listenWhen, listener: listener, child: child);

  Widget blocValueBuilder<T>({Key? key, required T Function(S state) getter, required BlocWidgetBuilder<T> builder}) =>
      blocBuilder(
        key: key,
        buildWhen: (p, c) => getter(p) != getter(c),
        builder: (context, state) => builder(context, getter(state)),
      );

  Widget blocValueWhenBuilder<T, W>({
    Key? key,
    required W Function(S state) when,
    required T Function(S state) getter,
    required BlocWidgetBuilder<T> builder,
  }) => blocBuilder(
    key: key,
    buildWhen: (p, c) => (getter(p) != getter(c)) || (when(p) != when(c)),
    builder: (context, state) => builder(context, getter(state)),
  );

  Widget blocValueListener<T>({
    Key? key,
    required T Function(S state) getter,
    required BlocWidgetListener<T> listener,
    Widget? child,
  }) => blocListener(
    key: key,
    listenWhen: (p, c) => getter(p) != getter(c),
    listener: (context, state) => listener(context, getter(state)),
    child: child,
  );
}
