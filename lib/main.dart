import 'package:demo1/bloc/counter_bloc.dart';
import 'package:demo1/pages/home.dart';
import 'package:demo1/provider/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => NavBarProvider()),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}
