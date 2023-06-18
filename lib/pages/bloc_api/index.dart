import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bloc_api/bloc/api.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocApi extends StatefulWidget {
  const BlocApi({super.key});

  @override
  State<BlocApi> createState() => _BlocApiState();
}

class _BlocApiState extends State<BlocApi> {
  final _bloc = ApiBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    _bloc.add(ApiBlocEvent.getdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
      ),
      body: BlocProvider(
        create: (_) => _bloc,
        child: BlocListener<ApiBloc, ProductState>(
          listener: (context, state) {},
          child: BlocBuilder<ApiBloc, ProductState>(
            builder: (context, state) {
              if (state is LoadedState) {
                return ListView.builder(
                  itemCount: state.post.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(5),
                          child: Text(
                            "${state.post[index].title}",
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.all(5),
                          child: Text(
                            "${state.post[index].category}",
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state is LoadingState) {
                return const Center(
                  child: Text("Please Wait For Loading Data"),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
