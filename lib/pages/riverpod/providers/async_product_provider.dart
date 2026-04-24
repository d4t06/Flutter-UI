import 'package:my_app/pages/riverpod/models/product_item.dart';
import 'package:my_app/pages/riverpod/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_product_provider.g.dart';

@riverpod
class AsyncProduct extends _$AsyncProduct {
  @override
  Future<List<ProductItem>> build() async {
    final dio = ref.read(dioProvider);

    final res = await dio.get("/products");

    final payload =
        (res.data as List).map((item) => ProductItem.fromJson(item)).toList();

    return payload;
  }
}
