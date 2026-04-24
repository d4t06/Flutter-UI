// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'async_product_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(asyncProductDetail)
final asyncProductDetailProvider = AsyncProductDetailFamily._();

final class AsyncProductDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<ProductItem>,
          ProductItem,
          FutureOr<ProductItem>
        >
    with $FutureModifier<ProductItem>, $FutureProvider<ProductItem> {
  AsyncProductDetailProvider._({
    required AsyncProductDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'asyncProductDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$asyncProductDetailHash();

  @override
  String toString() {
    return r'asyncProductDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ProductItem> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ProductItem> create(Ref ref) {
    final argument = this.argument as String;
    return asyncProductDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AsyncProductDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$asyncProductDetailHash() =>
    r'e4abdc98e7c6a67618dcce4b2d4c1d38dc2053ef';

final class AsyncProductDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ProductItem>, String> {
  AsyncProductDetailFamily._()
    : super(
        retry: null,
        name: r'asyncProductDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AsyncProductDetailProvider call(String id) =>
      AsyncProductDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'asyncProductDetailProvider';
}
