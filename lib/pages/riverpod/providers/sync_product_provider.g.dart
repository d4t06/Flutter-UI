// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(syncProduct)
final syncProductProvider = SyncProductProvider._();

final class SyncProductProvider
    extends
        $FunctionalProvider<
          List<ProductItem>,
          List<ProductItem>,
          List<ProductItem>
        >
    with $Provider<List<ProductItem>> {
  SyncProductProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncProductProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncProductHash();

  @$internal
  @override
  $ProviderElement<List<ProductItem>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProductItem> create(Ref ref) {
    return syncProduct(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProductItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProductItem>>(value),
    );
  }
}

String _$syncProductHash() => r'6fdbdb717231fc3bab89f8ce7f0e31b22fd7f311';
