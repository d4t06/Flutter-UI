import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/components/app_async_value_view.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/pages/riverpod/providers/async_product_detail_provider.dart';
import 'package:my_app/theme/app_text_styles.dart';

class AsyncRiverpodDetailPage extends ConsumerWidget {
  final String id;
  final String image;

  const AsyncRiverpodDetailPage({
    super.key,
    required this.id,
    required this.image,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(asyncProductDetailProvider(id));

    return Scaffold(
      appBar: AppTopBar(title: "Product Detail"),

      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Center(
              child: Hero(
                tag: 'img-${image}',
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
          ),

          SizedBox(height: 20),

          AppAsyncValueView(
            value: state,
            data: (product) {
              return Text(product.title, style: context.textXl.bold);
            },
          ),
        ],
      ),
    );
  }
}
