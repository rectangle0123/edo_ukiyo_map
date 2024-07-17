// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carouselControllerHash() =>
    r'ebded5237381d1b7308643a510aa654a96cb55c6';

/// カルーセルコントローラーを取得する
///
/// Copied from [carouselController].
@ProviderFor(carouselController)
final carouselControllerProvider =
    AutoDisposeProvider<CarouselController>.internal(
  carouselController,
  name: r'carouselControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carouselControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CarouselControllerRef = AutoDisposeProviderRef<CarouselController>;
String _$worksBySelectedSeriesIdHash() =>
    r'ec845a4fb71fb6bc4d12e7c4a3231e1d3e729991';

/// 出典を取得する
/// シリーズを取得する
/// すべてのシリーズを取得する
/// 絵師を取得する
/// すべての絵師を取得する
/// シリーズから作品を取得する
/// 選択されているシリーズIDから作品を取得する
///
/// Copied from [worksBySelectedSeriesId].
@ProviderFor(worksBySelectedSeriesId)
final worksBySelectedSeriesIdProvider =
    AutoDisposeFutureProvider<List<Work>>.internal(
  worksBySelectedSeriesId,
  name: r'worksBySelectedSeriesIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$worksBySelectedSeriesIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorksBySelectedSeriesIdRef = AutoDisposeFutureProviderRef<List<Work>>;
String _$worksBySelectedSeriesIdAndWorkIndexHash() =>
    r'9124a7a4b888fe65cf19601ad770c09804c6b240';

/// 選択されているシリーズIDと作品インデックスから作品を取得する
///
/// Copied from [worksBySelectedSeriesIdAndWorkIndex].
@ProviderFor(worksBySelectedSeriesIdAndWorkIndex)
final worksBySelectedSeriesIdAndWorkIndexProvider =
    AutoDisposeFutureProvider<Work>.internal(
  worksBySelectedSeriesIdAndWorkIndex,
  name: r'worksBySelectedSeriesIdAndWorkIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$worksBySelectedSeriesIdAndWorkIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorksBySelectedSeriesIdAndWorkIndexRef
    = AutoDisposeFutureProviderRef<Work>;
String _$packageInfoHash() => r'6d24887a45825322730812d638eae4192104901b';

/// 作品から絵師を取得する
/// 絵師から作品を取得する
/// 全ての作品を取得する
/// パッケージ情報を取得する
///
/// Copied from [packageInfo].
@ProviderFor(packageInfo)
final packageInfoProvider = AutoDisposeFutureProvider<PackageInfo>.internal(
  packageInfo,
  name: r'packageInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$packageInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PackageInfoRef = AutoDisposeFutureProviderRef<PackageInfo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
