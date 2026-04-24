import 'package:my_app/pages/riverpod/providers/dio_provider.dart';
import 'package:my_app/pages/riverpod/models/product_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_product_detail_provider.g.dart';

@riverpod
// class AsyncProductDetail extends _$AsyncProductDetail {
//   @override
//   Future<ProductItem> build(String id) async {
//     final dio = ref.read(dioProvider);
//     final res = await dio.get("/products/$id");
//     return ProductItem.fromJson(res.data);
//   }
// }
Future<ProductItem> asyncProductDetail(Ref ref, String id) async {
  final dio = ref.read(dioProvider);

  final res = await dio.get("/products/$id");

  return ProductItem.fromJson(res.data);
}
