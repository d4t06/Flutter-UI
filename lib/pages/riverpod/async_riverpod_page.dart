import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/components/app_async_value_view.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/pages/riverpod/providers/async_product_provider.dart';
import 'package:my_app/pages/riverpod/widgets/product_card_item.dart';

class AsyncRiverpodPage extends ConsumerWidget {
  const AsyncRiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(asyncProductProvider);

    return Scaffold(
      appBar: AppTopBar(title: "AsyncRiverpodPage"),

      drawer: AppSidebar(),

      body: AppAsyncValueView(
        value: state,
        data: (products) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(asyncProductProvider);
              await ref.read(asyncProductProvider.future);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];

                  return ProductCardItem(item: item);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
