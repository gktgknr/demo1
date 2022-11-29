import 'package:demo1/bloc/counter_bloc.dart';
import 'package:demo1/provider/navbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    final navBarProvider = Provider.of<NavBarProvider>(context);

    return Scaffold(
      body: navBarProvider.index == 1
          ? Center(
              child: CustomTextView(title: "Favorites"),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      if (state is CounterInitial) {
                        return CustomTextView(title: "Başlangıç");
                      }
                      if (state is CounterFailure) {
                        return CustomTextView(title: "Hata");
                      }
                      if (state is CounterSuccess) {
                        return CustomTextView(
                          title: state.counter.toString(),
                        );
                      }

                      return Text("data");
                    },
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BlueButton(
                        func: () {
                          bloc.add(DecrementEvent());
                        },
                        title: "Azalt",
                      ),
                      BlueButton(
                        func: () {
                          bloc.add(IncrementEvent());
                        },
                        title: "Arttir",
                      ),
                    ],
                  )
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Games"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
        iconSize: 36,
        selectedItemColor: Colors.blue,
        currentIndex: navBarProvider.index,
        onTap: (value) {
          print(value);
          navBarProvider.index = value;
        },
      ),
    );
  }
}

class CustomTextView extends StatelessWidget {
  const CustomTextView({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
          color: Colors.blue.shade900,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ));
  }
}

class BlueButton extends StatelessWidget {
  const BlueButton({
    Key? key,
    required this.func,
    required this.title,
  }) : super(key: key);

  final VoidCallback func;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
