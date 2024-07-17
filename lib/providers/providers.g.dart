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
String _$currentAllWorksHash() => r'c0a8c52d620cafcd7da218e0444c9b4d4199ba3c';

/// 出典を取得する
/// シリーズを取得する
/// すべてのシリーズを取得する
/// 絵師を取得する
/// すべての絵師を取得する
/// シリーズから作品を取得する
/// 選択されているシリーズに含まれるすべての作品を取得する
///
/// Copied from [currentAllWorks].
@ProviderFor(currentAllWorks)
final currentAllWorksProvider = AutoDisposeFutureProvider<List<Work>>.internal(
  currentAllWorks,
  name: r'currentAllWorksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAllWorksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentAllWorksRef = AutoDisposeFutureProviderRef<List<Work>>;
String _$currentSingleWorkHash() => r'beff4e62d9d2ea25edcb1beb0dd27def045f4efa';

/// 選択されているシリーズと作品インデックスからひとつの作品を取得する
///
/// Copied from [currentSingleWork].
@ProviderFor(currentSingleWork)
final currentSingleWorkProvider = AutoDisposeFutureProvider<Work>.internal(
  currentSingleWork,
  name: r'currentSingleWorkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSingleWorkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentSingleWorkRef = AutoDisposeFutureProviderRef<Work>;
String _$currentWorksAndWorkHash() =>
    r'09456d574f924c6713230cec244a72c2f6cc4995';

/// 選択されているシリーズに含まれるすべての作品と、選択されている作品インデックスからひとつの作品を取得する
///
/// Copied from [currentWorksAndWork].
@ProviderFor(currentWorksAndWork)
final currentWorksAndWorkProvider =
    AutoDisposeFutureProvider<(List<Work>, Work)>.internal(
  currentWorksAndWork,
  name: r'currentWorksAndWorkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentWorksAndWorkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentWorksAndWorkRef
    = AutoDisposeFutureProviderRef<(List<Work>, Work)>;
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
