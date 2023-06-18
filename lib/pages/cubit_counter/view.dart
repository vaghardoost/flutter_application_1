import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cubit_counter/cubit/product.cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit()..inc(),
        ),
      ],
      child: BlocBuilder<ProductCubit, int>(
        builder: (BuildContext context, state) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Text(
                  state.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
                TextButton(
                  onPressed: () => context.read<ProductCubit>().inc(),
                  child: const Text("+1"),
                ),
                TextButton(
                  onPressed: () => context.read<ProductCubit>().dec(),
                  child: const Text("-1"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
