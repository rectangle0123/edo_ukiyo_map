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
String _$painterByIdHash() => r'efe92578700b7e877cae3db35954bbace53e9263';

/// 絵師を取得する
///
/// Copied from [painterById].
@ProviderFor(painterById)
const painterByIdProvider = PainterByIdFamily();

/// 絵師を取得する
///
/// Copied from [painterById].
class PainterByIdFamily extends Family {
  /// 絵師を取得する
  ///
  /// Copied from [painterById].
  const PainterByIdFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'painterByIdProvider';

  /// 絵師を取得する
  ///
  /// Copied from [painterById].
  PainterByIdProvider call(
    int id,
  ) {
    return PainterByIdProvider(
      id,
    );
  }

  @visibleForOverriding
  @override
  PainterByIdProvider getProviderOverride(
    covariant PainterByIdProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<Painter> Function(PainterByIdRef ref) create) {
    return _$PainterByIdFamilyOverride(this, create);
  }
}

class _$PainterByIdFamilyOverride implements FamilyOverride {
  _$PainterByIdFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<Painter> Function(PainterByIdRef ref) create;

  @override
  final PainterByIdFamily overriddenFamily;

  @override
  PainterByIdProvider getProviderOverride(
    covariant PainterByIdProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// 絵師を取得する
///
/// Copied from [painterById].
class PainterByIdProvider extends AutoDisposeFutureProvider<Painter> {
  /// 絵師を取得する
  ///
  /// Copied from [painterById].
  PainterByIdProvider(
    int id,
  ) : this._internal(
          (ref) => painterById(
            ref as PainterByIdRef,
            id,
          ),
          from: painterByIdProvider,
          name: r'painterByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$painterByIdHash,
          dependencies: PainterByIdFamily._dependencies,
          allTransitiveDependencies:
              PainterByIdFamily._allTransitiveDependencies,
          id: id,
        );

  PainterByIdProvider._internal(
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
    FutureOr<Painter> Function(PainterByIdRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PainterByIdProvider._internal(
        (ref) => create(ref as PainterByIdRef),
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
  AutoDisposeFutureProviderElement<Painter> createElement() {
    return _PainterByIdProviderElement(this);
  }

  PainterByIdProvider _copyWith(
    FutureOr<Painter> Function(PainterByIdRef ref) create,
  ) {
    return PainterByIdProvider._internal(
      (ref) => create(ref as PainterByIdRef),
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
    return other is PainterByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PainterByIdRef on AutoDisposeFutureProviderRef<Painter> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PainterByIdProviderElement
    extends AutoDisposeFutureProviderElement<Painter> with PainterByIdRef {
  _PainterByIdProviderElement(super.provider);

  @override
  int get id => (origin as PainterByIdProvider).id;
}

String _$allPaintersHash() => r'd32b73458299b9219f59fcbd6d1598182b5addb8';

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

String _$worksBySelectedSeriesIdHash() =>
    r'ec845a4fb71fb6bc4d12e7c4a3231e1d3e729991';

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
String _$worksBySelectedSeriesIdAndWorkSeqHash() =>
    r'70b13e9f39072d7b7d899b42f55e652466f915ab';

/// 選択されているシリーズIDと作品シーケンス番号から作品を取得する
///
/// Copied from [worksBySelectedSeriesIdAndWorkSeq].
@ProviderFor(worksBySelectedSeriesIdAndWorkSeq)
final worksBySelectedSeriesIdAndWorkSeqProvider =
    AutoDisposeFutureProvider<Work>.internal(
  worksBySelectedSeriesIdAndWorkSeq,
  name: r'worksBySelectedSeriesIdAndWorkSeqProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$worksBySelectedSeriesIdAndWorkSeqHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WorksBySelectedSeriesIdAndWorkSeqRef
    = AutoDisposeFutureProviderRef<Work>;
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

String _$allWorksHash() => r'074dd3f6f4902a163e3edf21ba7b8b71e34a4f50';

/// 全ての作品を取得する
///
/// Copied from [allWorks].
@ProviderFor(allWorks)
final allWorksProvider = AutoDisposeFutureProvider<List<Work>>.internal(
  allWorks,
  name: r'allWorksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allWorksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllWorksRef = AutoDisposeFutureProviderRef<List<Work>>;
String _$packageInfoHash() => r'6d24887a45825322730812d638eae4192104901b';

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
