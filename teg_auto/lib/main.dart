import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teg_auto/counter_bloc.dart';
import 'package:teg_auto/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teg Auto",
      theme: ThemeData(primaryColor: Colors.blue),
      home: BlocProvider<CounterBloc>(
        create: (_) => CounterBloc(),
        child: const CounterPage(title: "TEG Auto"),
      ),
    );
  }
}
