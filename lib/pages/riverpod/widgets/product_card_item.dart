import 'package:flutter/material.dart';
import 'package:my_app/pages/riverpod/async_riverpod_detail_page.dart';
import 'package:my_app/pages/riverpod/models/product_item.dart';
import 'package:my_app/theme/app_text_styles.dart';

class ProductCardItem extends StatelessWidget {
  final ProductItem item;

  const ProductCardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => AsyncRiverpodDetailPage(
                    id: item.id.toString(),
                    image: item.image,
                  ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: "img-${item.image}",
                  child: Image.network(
                    item.image,
                    width: 60,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(item.title, style: context.textXl.bold),
                    Text(
                      item.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${item.price} \$",
                      style: context.textXl.bold.copyWith(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
