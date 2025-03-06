
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg2/bloc/counter_bloc.dart';
import 'package:gg2/cubit/counter_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                BlocBuilder<CounterBloc,int>(
                  builder: (context,state) {
                    return Text(
                      '$state',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: ()=>counterBloc.add(CounterIncrement()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              SizedBox(height: 10,),
              FloatingActionButton(
                onPressed: ()=>counterBloc.add(CounterDecrement()),
                tooltip: 'Decrement',
                child: const Icon(Icons.minimize),
              ),
            ],
          ),
        );
  }
}
