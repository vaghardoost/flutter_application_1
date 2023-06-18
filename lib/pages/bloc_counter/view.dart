import 'package:flutter/material.dart';
import '/pages/bloc_counter/bloc/counter.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocTrain extends StatefulWidget {
  const BlocTrain({super.key});

  @override
  State<BlocTrain> createState() => _BlocTrainState();
}

class _BlocTrainState extends State<BlocTrain> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) => _counterBloc,
        child: BlocListener<CounterBloc, int>(
          listener: (BuildContext context, state) {},
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, state) => Center(
              child: Column(
                children: [
                  Text("data $state"),
                  TextButton.icon(
                    onPressed: () => _counterBloc.add(CounterEvent.increment),
                    icon: const Icon(Icons.add),
                    label: const Text("Inc"),
                  ),
                  TextButton.icon(
                    onPressed: () => _counterBloc.add(CounterEvent.decrement),
                    icon: const Icon(Icons.remove),
                    label: const Text("Dec"),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
