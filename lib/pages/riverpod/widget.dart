import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/riverpod/item.dart';
import 'package:flutter_application_1/pages/riverpod/state/riverpod.notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodWidget extends ConsumerWidget {
  const RiverpodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(riverpodProvider).state;
    final event = ref.read(riverpodProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text((state is LoadedState) ? state.list[0].id.toString() : ""),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          if (state is InitialState) {
            return Center(
              child: MaterialButton(
                onPressed: () => event.getData(),
                child: const Text("Load Data"),
              ),
            );
          }
          if (state is LoadingState) {
            return const Center(
              child: Text("loading"),
            );
          }
          if (state is LoadedState) {
            return ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) => ItemWidget(state.list[index]),
            );
          }
          if (state is ErrorState) {
            return const Center(child: Text("error"));
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) => Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("Hello", style: TextStyle(fontSize: 22)),
                  Text("we are here to coding"),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.question_mark_rounded),
      ),
    );
  }
}
