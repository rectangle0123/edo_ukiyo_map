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
String _$sourceByIdHash() => r'20ad6aba6f5455f84105076b60618b8b7a4456da';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// 出典を取得する
///
/// Copied from [sourceById].
@ProviderFor(sourceById)
const sourceByIdProvider = SourceByIdFamily();

/// 出典を取得する
///
/// Copied from [sourceById].
class SourceByIdFamily extends Family {
  /// 出典を取得する
  ///
  /// Copied from [sourceById].
  const SourceByIdFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sourceByIdProvider';

  /// 出典を取得する
  ///
  /// Copied from [sourceById].
  SourceByIdProvider call(
    int id,
  ) {
    return SourceByIdProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  SourceByIdProvider getProviderOverride(
    covariant SourceByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<Source> Function(SourceByIdRef ref) create) {
    return _$SourceByIdFamilyOverride(this, create);
  }
}

class _$SourceByIdFamilyOverride implements FamilyOverride {
  _$SourceByIdFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Source> Function(SourceByIdRef ref) create;

  @override
  final SourceByIdFamily overriddenFamily;

  @override
  SourceByIdProvider getProviderOverride(
    covariant SourceByIdProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// 出典を取得する
///
/// Copied from [sourceById].
class SourceByIdProvider extends AutoDisposeFutureProvider<Source> {
  /// 出典を取得する
  ///
  /// Copied from [sourceById].
  SourceByIdProvider(
    int id,
  ) : this._internal(
          (ref) => sourceById(
            ref as SourceByIdRef,
            id,
          ),
          from: sourceByIdProvider,
          name: r'sourceByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sourceByIdHash,
          dependencies: SourceByIdFamily._dependencies,
          allTransitiveDependencies:
              SourceByIdFamily._allTransitiveDependencies,
          id: id,
        );

  SourceByIdProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Source> Function(SourceByIdRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SourceByIdProvider._internal(
        (ref) => create(ref as SourceByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  (int,) get argument {
    return (id,);
  }

  @override
  AutoDisposeFutureProviderElement<Source> createElement() {
    return _SourceByIdProviderElement(this);
  }

  SourceByIdProvider _copyWith(
    FutureOr<Source> Function(SourceByIdRef ref) create,
  ) {
    return SourceByIdProvider._internal(
      (ref) => create(ref as SourceByIdRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      id: id,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SourceByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SourceByIdRef on AutoDisposeFutureProviderRef<Source> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SourceByIdProviderElement
    extends AutoDisposeFutureProviderElement<Source> with SourceByIdRef {
  _SourceByIdProviderElement(super.provider);

  @override
  int get id => (origin as SourceByIdProvider).id;
}

String _$seriesByIdHash() => r'3240678cefb5696b6b94e33626466c21ae71898e';

/// シリーズを取得する
///
/// Copied from [seriesById].
@ProviderFor(seriesById)
const seriesByIdProvider = SeriesByIdFamily();

/// シリーズを取得する
///
/// Copied from [seriesById].
class SeriesByIdFamily extends Family {
  /// シリーズを取得する
  ///
  /// Copied from [seriesById].
  const SeriesByIdFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'seriesByIdProvider';

  /// シリーズを取得する
  ///
  /// Copied from [seriesById].
  SeriesByIdProvider call(
    int id,
  ) {
    return SeriesByIdProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  SeriesByIdProvider getProviderOverride(
    covariant SeriesByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<Series> Function(SeriesByIdRef ref) create) {
    return _$SeriesByIdFamilyOverride(this, create);
  }
}

class _$SeriesByIdFamilyOverride implements FamilyOverride {
  _$SeriesByIdFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Series> Function(SeriesByIdRef ref) create;

  @override
  final SeriesByIdFamily overriddenFamily;

  @override
  SeriesByIdProvider getProviderOverride(
    covariant SeriesByIdProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// シリーズを取得する
///
/// Copied from [seriesById].
class SeriesByIdProvider extends AutoDisposeFutureProvider<Series> {
  /// シリーズを取得する
  ///
  /// Copied from [seriesById].
  SeriesByIdProvider(
    int id,
  ) : this._internal(
          (ref) => seriesById(
            ref as SeriesByIdRef,
            id,
          ),
          from: seriesByIdProvider,
          name: r'seriesByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seriesByIdHash,
          dependencies: SeriesByIdFamily._dependencies,
          allTransitiveDependencies:
              SeriesByIdFamily._allTransitiveDependencies,
          id: id,
        );

  SeriesByIdProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Series> Function(SeriesByIdRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SeriesByIdProvider._internal(
        (ref) => create(ref as SeriesByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  (int,) get argument {
    return (id,);
  }

  @override
  AutoDisposeFutureProviderElement<Series> createElement() {
    return _SeriesByIdProviderElement(this);
  }

  SeriesByIdProvider _copyWith(
    FutureOr<Series> Function(SeriesByIdRef ref) create,
  ) {
    return SeriesByIdProvider._internal(
      (ref) => create(ref as SeriesByIdRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      id: id,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SeriesByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SeriesByIdRef on AutoDisposeFutureProviderRef<Series> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SeriesByIdProviderElement
    extends AutoDisposeFutureProviderElement<Series> with SeriesByIdRef {
  _SeriesByIdProviderElement(super.provider);

  @override
  int get id => (origin as SeriesByIdProvider).id;
}

String _$allSeriesHash() => r'363feab3f07f849290f2a8dd3774dc5a4f390856';

/// すべてのシリーズを取得する
///
/// Copied from [allSeries].
@ProviderFor(allSeries)
final allSeriesProvider = AutoDisposeFutureProvider<List<Series>>.internal(
  allSeries,
  name: r'allSeriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allSeriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllSeriesRef = AutoDisposeFutureProviderRef<List<Series>>;
String _$allSeriesWithWorksHash() =>
    r'8acf073c589e6a61e4153668be68ae23fd5471e8';

/// すべてのシリーズとそれに含まれる作品を取得する
///
/// Copied from [allSeriesWithWorks].
@ProviderFor(allSeriesWithWorks)
final allSeriesWithWorksProvider =
    AutoDisposeFutureProvider<List<(Series, List<Work>)>>.internal(
  allSeriesWithWorks,
  name: r'allSeriesWithWorksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allSeriesWithWorksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllSeriesWithWorksRef
    = AutoDisposeFutureProviderRef<List<(Series, List<Work>)>>;
String _$allPaintersHash() => r'd32b73458299b9219f59fcbd6d1598182b5addb8';

/// 絵師を取得する
/// すべての絵師を取得する
///
/// Copied from [allPainters].
@ProviderFor(allPainters)
final allPaintersProvider = AutoDisposeFutureProvider<List<Painter>>.internal(
  allPainters,
  name: r'allPaintersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allPaintersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllPaintersRef = AutoDisposeFutureProviderRef<List<Painter>>;
String _$worksBySeriesHash() => r'50088bd1cc6a3f7ae471662d29059b5f58227353';

/// シリーズから作品を取得する
///
/// Copied from [worksBySeries].
@ProviderFor(worksBySeries)
const worksBySeriesProvider = WorksBySeriesFamily();

/// シリーズから作品を取得する
///
/// Copied from [worksBySeries].
class WorksBySeriesFamily extends Family {
  /// シリーズから作品を取得する
  ///
  /// Copied from [worksBySeries].
  const WorksBySeriesFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'worksBySeriesProvider';

  /// シリーズから作品を取得する
  ///
  /// Copied from [worksBySeries].
  WorksBySeriesProvider call(
    Series series,
  ) {
    return WorksBySeriesProvider(
      series,
    );
  }

  @visibleForOverriding
  @override
  WorksBySeriesProvider getProviderOverride(
    covariant WorksBySeriesProvider provider,
  ) {
    return call(
      provider.series,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<Work>> Function(WorksBySeriesRef ref) create) {
    return _$WorksBySeriesFamilyOverride(this, create);
  }
}

class _$WorksBySeriesFamilyOverride implements FamilyOverride {
  _$WorksBySeriesFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<Work>> Function(WorksBySeriesRef ref) create;

  @override
  final WorksBySeriesFamily overriddenFamily;

  @override
  WorksBySeriesProvider getProviderOverride(
    covariant WorksBySeriesProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// シリーズから作品を取得する
///
/// Copied from [worksBySeries].
class WorksBySeriesProvider extends AutoDisposeFutureProvider<List<Work>> {
  /// シリーズから作品を取得する
  ///
  /// Copied from [worksBySeries].
  WorksBySeriesProvider(
    Series series,
  ) : this._internal(
          (ref) => worksBySeries(
            ref as WorksBySeriesRef,
            series,
          ),
          from: worksBySeriesProvider,
          name: r'worksBySeriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$worksBySeriesHash,
          dependencies: WorksBySeriesFamily._dependencies,
          allTransitiveDependencies:
              WorksBySeriesFamily._allTransitiveDependencies,
          series: series,
        );

  WorksBySeriesProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.series,
  }) : super.internal();

  final Series series;

  @override
  Override overrideWith(
    FutureOr<List<Work>> Function(WorksBySeriesRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorksBySeriesProvider._internal(
        (ref) => create(ref as WorksBySeriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        series: series,
      ),
    );
  }

  @override
  (Series,) get argument {
    return (series,);
  }

  @override
  AutoDisposeFutureProviderElement<List<Work>> createElement() {
    return _WorksBySeriesProviderElement(this);
  }

  WorksBySeriesProvider _copyWith(
    FutureOr<List<Work>> Function(WorksBySeriesRef ref) create,
  ) {
    return WorksBySeriesProvider._internal(
      (ref) => create(ref as WorksBySeriesRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      series: series,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WorksBySeriesProvider && other.series == series;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, series.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorksBySeriesRef on AutoDisposeFutureProviderRef<List<Work>> {
  /// The parameter `series` of this provider.
  Series get series;
}

class _WorksBySeriesProviderElement
    extends AutoDisposeFutureProviderElement<List<Work>> with WorksBySeriesRef {
  _WorksBySeriesProviderElement(super.provider);

  @override
  Series get series => (origin as WorksBySeriesProvider).series;
}

String _$currentAllWorksHash() => r'c0a8c52d620cafcd7da218e0444c9b4d4199ba3c';

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
String _$currentAllWorksWithPaintersHash() =>
    r'e8ff9fd0a7533a9f497126f58927a05fcad55fe6';

/// 選択されているシリーズに含まれるすべての作品とそれを描いた絵師を取得する
///
/// Copied from [currentAllWorksWithPainters].
@ProviderFor(currentAllWorksWithPainters)
final currentAllWorksWithPaintersProvider =
    AutoDisposeFutureProvider<List<(Work, List<Painter>)>>.internal(
  currentAllWorksWithPainters,
  name: r'currentAllWorksWithPaintersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAllWorksWithPaintersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentAllWorksWithPaintersRef
    = AutoDisposeFutureProviderRef<List<(Work, List<Painter>)>>;
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
String _$paintersByWorkHash() => r'16df42fcfc9b54e12f244cfd1205fe8dbc207ea0';

/// 作品から絵師を取得する
///
/// Copied from [paintersByWork].
@ProviderFor(paintersByWork)
const paintersByWorkProvider = PaintersByWorkFamily();

/// 作品から絵師を取得する
///
/// Copied from [paintersByWork].
class PaintersByWorkFamily extends Family {
  /// 作品から絵師を取得する
  ///
  /// Copied from [paintersByWork].
  const PaintersByWorkFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paintersByWorkProvider';

  /// 作品から絵師を取得する
  ///
  /// Copied from [paintersByWork].
  PaintersByWorkProvider call(
    Work work,
  ) {
    return PaintersByWorkProvider(
      work,
    );
  }

  @visibleForOverriding
  @override
  PaintersByWorkProvider getProviderOverride(
    covariant PaintersByWorkProvider provider,
  ) {
    return call(
      provider.work,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<Painter>> Function(PaintersByWorkRef ref) create) {
    return _$PaintersByWorkFamilyOverride(this, create);
  }
}

class _$PaintersByWorkFamilyOverride implements FamilyOverride {
  _$PaintersByWorkFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<Painter>> Function(PaintersByWorkRef ref) create;

  @override
  final PaintersByWorkFamily overriddenFamily;

  @override
  PaintersByWorkProvider getProviderOverride(
    covariant PaintersByWorkProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// 作品から絵師を取得する
///
/// Copied from [paintersByWork].
class PaintersByWorkProvider extends AutoDisposeFutureProvider<List<Painter>> {
  /// 作品から絵師を取得する
  ///
  /// Copied from [paintersByWork].
  PaintersByWorkProvider(
    Work work,
  ) : this._internal(
          (ref) => paintersByWork(
            ref as PaintersByWorkRef,
            work,
          ),
          from: paintersByWorkProvider,
          name: r'paintersByWorkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paintersByWorkHash,
          dependencies: PaintersByWorkFamily._dependencies,
          allTransitiveDependencies:
              PaintersByWorkFamily._allTransitiveDependencies,
          work: work,
        );

  PaintersByWorkProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.work,
  }) : super.internal();

  final Work work;

  @override
  Override overrideWith(
    FutureOr<List<Painter>> Function(PaintersByWorkRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaintersByWorkProvider._internal(
        (ref) => create(ref as PaintersByWorkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        work: work,
      ),
    );
  }

  @override
  (Work,) get argument {
    return (work,);
  }

  @override
  AutoDisposeFutureProviderElement<List<Painter>> createElement() {
    return _PaintersByWorkProviderElement(this);
  }

  PaintersByWorkProvider _copyWith(
    FutureOr<List<Painter>> Function(PaintersByWorkRef ref) create,
  ) {
    return PaintersByWorkProvider._internal(
      (ref) => create(ref as PaintersByWorkRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      work: work,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PaintersByWorkProvider && other.work == work;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, work.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PaintersByWorkRef on AutoDisposeFutureProviderRef<List<Painter>> {
  /// The parameter `work` of this provider.
  Work get work;
}

class _PaintersByWorkProviderElement
    extends AutoDisposeFutureProviderElement<List<Painter>>
    with PaintersByWorkRef {
  _PaintersByWorkProviderElement(super.provider);

  @override
  Work get work => (origin as PaintersByWorkProvider).work;
}

String _$worksByPainterHash() => r'7934dde731be3ec6737d474b59e7e1b8c2d89e8e';

/// 絵師から作品を取得する
///
/// Copied from [worksByPainter].
@ProviderFor(worksByPainter)
const worksByPainterProvider = WorksByPainterFamily();

/// 絵師から作品を取得する
///
/// Copied from [worksByPainter].
class WorksByPainterFamily extends Family {
  /// 絵師から作品を取得する
  ///
  /// Copied from [worksByPainter].
  const WorksByPainterFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'worksByPainterProvider';

  /// 絵師から作品を取得する
  ///
  /// Copied from [worksByPainter].
  WorksByPainterProvider call(
    Painter painter,
  ) {
    return WorksByPainterProvider(
      painter,
    );
  }

  @visibleForOverriding
  @override
  WorksByPainterProvider getProviderOverride(
    covariant WorksByPainterProvider provider,
  ) {
    return call(
      provider.painter,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<List<Work>> Function(WorksByPainterRef ref) create) {
    return _$WorksByPainterFamilyOverride(this, create);
  }
}

class _$WorksByPainterFamilyOverride implements FamilyOverride {
  _$WorksByPainterFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<List<Work>> Function(WorksByPainterRef ref) create;

  @override
  final WorksByPainterFamily overriddenFamily;

  @override
  WorksByPainterProvider getProviderOverride(
    covariant WorksByPainterProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// 絵師から作品を取得する
///
/// Copied from [worksByPainter].
class WorksByPainterProvider extends AutoDisposeFutureProvider<List<Work>> {
  /// 絵師から作品を取得する
  ///
  /// Copied from [worksByPainter].
  WorksByPainterProvider(
    Painter painter,
  ) : this._internal(
          (ref) => worksByPainter(
            ref as WorksByPainterRef,
            painter,
          ),
          from: worksByPainterProvider,
          name: r'worksByPainterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$worksByPainterHash,
          dependencies: WorksByPainterFamily._dependencies,
          allTransitiveDependencies:
              WorksByPainterFamily._allTransitiveDependencies,
          painter: painter,
        );

  WorksByPainterProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.painter,
  }) : super.internal();

  final Painter painter;

  @override
  Override overrideWith(
    FutureOr<List<Work>> Function(WorksByPainterRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WorksByPainterProvider._internal(
        (ref) => create(ref as WorksByPainterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        painter: painter,
      ),
    );
  }

  @override
  (Painter,) get argument {
    return (painter,);
  }

  @override
  AutoDisposeFutureProviderElement<List<Work>> createElement() {
    return _WorksByPainterProviderElement(this);
  }

  WorksByPainterProvider _copyWith(
    FutureOr<List<Work>> Function(WorksByPainterRef ref) create,
  ) {
    return WorksByPainterProvider._internal(
      (ref) => create(ref as WorksByPainterRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      painter: painter,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WorksByPainterProvider && other.painter == painter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, painter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WorksByPainterRef on AutoDisposeFutureProviderRef<List<Work>> {
  /// The parameter `painter` of this provider.
  Painter get painter;
}

class _WorksByPainterProviderElement
    extends AutoDisposeFutureProviderElement<List<Work>>
    with WorksByPainterRef {
  _WorksByPainterProviderElement(super.provider);

  @override
  Painter get painter => (origin as WorksByPainterProvider).painter;
}

String _$packageInfoHash() => r'6d24887a45825322730812d638eae4192104901b';

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
