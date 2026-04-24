// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AsyncProduct)
final asyncProductProvider = AsyncProductProvider._();

final class AsyncProductProvider
    extends $AsyncNotifierProvider<AsyncProduct, List<ProductItem>> {
  AsyncProductProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'asyncProductProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$asyncProductHash();

  @$internal
  @override
  AsyncProduct create() => AsyncProduct();
}

String _$asyncProductHash() => r'684ffe9fc2182bc74e59abd91d5b29fb60af7822';

abstract class _$AsyncProduct extends $AsyncNotifier<List<ProductItem>> {
  FutureOr<List<ProductItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProductItem>>, List<ProductItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProductItem>>, List<ProductItem>>,
              AsyncValue<List<ProductItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
