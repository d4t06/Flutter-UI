import 'package:flutter/material.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/pages/riverpod/models/product_item.dart';

class HeroAnimation extends StatelessWidget {
  final item = ProductItem(
    id: 1,
    title: "HeroAnimation",
    price: 109.95,
    description:
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    category: "men's clothing",
    image: "http://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
    rating: Rating(rate: 5.1, count: 10),
  );

  HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HeroAnimationDetail(item: item)),
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Hero(tag: 'img-${item.image}', child: Image.network(item.image)),
      ),
      title: Text(item.title),
    );
  }
}

class HeroAnimationDetail extends StatelessWidget {
  final ProductItem item;

  const HeroAnimationDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppTopBar(title: "Hero Animation"),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Center(
              child: Hero(
                tag: 'img-${item.image}',
                child: Image.network(item.image, fit: BoxFit.cover),
              ),
            ),
          ),

          SizedBox(height: 20),

          Text(item.title),

          Text(item.description),
        ],
      ),
    );
  }
}
