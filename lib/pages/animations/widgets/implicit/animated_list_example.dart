import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/pages/riverpod/models/product_item.dart';
import 'package:my_app/pages/riverpod/providers/sync_product_provider.dart';
import 'package:my_app/pages/riverpod/widgets/product_card_item.dart';

class AnimatedListExample extends ConsumerStatefulWidget {
  const AnimatedListExample({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AnimatedListExampleState();
  }
}

class _AnimatedListExampleState extends ConsumerState<AnimatedListExample> {
  var isShow = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: [
        Expanded(child: Visibility(visible: isShow, child: Content())),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isShow = !isShow;
            });
          },
          child: Text("Toggle"),
        ),
      ],
    );
  }
}

class Content extends ConsumerStatefulWidget {
  const Content({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ContentState();
  }
}

class _ContentState extends ConsumerState<Content> {
  final items = <ProductItem>[];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final products = ref.read(syncProductProvider);
      _initItem(products);
    });
  }

  void _initItem(List<ProductItem> products) async {
    for (var i = 0; i < products.length; i++) {
      final item = products[i];

      await Future.delayed(Duration(milliseconds: 100));

      if (!mounted) return;

      items.add(item);
      _listKey.currentState!.insertItem(
        i,
        duration: Duration(milliseconds: 100),
      );
    }
  }

  final _offset = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    // return Text("asdfasdf");
    return AnimatedList(
      key: _listKey,
      initialItemCount: items.length,
      itemBuilder: (context, index, animation) {
        final item = items[index];

        return SlideTransition(
          position: animation.drive(_offset),
          child: ProductCardItem(item: item),
        );
      },
    );
  }
}
