part of 'riverpod.notifier.dart';

final riverpodProvider = ChangeNotifierProvider.autoDispose<RiverpodNotifier>(
  (ref) {
    return RiverpodNotifier();
  },
);

