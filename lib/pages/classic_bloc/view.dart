import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/classic_bloc/bloc.dart';
import 'package:flutter_application_1/pages/classic_bloc/event.dart';
import 'package:flutter_application_1/pages/classic_bloc/state.dart';

class ClassicBloc extends StatefulWidget {
  const ClassicBloc({super.key});

  @override
  State<ClassicBloc> createState() => _ClassicBlocState();
}

class _ClassicBlocState extends State<ClassicBloc> {
  final _bloc = MyBloc();

  @override
  void initState() {
    _bloc.sink.add(MyEvent.inc);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("classic bloc counter"),
      ),
      body: StreamBuilder(
        stream: _bloc.stream,
        initialData: MyState(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("please wait for a moment"));
          } else {
            return Container(
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    Text("${snapshot.data?.number ?? 'undefined count'}"),
                    TextButton(onPressed: ()=>_bloc.sink.add(MyEvent.inc), child: const Text("INC")),
                    TextButton(onPressed: ()=>_bloc.sink.add(MyEvent.dec), child: const Text("DEC")),
                    TextButton(onPressed: ()=>_bloc.sink.add(MyEvent.reset), child: const Text("RESET")),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
