import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';
import 'state/riverpod.notifier.dart';

class ItemWidget extends ConsumerWidget {
  final RiverpodModel model;

  const ItemWidget(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.read(riverpodProvider.notifier);
    return ListTile(
      title: Text(model.name),
      subtitle: Text(model.id.toString()),
      leading: model.fav
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_outline),
      onTap: () {
        event.faveItemById(model.id);
      },
    );
  }
}
