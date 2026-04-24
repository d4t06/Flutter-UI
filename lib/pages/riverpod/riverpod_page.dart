import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/pages/riverpod/providers/sync_product_provider.dart';
import 'package:my_app/pages/riverpod/widgets/product_card_item.dart';

class RiverpodPage extends ConsumerWidget {
  const RiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    final products = ref.read(syncProductProvider);

    return Scaffold(
      drawer: AppSidebar(),
      appBar: AppTopBar(title: "Sync Riverpod"),
      body: Padding(
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
  }
}
