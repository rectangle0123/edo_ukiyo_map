// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SourcesTable extends Sources with TableInfo<$SourcesTable, Source> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameJaMeta = const VerificationMeta('nameJa');
  @override
  late final GeneratedColumn<String> nameJa = GeneratedColumn<String>(
      'name_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _licenseJaMeta =
      const VerificationMeta('licenseJa');
  @override
  late final GeneratedColumn<String> licenseJa = GeneratedColumn<String>(
      'license_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _licenseEnMeta =
      const VerificationMeta('licenseEn');
  @override
  late final GeneratedColumn<String> licenseEn = GeneratedColumn<String>(
      'license_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, nameJa, nameEn, licenseJa, licenseEn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sources';
  @override
  VerificationContext validateIntegrity(Insertable<Source> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name_ja')) {
      context.handle(_nameJaMeta,
          nameJa.isAcceptableOrUnknown(data['name_ja']!, _nameJaMeta));
    } else if (isInserting) {
      context.missing(_nameJaMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('license_ja')) {
      context.handle(_licenseJaMeta,
          licenseJa.isAcceptableOrUnknown(data['license_ja']!, _licenseJaMeta));
    } else if (isInserting) {
      context.missing(_licenseJaMeta);
    }
    if (data.containsKey('license_en')) {
      context.handle(_licenseEnMeta,
          licenseEn.isAcceptableOrUnknown(data['license_en']!, _licenseEnMeta));
    } else if (isInserting) {
      context.missing(_licenseEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Source map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Source(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nameJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ja'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      licenseJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}license_ja'])!,
      licenseEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}license_en'])!,
    );
  }

  @override
  $SourcesTable createAlias(String alias) {
    return $SourcesTable(attachedDatabase, alias);
  }
}

class Source extends DataClass implements Insertable<Source> {
  /// ID
  final int id;

  /// 名前（日本語）
  final String nameJa;

  /// 名前（英語）
  final String nameEn;

  /// ライセンス（日本語）
  final String licenseJa;

  /// ライセンス（英語）
  final String licenseEn;
  const Source(
      {required this.id,
      required this.nameJa,
      required this.nameEn,
      required this.licenseJa,
      required this.licenseEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name_ja'] = Variable<String>(nameJa);
    map['name_en'] = Variable<String>(nameEn);
    map['license_ja'] = Variable<String>(licenseJa);
    map['license_en'] = Variable<String>(licenseEn);
    return map;
  }

  SourcesCompanion toCompanion(bool nullToAbsent) {
    return SourcesCompanion(
      id: Value(id),
      nameJa: Value(nameJa),
      nameEn: Value(nameEn),
      licenseJa: Value(licenseJa),
      licenseEn: Value(licenseEn),
    );
  }

  factory Source.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Source(
      id: serializer.fromJson<int>(json['id']),
      nameJa: serializer.fromJson<String>(json['nameJa']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      licenseJa: serializer.fromJson<String>(json['licenseJa']),
      licenseEn: serializer.fromJson<String>(json['licenseEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nameJa': serializer.toJson<String>(nameJa),
      'nameEn': serializer.toJson<String>(nameEn),
      'licenseJa': serializer.toJson<String>(licenseJa),
      'licenseEn': serializer.toJson<String>(licenseEn),
    };
  }

  Source copyWith(
          {int? id,
          String? nameJa,
          String? nameEn,
          String? licenseJa,
          String? licenseEn}) =>
      Source(
        id: id ?? this.id,
        nameJa: nameJa ?? this.nameJa,
        nameEn: nameEn ?? this.nameEn,
        licenseJa: licenseJa ?? this.licenseJa,
        licenseEn: licenseEn ?? this.licenseEn,
      );
  Source copyWithCompanion(SourcesCompanion data) {
    return Source(
      id: data.id.present ? data.id.value : this.id,
      nameJa: data.nameJa.present ? data.nameJa.value : this.nameJa,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      licenseJa: data.licenseJa.present ? data.licenseJa.value : this.licenseJa,
      licenseEn: data.licenseEn.present ? data.licenseEn.value : this.licenseEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Source(')
          ..write('id: $id, ')
          ..write('nameJa: $nameJa, ')
          ..write('nameEn: $nameEn, ')
          ..write('licenseJa: $licenseJa, ')
          ..write('licenseEn: $licenseEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nameJa, nameEn, licenseJa, licenseEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Source &&
          other.id == this.id &&
          other.nameJa == this.nameJa &&
          other.nameEn == this.nameEn &&
          other.licenseJa == this.licenseJa &&
          other.licenseEn == this.licenseEn);
}

class SourcesCompanion extends UpdateCompanion<Source> {
  final Value<int> id;
  final Value<String> nameJa;
  final Value<String> nameEn;
  final Value<String> licenseJa;
  final Value<String> licenseEn;
  final Value<int> rowid;
  const SourcesCompanion({
    this.id = const Value.absent(),
    this.nameJa = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.licenseJa = const Value.absent(),
    this.licenseEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SourcesCompanion.insert({
    required int id,
    required String nameJa,
    required String nameEn,
    required String licenseJa,
    required String licenseEn,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        nameJa = Value(nameJa),
        nameEn = Value(nameEn),
        licenseJa = Value(licenseJa),
        licenseEn = Value(licenseEn);
  static Insertable<Source> custom({
    Expression<int>? id,
    Expression<String>? nameJa,
    Expression<String>? nameEn,
    Expression<String>? licenseJa,
    Expression<String>? licenseEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nameJa != null) 'name_ja': nameJa,
      if (nameEn != null) 'name_en': nameEn,
      if (licenseJa != null) 'license_ja': licenseJa,
      if (licenseEn != null) 'license_en': licenseEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SourcesCompanion copyWith(
      {Value<int>? id,
      Value<String>? nameJa,
      Value<String>? nameEn,
      Value<String>? licenseJa,
      Value<String>? licenseEn,
      Value<int>? rowid}) {
    return SourcesCompanion(
      id: id ?? this.id,
      nameJa: nameJa ?? this.nameJa,
      nameEn: nameEn ?? this.nameEn,
      licenseJa: licenseJa ?? this.licenseJa,
      licenseEn: licenseEn ?? this.licenseEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nameJa.present) {
      map['name_ja'] = Variable<String>(nameJa.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (licenseJa.present) {
      map['license_ja'] = Variable<String>(licenseJa.value);
    }
    if (licenseEn.present) {
      map['license_en'] = Variable<String>(licenseEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SourcesCompanion(')
          ..write('id: $id, ')
          ..write('nameJa: $nameJa, ')
          ..write('nameEn: $nameEn, ')
          ..write('licenseJa: $licenseJa, ')
          ..write('licenseEn: $licenseEn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SeriesesTable extends Serieses with TableInfo<$SeriesesTable, Series> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SeriesesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameJaMeta = const VerificationMeta('nameJa');
  @override
  late final GeneratedColumn<String> nameJa = GeneratedColumn<String>(
      'name_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortNameJaMeta =
      const VerificationMeta('shortNameJa');
  @override
  late final GeneratedColumn<String> shortNameJa = GeneratedColumn<String>(
      'short_name_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortNameEnMeta =
      const VerificationMeta('shortNameEn');
  @override
  late final GeneratedColumn<String> shortNameEn = GeneratedColumn<String>(
      'short_name_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionJaMeta =
      const VerificationMeta('descriptionJa');
  @override
  late final GeneratedColumn<String> descriptionJa = GeneratedColumn<String>(
      'description_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionEnMeta =
      const VerificationMeta('descriptionEn');
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
      'description_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sort,
        nameJa,
        nameEn,
        shortNameJa,
        shortNameEn,
        descriptionJa,
        descriptionEn
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'serieses';
  @override
  VerificationContext validateIntegrity(Insertable<Series> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    if (data.containsKey('name_ja')) {
      context.handle(_nameJaMeta,
          nameJa.isAcceptableOrUnknown(data['name_ja']!, _nameJaMeta));
    } else if (isInserting) {
      context.missing(_nameJaMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('short_name_ja')) {
      context.handle(
          _shortNameJaMeta,
          shortNameJa.isAcceptableOrUnknown(
              data['short_name_ja']!, _shortNameJaMeta));
    } else if (isInserting) {
      context.missing(_shortNameJaMeta);
    }
    if (data.containsKey('short_name_en')) {
      context.handle(
          _shortNameEnMeta,
          shortNameEn.isAcceptableOrUnknown(
              data['short_name_en']!, _shortNameEnMeta));
    } else if (isInserting) {
      context.missing(_shortNameEnMeta);
    }
    if (data.containsKey('description_ja')) {
      context.handle(
          _descriptionJaMeta,
          descriptionJa.isAcceptableOrUnknown(
              data['description_ja']!, _descriptionJaMeta));
    } else if (isInserting) {
      context.missing(_descriptionJaMeta);
    }
    if (data.containsKey('description_en')) {
      context.handle(
          _descriptionEnMeta,
          descriptionEn.isAcceptableOrUnknown(
              data['description_en']!, _descriptionEnMeta));
    } else if (isInserting) {
      context.missing(_descriptionEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Series map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Series(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
      nameJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ja'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      shortNameJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_name_ja'])!,
      shortNameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_name_en'])!,
      descriptionJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description_ja'])!,
      descriptionEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description_en'])!,
    );
  }

  @override
  $SeriesesTable createAlias(String alias) {
    return $SeriesesTable(attachedDatabase, alias);
  }
}

class Series extends DataClass implements Insertable<Series> {
  /// ID
  final int id;

  /// ソート
  final int sort;

  /// 名前（日本語）
  final String nameJa;

  /// 名前（英語）
  final String nameEn;

  /// 短縮名（日本語）
  final String shortNameJa;

  /// 短縮名（英語）
  final String shortNameEn;

  /// 解説（日本語）
  final String descriptionJa;

  /// 解説（英語）
  final String descriptionEn;
  const Series(
      {required this.id,
      required this.sort,
      required this.nameJa,
      required this.nameEn,
      required this.shortNameJa,
      required this.shortNameEn,
      required this.descriptionJa,
      required this.descriptionEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sort'] = Variable<int>(sort);
    map['name_ja'] = Variable<String>(nameJa);
    map['name_en'] = Variable<String>(nameEn);
    map['short_name_ja'] = Variable<String>(shortNameJa);
    map['short_name_en'] = Variable<String>(shortNameEn);
    map['description_ja'] = Variable<String>(descriptionJa);
    map['description_en'] = Variable<String>(descriptionEn);
    return map;
  }

  SeriesesCompanion toCompanion(bool nullToAbsent) {
    return SeriesesCompanion(
      id: Value(id),
      sort: Value(sort),
      nameJa: Value(nameJa),
      nameEn: Value(nameEn),
      shortNameJa: Value(shortNameJa),
      shortNameEn: Value(shortNameEn),
      descriptionJa: Value(descriptionJa),
      descriptionEn: Value(descriptionEn),
    );
  }

  factory Series.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Series(
      id: serializer.fromJson<int>(json['id']),
      sort: serializer.fromJson<int>(json['sort']),
      nameJa: serializer.fromJson<String>(json['nameJa']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      shortNameJa: serializer.fromJson<String>(json['shortNameJa']),
      shortNameEn: serializer.fromJson<String>(json['shortNameEn']),
      descriptionJa: serializer.fromJson<String>(json['descriptionJa']),
      descriptionEn: serializer.fromJson<String>(json['descriptionEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sort': serializer.toJson<int>(sort),
      'nameJa': serializer.toJson<String>(nameJa),
      'nameEn': serializer.toJson<String>(nameEn),
      'shortNameJa': serializer.toJson<String>(shortNameJa),
      'shortNameEn': serializer.toJson<String>(shortNameEn),
      'descriptionJa': serializer.toJson<String>(descriptionJa),
      'descriptionEn': serializer.toJson<String>(descriptionEn),
    };
  }

  Series copyWith(
          {int? id,
          int? sort,
          String? nameJa,
          String? nameEn,
          String? shortNameJa,
          String? shortNameEn,
          String? descriptionJa,
          String? descriptionEn}) =>
      Series(
        id: id ?? this.id,
        sort: sort ?? this.sort,
        nameJa: nameJa ?? this.nameJa,
        nameEn: nameEn ?? this.nameEn,
        shortNameJa: shortNameJa ?? this.shortNameJa,
        shortNameEn: shortNameEn ?? this.shortNameEn,
        descriptionJa: descriptionJa ?? this.descriptionJa,
        descriptionEn: descriptionEn ?? this.descriptionEn,
      );
  Series copyWithCompanion(SeriesesCompanion data) {
    return Series(
      id: data.id.present ? data.id.value : this.id,
      sort: data.sort.present ? data.sort.value : this.sort,
      nameJa: data.nameJa.present ? data.nameJa.value : this.nameJa,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      shortNameJa:
          data.shortNameJa.present ? data.shortNameJa.value : this.shortNameJa,
      shortNameEn:
          data.shortNameEn.present ? data.shortNameEn.value : this.shortNameEn,
      descriptionJa: data.descriptionJa.present
          ? data.descriptionJa.value
          : this.descriptionJa,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Series(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('nameJa: $nameJa, ')
          ..write('nameEn: $nameEn, ')
          ..write('shortNameJa: $shortNameJa, ')
          ..write('shortNameEn: $shortNameEn, ')
          ..write('descriptionJa: $descriptionJa, ')
          ..write('descriptionEn: $descriptionEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sort, nameJa, nameEn, shortNameJa,
      shortNameEn, descriptionJa, descriptionEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Series &&
          other.id == this.id &&
          other.sort == this.sort &&
          other.nameJa == this.nameJa &&
          other.nameEn == this.nameEn &&
          other.shortNameJa == this.shortNameJa &&
          other.shortNameEn == this.shortNameEn &&
          other.descriptionJa == this.descriptionJa &&
          other.descriptionEn == this.descriptionEn);
}

class SeriesesCompanion extends UpdateCompanion<Series> {
  final Value<int> id;
  final Value<int> sort;
  final Value<String> nameJa;
  final Value<String> nameEn;
  final Value<String> shortNameJa;
  final Value<String> shortNameEn;
  final Value<String> descriptionJa;
  final Value<String> descriptionEn;
  final Value<int> rowid;
  const SeriesesCompanion({
    this.id = const Value.absent(),
    this.sort = const Value.absent(),
    this.nameJa = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.shortNameJa = const Value.absent(),
    this.shortNameEn = const Value.absent(),
    this.descriptionJa = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SeriesesCompanion.insert({
    required int id,
    required int sort,
    required String nameJa,
    required String nameEn,
    required String shortNameJa,
    required String shortNameEn,
    required String descriptionJa,
    required String descriptionEn,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sort = Value(sort),
        nameJa = Value(nameJa),
        nameEn = Value(nameEn),
        shortNameJa = Value(shortNameJa),
        shortNameEn = Value(shortNameEn),
        descriptionJa = Value(descriptionJa),
        descriptionEn = Value(descriptionEn);
  static Insertable<Series> custom({
    Expression<int>? id,
    Expression<int>? sort,
    Expression<String>? nameJa,
    Expression<String>? nameEn,
    Expression<String>? shortNameJa,
    Expression<String>? shortNameEn,
    Expression<String>? descriptionJa,
    Expression<String>? descriptionEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sort != null) 'sort': sort,
      if (nameJa != null) 'name_ja': nameJa,
      if (nameEn != null) 'name_en': nameEn,
      if (shortNameJa != null) 'short_name_ja': shortNameJa,
      if (shortNameEn != null) 'short_name_en': shortNameEn,
      if (descriptionJa != null) 'description_ja': descriptionJa,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SeriesesCompanion copyWith(
      {Value<int>? id,
      Value<int>? sort,
      Value<String>? nameJa,
      Value<String>? nameEn,
      Value<String>? shortNameJa,
      Value<String>? shortNameEn,
      Value<String>? descriptionJa,
      Value<String>? descriptionEn,
      Value<int>? rowid}) {
    return SeriesesCompanion(
      id: id ?? this.id,
      sort: sort ?? this.sort,
      nameJa: nameJa ?? this.nameJa,
      nameEn: nameEn ?? this.nameEn,
      shortNameJa: shortNameJa ?? this.shortNameJa,
      shortNameEn: shortNameEn ?? this.shortNameEn,
      descriptionJa: descriptionJa ?? this.descriptionJa,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (nameJa.present) {
      map['name_ja'] = Variable<String>(nameJa.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (shortNameJa.present) {
      map['short_name_ja'] = Variable<String>(shortNameJa.value);
    }
    if (shortNameEn.present) {
      map['short_name_en'] = Variable<String>(shortNameEn.value);
    }
    if (descriptionJa.present) {
      map['description_ja'] = Variable<String>(descriptionJa.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SeriesesCompanion(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('nameJa: $nameJa, ')
          ..write('nameEn: $nameEn, ')
          ..write('shortNameJa: $shortNameJa, ')
          ..write('shortNameEn: $shortNameEn, ')
          ..write('descriptionJa: $descriptionJa, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaintersTable extends Painters with TableInfo<$PaintersTable, Painter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaintersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sortMeta = const VerificationMeta('sort');
  @override
  late final GeneratedColumn<int> sort = GeneratedColumn<int>(
      'sort', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameJaMeta = const VerificationMeta('nameJa');
  @override
  late final GeneratedColumn<String> nameJa = GeneratedColumn<String>(
      'name_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortNameJaMeta =
      const VerificationMeta('shortNameJa');
  @override
  late final GeneratedColumn<String> shortNameJa = GeneratedColumn<String>(
      'short_name_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _shortNameEnMeta =
      const VerificationMeta('shortNameEn');
  @override
  late final GeneratedColumn<String> shortNameEn = GeneratedColumn<String>(
      'short_name_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aliasJaMeta =
      const VerificationMeta('aliasJa');
  @override
  late final GeneratedColumn<String> aliasJa = GeneratedColumn<String>(
      'alias_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _aliasEnMeta =
      const VerificationMeta('aliasEn');
  @override
  late final GeneratedColumn<String> aliasEn = GeneratedColumn<String>(
      'alias_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bornInMeta = const VerificationMeta('bornIn');
  @override
  late final GeneratedColumn<int> bornIn = GeneratedColumn<int>(
      'born_in', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _diedInMeta = const VerificationMeta('diedIn');
  @override
  late final GeneratedColumn<int> diedIn = GeneratedColumn<int>(
      'died_in', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _descriptionJaMeta =
      const VerificationMeta('descriptionJa');
  @override
  late final GeneratedColumn<String> descriptionJa = GeneratedColumn<String>(
      'description_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionEnMeta =
      const VerificationMeta('descriptionEn');
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
      'description_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hasPortraitMeta =
      const VerificationMeta('hasPortrait');
  @override
  late final GeneratedColumn<bool> hasPortrait = GeneratedColumn<bool>(
      'has_portrait', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_portrait" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sort,
        nameJa,
        nameEn,
        shortNameJa,
        shortNameEn,
        aliasJa,
        aliasEn,
        bornIn,
        diedIn,
        descriptionJa,
        descriptionEn,
        hasPortrait
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'painters';
  @override
  VerificationContext validateIntegrity(Insertable<Painter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sort')) {
      context.handle(
          _sortMeta, sort.isAcceptableOrUnknown(data['sort']!, _sortMeta));
    } else if (isInserting) {
      context.missing(_sortMeta);
    }
    if (data.containsKey('name_ja')) {
      context.handle(_nameJaMeta,
          nameJa.isAcceptableOrUnknown(data['name_ja']!, _nameJaMeta));
    } else if (isInserting) {
      context.missing(_nameJaMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('short_name_ja')) {
      context.handle(
          _shortNameJaMeta,
          shortNameJa.isAcceptableOrUnknown(
              data['short_name_ja']!, _shortNameJaMeta));
    } else if (isInserting) {
      context.missing(_shortNameJaMeta);
    }
    if (data.containsKey('short_name_en')) {
      context.handle(
          _shortNameEnMeta,
          shortNameEn.isAcceptableOrUnknown(
              data['short_name_en']!, _shortNameEnMeta));
    } else if (isInserting) {
      context.missing(_shortNameEnMeta);
    }
    if (data.containsKey('alias_ja')) {
      context.handle(_aliasJaMeta,
          aliasJa.isAcceptableOrUnknown(data['alias_ja']!, _aliasJaMeta));
    } else if (isInserting) {
      context.missing(_aliasJaMeta);
    }
    if (data.containsKey('alias_en')) {
      context.handle(_aliasEnMeta,
          aliasEn.isAcceptableOrUnknown(data['alias_en']!, _aliasEnMeta));
    } else if (isInserting) {
      context.missing(_aliasEnMeta);
    }
    if (data.containsKey('born_in')) {
      context.handle(_bornInMeta,
          bornIn.isAcceptableOrUnknown(data['born_in']!, _bornInMeta));
    }
    if (data.containsKey('died_in')) {
      context.handle(_diedInMeta,
          diedIn.isAcceptableOrUnknown(data['died_in']!, _diedInMeta));
    }
    if (data.containsKey('description_ja')) {
      context.handle(
          _descriptionJaMeta,
          descriptionJa.isAcceptableOrUnknown(
              data['description_ja']!, _descriptionJaMeta));
    } else if (isInserting) {
      context.missing(_descriptionJaMeta);
    }
    if (data.containsKey('description_en')) {
      context.handle(
          _descriptionEnMeta,
          descriptionEn.isAcceptableOrUnknown(
              data['description_en']!, _descriptionEnMeta));
    } else if (isInserting) {
      context.missing(_descriptionEnMeta);
    }
    if (data.containsKey('has_portrait')) {
      context.handle(
          _hasPortraitMeta,
          hasPortrait.isAcceptableOrUnknown(
              data['has_portrait']!, _hasPortraitMeta));
    } else if (isInserting) {
      context.missing(_hasPortraitMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Painter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Painter(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sort: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort'])!,
      nameJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ja'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      shortNameJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_name_ja'])!,
      shortNameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}short_name_en'])!,
      aliasJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alias_ja'])!,
      aliasEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alias_en'])!,
      bornIn: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}born_in']),
      diedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}died_in']),
      descriptionJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description_ja'])!,
      descriptionEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description_en'])!,
      hasPortrait: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_portrait'])!,
    );
  }

  @override
  $PaintersTable createAlias(String alias) {
    return $PaintersTable(attachedDatabase, alias);
  }
}

class Painter extends DataClass implements Insertable<Painter> {
  /// ID
  final int id;

  /// ソート
  final int sort;

  /// 名前（日本語）
  final String nameJa;

  /// 名前（英語）
  final String nameEn;

  /// 短縮名（日本語）
  final String shortNameJa;

  /// 短縮名（英語）
  final String shortNameEn;

  /// 別名（日本語）
  final String aliasJa;

  /// 別名（英語）
  final String aliasEn;

  /// 生年
  final int? bornIn;

  /// 没年
  final int? diedIn;

  /// 解説（日本語）
  final String descriptionJa;

  /// 解説（英語）
  final String descriptionEn;

  /// 肖像の有無
  final bool hasPortrait;
  const Painter(
      {required this.id,
      required this.sort,
      required this.nameJa,
      required this.nameEn,
      required this.shortNameJa,
      required this.shortNameEn,
      required this.aliasJa,
      required this.aliasEn,
      this.bornIn,
      this.diedIn,
      required this.descriptionJa,
      required this.descriptionEn,
      required this.hasPortrait});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sort'] = Variable<int>(sort);
    map['name_ja'] = Variable<String>(nameJa);
    map['name_en'] = Variable<String>(nameEn);
    map['short_name_ja'] = Variable<String>(shortNameJa);
    map['short_name_en'] = Variable<String>(shortNameEn);
    map['alias_ja'] = Variable<String>(aliasJa);
    map['alias_en'] = Variable<String>(aliasEn);
    if (!nullToAbsent || bornIn != null) {
      map['born_in'] = Variable<int>(bornIn);
    }
    if (!nullToAbsent || diedIn != null) {
      map['died_in'] = Variable<int>(diedIn);
    }
    map['description_ja'] = Variable<String>(descriptionJa);
    map['description_en'] = Variable<String>(descriptionEn);
    map['has_portrait'] = Variable<bool>(hasPortrait);
    return map;
  }

  PaintersCompanion toCompanion(bool nullToAbsent) {
    return PaintersCompanion(
      id: Value(id),
      sort: Value(sort),
      nameJa: Value(nameJa),
      nameEn: Value(nameEn),
      shortNameJa: Value(shortNameJa),
      shortNameEn: Value(shortNameEn),
      aliasJa: Value(aliasJa),
      aliasEn: Value(aliasEn),
      bornIn:
          bornIn == null && nullToAbsent ? const Value.absent() : Value(bornIn),
      diedIn:
          diedIn == null && nullToAbsent ? const Value.absent() : Value(diedIn),
      descriptionJa: Value(descriptionJa),
      descriptionEn: Value(descriptionEn),
      hasPortrait: Value(hasPortrait),
    );
  }

  factory Painter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Painter(
      id: serializer.fromJson<int>(json['id']),
      sort: serializer.fromJson<int>(json['sort']),
      nameJa: serializer.fromJson<String>(json['nameJa']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      shortNameJa: serializer.fromJson<String>(json['shortNameJa']),
      shortNameEn: serializer.fromJson<String>(json['shortNameEn']),
      aliasJa: serializer.fromJson<String>(json['aliasJa']),
      aliasEn: serializer.fromJson<String>(json['aliasEn']),
      bornIn: serializer.fromJson<int?>(json['bornIn']),
      diedIn: serializer.fromJson<int?>(json['diedIn']),
      descriptionJa: serializer.fromJson<String>(json['descriptionJa']),
      descriptionEn: serializer.fromJson<String>(json['descriptionEn']),
      hasPortrait: serializer.fromJson<bool>(json['hasPortrait']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sort': serializer.toJson<int>(sort),
      'nameJa': serializer.toJson<String>(nameJa),
      'nameEn': serializer.toJson<String>(nameEn),
      'shortNameJa': serializer.toJson<String>(shortNameJa),
      'shortNameEn': serializer.toJson<String>(shortNameEn),
      'aliasJa': serializer.toJson<String>(aliasJa),
      'aliasEn': serializer.toJson<String>(aliasEn),
      'bornIn': serializer.toJson<int?>(bornIn),
      'diedIn': serializer.toJson<int?>(diedIn),
      'descriptionJa': serializer.toJson<String>(descriptionJa),
      'descriptionEn': serializer.toJson<String>(descriptionEn),
      'hasPortrait': serializer.toJson<bool>(hasPortrait),
    };
  }

  Painter copyWith(
          {int? id,
          int? sort,
          String? nameJa,
          String? nameEn,
          String? shortNameJa,
          String? shortNameEn,
          String? aliasJa,
          String? aliasEn,
          Value<int?> bornIn = const Value.absent(),
          Value<int?> diedIn = const Value.absent(),
          String? descriptionJa,
          String? descriptionEn,
          bool? hasPortrait}) =>
      Painter(
        id: id ?? this.id,
        sort: sort ?? this.sort,
        nameJa: nameJa ?? this.nameJa,
        nameEn: nameEn ?? this.nameEn,
        shortNameJa: shortNameJa ?? this.shortNameJa,
        shortNameEn: shortNameEn ?? this.shortNameEn,
        aliasJa: aliasJa ?? this.aliasJa,
        aliasEn: aliasEn ?? this.aliasEn,
        bornIn: bornIn.present ? bornIn.value : this.bornIn,
        diedIn: diedIn.present ? diedIn.value : this.diedIn,
        descriptionJa: descriptionJa ?? this.descriptionJa,
        descriptionEn: descriptionEn ?? this.descriptionEn,
        hasPortrait: hasPortrait ?? this.hasPortrait,
      );
  Painter copyWithCompanion(PaintersCompanion data) {
    return Painter(
      id: data.id.present ? data.id.value : this.id,
      sort: data.sort.present ? data.sort.value : this.sort,
      nameJa: data.nameJa.present ? data.nameJa.value : this.nameJa,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      shortNameJa:
          data.shortNameJa.present ? data.shortNameJa.value : this.shortNameJa,
      shortNameEn:
          data.shortNameEn.present ? data.shortNameEn.value : this.shortNameEn,
      aliasJa: data.aliasJa.present ? data.aliasJa.value : this.aliasJa,
      aliasEn: data.aliasEn.present ? data.aliasEn.value : this.aliasEn,
      bornIn: data.bornIn.present ? data.bornIn.value : this.bornIn,
      diedIn: data.diedIn.present ? data.diedIn.value : this.diedIn,
      descriptionJa: data.descriptionJa.present
          ? data.descriptionJa.value
          : this.descriptionJa,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      hasPortrait:
          data.hasPortrait.present ? data.hasPortrait.value : this.hasPortrait,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Painter(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('nameJa: $nameJa, ')
          ..write('nameEn: $nameEn, ')
          ..write('shortNameJa: $shortNameJa, ')
          ..write('shortNameEn: $shortNameEn, ')
          ..write('aliasJa: $aliasJa, ')
          ..write('aliasEn: $aliasEn, ')
          ..write('bornIn: $bornIn, ')
          ..write('diedIn: $diedIn, ')
          ..write('descriptionJa: $descriptionJa, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('hasPortrait: $hasPortrait')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sort,
      nameJa,
      nameEn,
      shortNameJa,
      shortNameEn,
      aliasJa,
      aliasEn,
      bornIn,
      diedIn,
      descriptionJa,
      descriptionEn,
      hasPortrait);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Painter &&
          other.id == this.id &&
          other.sort == this.sort &&
          other.nameJa == this.nameJa &&
          other.nameEn == this.nameEn &&
          other.shortNameJa == this.shortNameJa &&
          other.shortNameEn == this.shortNameEn &&
          other.aliasJa == this.aliasJa &&
          other.aliasEn == this.aliasEn &&
          other.bornIn == this.bornIn &&
          other.diedIn == this.diedIn &&
          other.descriptionJa == this.descriptionJa &&
          other.descriptionEn == this.descriptionEn &&
          other.hasPortrait == this.hasPortrait);
}

class PaintersCompanion extends UpdateCompanion<Painter> {
  final Value<int> id;
  final Value<int> sort;
  final Value<String> nameJa;
  final Value<String> nameEn;
  final Value<String> shortNameJa;
  final Value<String> shortNameEn;
  final Value<String> aliasJa;
  final Value<String> aliasEn;
  final Value<int?> bornIn;
  final Value<int?> diedIn;
  final Value<String> descriptionJa;
  final Value<String> descriptionEn;
  final Value<bool> hasPortrait;
  final Value<int> rowid;
  const PaintersCompanion({
    this.id = const Value.absent(),
    this.sort = const Value.absent(),
    this.nameJa = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.shortNameJa = const Value.absent(),
    this.shortNameEn = const Value.absent(),
    this.aliasJa = const Value.absent(),
    this.aliasEn = const Value.absent(),
    this.bornIn = const Value.absent(),
    this.diedIn = const Value.absent(),
    this.descriptionJa = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.hasPortrait = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaintersCompanion.insert({
    required int id,
    required int sort,
    required String nameJa,
    required String nameEn,
    required String shortNameJa,
    required String shortNameEn,
    required String aliasJa,
    required String aliasEn,
    this.bornIn = const Value.absent(),
    this.diedIn = const Value.absent(),
    required String descriptionJa,
    required String descriptionEn,
    required bool hasPortrait,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sort = Value(sort),
        nameJa = Value(nameJa),
        nameEn = Value(nameEn),
        shortNameJa = Value(shortNameJa),
        shortNameEn = Value(shortNameEn),
        aliasJa = Value(aliasJa),
        aliasEn = Value(aliasEn),
        descriptionJa = Value(descriptionJa),
        descriptionEn = Value(descriptionEn),
        hasPortrait = Value(hasPortrait);
  static Insertable<Painter> custom({
    Expression<int>? id,
    Expression<int>? sort,
    Expression<String>? nameJa,
    Expression<String>? nameEn,
    Expression<String>? shortNameJa,
    Expression<String>? shortNameEn,
    Expression<String>? aliasJa,
    Expression<String>? aliasEn,
    Expression<int>? bornIn,
    Expression<int>? diedIn,
    Expression<String>? descriptionJa,
    Expression<String>? descriptionEn,
    Expression<bool>? hasPortrait,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sort != null) 'sort': sort,
      if (nameJa != null) 'name_ja': nameJa,
      if (nameEn != null) 'name_en': nameEn,
      if (shortNameJa != null) 'short_name_ja': shortNameJa,
      if (shortNameEn != null) 'short_name_en': shortNameEn,
      if (aliasJa != null) 'alias_ja': aliasJa,
      if (aliasEn != null) 'alias_en': aliasEn,
      if (bornIn != null) 'born_in': bornIn,
      if (diedIn != null) 'died_in': diedIn,
      if (descriptionJa != null) 'description_ja': descriptionJa,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (hasPortrait != null) 'has_portrait': hasPortrait,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaintersCompanion copyWith(
      {Value<int>? id,
      Value<int>? sort,
      Value<String>? nameJa,
      Value<String>? nameEn,
      Value<String>? shortNameJa,
      Value<String>? shortNameEn,
      Value<String>? aliasJa,
      Value<String>? aliasEn,
      Value<int?>? bornIn,
      Value<int?>? diedIn,
      Value<String>? descriptionJa,
      Value<String>? descriptionEn,
      Value<bool>? hasPortrait,
      Value<int>? rowid}) {
    return PaintersCompanion(
      id: id ?? this.id,
      sort: sort ?? this.sort,
      nameJa: nameJa ?? this.nameJa,
      nameEn: nameEn ?? this.nameEn,
      shortNameJa: shortNameJa ?? this.shortNameJa,
      shortNameEn: shortNameEn ?? this.shortNameEn,
      aliasJa: aliasJa ?? this.aliasJa,
      aliasEn: aliasEn ?? this.aliasEn,
      bornIn: bornIn ?? this.bornIn,
      diedIn: diedIn ?? this.diedIn,
      descriptionJa: descriptionJa ?? this.descriptionJa,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      hasPortrait: hasPortrait ?? this.hasPortrait,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sort.present) {
      map['sort'] = Variable<int>(sort.value);
    }
    if (nameJa.present) {
      map['name_ja'] = Variable<String>(nameJa.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (shortNameJa.present) {
      map['short_name_ja'] = Variable<String>(shortNameJa.value);
    }
    if (shortNameEn.present) {
      map['short_name_en'] = Variable<String>(shortNameEn.value);
    }
    if (aliasJa.present) {
      map['alias_ja'] = Variable<String>(aliasJa.value);
    }
    if (aliasEn.present) {
      map['alias_en'] = Variable<String>(aliasEn.value);
    }
    if (bornIn.present) {
      map['born_in'] = Variable<int>(bornIn.value);
    }
    if (diedIn.present) {
      map['died_in'] = Variable<int>(diedIn.value);
    }
    if (descriptionJa.present) {
      map['description_ja'] = Variable<String>(descriptionJa.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (hasPortrait.present) {
      map['has_portrait'] = Variable<bool>(hasPortrait.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaintersCompanion(')
          ..write('id: $id, ')
          ..write('sort: $sort, ')
          ..write('nameJa: $nameJa, ')
          ..write('nameEn: $nameEn, ')
          ..write('shortNameJa: $shortNameJa, ')
          ..write('shortNameEn: $shortNameEn, ')
          ..write('aliasJa: $aliasJa, ')
          ..write('aliasEn: $aliasEn, ')
          ..write('bornIn: $bornIn, ')
          ..write('diedIn: $diedIn, ')
          ..write('descriptionJa: $descriptionJa, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('hasPortrait: $hasPortrait, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorksTable extends Works with TableInfo<$WorksTable, Work> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _seriesMeta = const VerificationMeta('series');
  @override
  late final GeneratedColumn<int> series = GeneratedColumn<int>(
      'series', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES serieses (id)'));
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
      'index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameJaMeta = const VerificationMeta('nameJa');
  @override
  late final GeneratedColumn<String> nameJa = GeneratedColumn<String>(
      'name_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
      'name_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<int> season = GeneratedColumn<int>(
      'season', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _publishedInMeta =
      const VerificationMeta('publishedIn');
  @override
  late final GeneratedColumn<int> publishedIn = GeneratedColumn<int>(
      'published_in', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<double> direction = GeneratedColumn<double>(
      'direction', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<int> source = GeneratedColumn<int>(
      'source', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sources (id)'));
  static const VerificationMeta _descriptionJaMeta =
      const VerificationMeta('descriptionJa');
  @override
  late final GeneratedColumn<String> descriptionJa = GeneratedColumn<String>(
      'description_ja', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionEnMeta =
      const VerificationMeta('descriptionEn');
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
      'description_en', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        series,
        index,
        nameJa,
        nameEn,
        season,
        publishedIn,
        latitude,
        longitude,
        direction,
        source,
        descriptionJa,
        descriptionEn
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'works';
  @override
  VerificationContext validateIntegrity(Insertable<Work> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('series')) {
      context.handle(_seriesMeta,
          series.isAcceptableOrUnknown(data['series']!, _seriesMeta));
    }
    if (data.containsKey('index')) {
      context.handle(
          _indexMeta, index.isAcceptableOrUnknown(data['index']!, _indexMeta));
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('name_ja')) {
      context.handle(_nameJaMeta,
          nameJa.isAcceptableOrUnknown(data['name_ja']!, _nameJaMeta));
    } else if (isInserting) {
      context.missing(_nameJaMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(_nameEnMeta,
          nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta));
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('season')) {
      context.handle(_seasonMeta,
          season.isAcceptableOrUnknown(data['season']!, _seasonMeta));
    }
    if (data.containsKey('published_in')) {
      context.handle(
          _publishedInMeta,
          publishedIn.isAcceptableOrUnknown(
              data['published_in']!, _publishedInMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('description_ja')) {
      context.handle(
          _descriptionJaMeta,
          descriptionJa.isAcceptableOrUnknown(
              data['description_ja']!, _descriptionJaMeta));
    } else if (isInserting) {
      context.missing(_descriptionJaMeta);
    }
    if (data.containsKey('description_en')) {
      context.handle(
          _descriptionEnMeta,
          descriptionEn.isAcceptableOrUnknown(
              data['description_en']!, _descriptionEnMeta));
    } else if (isInserting) {
      context.missing(_descriptionEnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Work map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Work(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      series: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}series']),
      index: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}index'])!,
      nameJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_ja'])!,
      nameEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name_en'])!,
      season: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}season']),
      publishedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}published_in']),
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}direction']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}source'])!,
      descriptionJa: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description_ja'])!,
      descriptionEn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description_en'])!,
    );
  }

  @override
  $WorksTable createAlias(String alias) {
    return $WorksTable(attachedDatabase, alias);
  }
}

class Work extends DataClass implements Insertable<Work> {
  /// ID
  final int id;

  /// シリーズ
  final int? series;

  /// 作品インデックス
  final int index;

  /// 名前（日本語）
  final String nameJa;

  /// 名前（英語）
  final String nameEn;

  /// 季節
  final int? season;

  /// 成立年
  final int? publishedIn;

  /// 緯度
  final double latitude;

  /// 経度
  final double longitude;

  /// 方角
  final double? direction;

  /// 出典
  final int source;

  /// 解説（日本語）
  final String descriptionJa;

  /// 解説（英語）
  final String descriptionEn;
  const Work(
      {required this.id,
      this.series,
      required this.index,
      required this.nameJa,
      required this.nameEn,
      this.season,
      this.publishedIn,
      required this.latitude,
      required this.longitude,
      this.direction,
      required this.source,
      required this.descriptionJa,
      required this.descriptionEn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || series != null) {
      map['series'] = Variable<int>(series);
    }
    map['index'] = Variable<int>(index);
    map['name_ja'] = Variable<String>(nameJa);
    map['name_en'] = Variable<String>(nameEn);
    if (!nullToAbsent || season != null) {
      map['season'] = Variable<int>(season);
    }
    if (!nullToAbsent || publishedIn != null) {
      map['published_in'] = Variable<int>(publishedIn);
    }
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || direction != null) {
      map['direction'] = Variable<double>(direction);
    }
    map['source'] = Variable<int>(source);
    map['description_ja'] = Variable<String>(descriptionJa);
    map['description_en'] = Variable<String>(descriptionEn);
    return map;
  }

  WorksCompanion toCompanion(bool nullToAbsent) {
    return WorksCompanion(
      id: Value(id),
      series:
          series == null && nullToAbsent ? const Value.absent() : Value(series),
      index: Value(index),
      nameJa: Value(nameJa),
      nameEn: Value(nameEn),
      season:
          season == null && nullToAbsent ? const Value.absent() : Value(season),
      publishedIn: publishedIn == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedIn),
      latitude: Value(latitude),
      longitude: Value(longitude),
      direction: direction == null && nullToAbsent
          ? const Value.absent()
          : Value(direction),
      source: Value(source),
      descriptionJa: Value(descriptionJa),
      descriptionEn: Value(descriptionEn),
    );
  }

  factory Work.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Work(
      id: serializer.fromJson<int>(json['id']),
      series: serializer.fromJson<int?>(json['series']),
      index: serializer.fromJson<int>(json['index']),
      nameJa: serializer.fromJson<String>(json['nameJa']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      season: serializer.fromJson<int?>(json['season']),
      publishedIn: serializer.fromJson<int?>(json['publishedIn']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      direction: serializer.fromJson<double?>(json['direction']),
      source: serializer.fromJson<int>(json['source']),
      descriptionJa: serializer.fromJson<String>(json['descriptionJa']),
      descriptionEn: serializer.fromJson<String>(json['descriptionEn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'series': serializer.toJson<int?>(series),
      'index': serializer.toJson<int>(index),
      'nameJa': serializer.toJson<String>(nameJa),
      'nameEn': serializer.toJson<String>(nameEn),
      'season': serializer.toJson<int?>(season),
      'publishedIn': serializer.toJson<int?>(publishedIn),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'direction': serializer.toJson<double?>(direction),
      'source': serializer.toJson<int>(source),
      'descriptionJa': serializer.toJson<String>(descriptionJa),
      'descriptionEn': serializer.toJson<String>(descriptionEn),
    };
  }

  Work copyWith(
          {int? id,
          Value<int?> series = const Value.absent(),
          int? index,
          String? nameJa,
          String? nameEn,
          Value<int?> season = const Value.absent(),
          Value<int?> publishedIn = const Value.absent(),
          double? latitude,
          double? longitude,
          Value<double?> direction = const Value.absent(),
          int? source,
          String? descriptionJa,
          String? descriptionEn}) =>
      Work(
        id: id ?? this.id,
        series: series.present ? series.value : this.series,
        index: index ?? this.index,
        nameJa: nameJa ?? this.nameJa,
        nameEn: nameEn ?? this.nameEn,
        season: season.present ? season.value : this.season,
        publishedIn: publishedIn.present ? publishedIn.value : this.publishedIn,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        direction: direction.present ? direction.value : this.direction,
        source: source ?? this.source,
        descriptionJa: descriptionJa ?? this.descriptionJa,
        descriptionEn: descriptionEn ?? this.descriptionEn,
      );
  Work copyWithCompanion(WorksCompanion data) {
    return Work(
      id: data.id.present ? data.id.value : this.id,
      series: data.series.present ? data.series.value : this.series,
      index: data.index.present ? data.index.value : this.index,
      nameJa: data.nameJa.present ? data.nameJa.value : this.nameJa,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      season: data.season.present ? data.season.value : this.season,
      publishedIn:
          data.publishedIn.present ? data.publishedIn.value : this.publishedIn,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      direction: data.direction.present ? data.direction.value : this.direction,
      source: data.source.present ? data.source.value : this.source,
      descriptionJa: data.descriptionJa.present
          ? data.descriptionJa.value
          : this.descriptionJa,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Work(')
          ..write('id: $id, ')
          ..write('series: $series, ')
          ..write('index: $index, ')
          ..write('nameJa: $nameJa, ')
          ..write('nameEn: $nameEn, ')
          ..write('season: $season, ')
          ..write('publishedIn: $publishedIn, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('direction: $direction, ')
          ..write('source: $source, ')
          ..write('descriptionJa: $descriptionJa, ')
          ..write('descriptionEn: $descriptionEn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      series,
      index,
      nameJa,
      nameEn,
      season,
      publishedIn,
      latitude,
      longitude,
      direction,
      source,
      descriptionJa,
      descriptionEn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Work &&
          other.id == this.id &&
          other.series == this.series &&
          other.index == this.index &&
          other.nameJa == this.nameJa &&
          other.nameEn == this.nameEn &&
          other.season == this.season &&
          other.publishedIn == this.publishedIn &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.direction == this.direction &&
          other.source == this.source &&
          other.descriptionJa == this.descriptionJa &&
          other.descriptionEn == this.descriptionEn);
}

class WorksCompanion extends UpdateCompanion<Work> {
  final Value<int> id;
  final Value<int?> series;
  final Value<int> index;
  final Value<String> nameJa;
  final Value<String> nameEn;
  final Value<int?> season;
  final Value<int?> publishedIn;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double?> direction;
  final Value<int> source;
  final Value<String> descriptionJa;
  final Value<String> descriptionEn;
  final Value<int> rowid;
  const WorksCompanion({
    this.id = const Value.absent(),
    this.series = const Value.absent(),
    this.index = const Value.absent(),
    this.nameJa = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.season = const Value.absent(),
    this.publishedIn = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.direction = const Value.absent(),
    this.source = const Value.absent(),
    this.descriptionJa = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorksCompanion.insert({
    required int id,
    this.series = const Value.absent(),
    required int index,
    required String nameJa,
    required String nameEn,
    this.season = const Value.absent(),
    this.publishedIn = const Value.absent(),
    required double latitude,
    required double longitude,
    this.direction = const Value.absent(),
    required int source,
    required String descriptionJa,
    required String descriptionEn,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        index = Value(index),
        nameJa = Value(nameJa),
        nameEn = Value(nameEn),
        latitude = Value(latitude),
        longitude = Value(longitude),
        source = Value(source),
        descriptionJa = Value(descriptionJa),
        descriptionEn = Value(descriptionEn);
  static Insertable<Work> custom({
    Expression<int>? id,
    Expression<int>? series,
    Expression<int>? index,
    Expression<String>? nameJa,
    Expression<String>? nameEn,
    Expression<int>? season,
    Expression<int>? publishedIn,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? direction,
    Expression<int>? source,
    Expression<String>? descriptionJa,
    Expression<String>? descriptionEn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (series != null) 'series': series,
      if (index != null) 'index': index,
      if (nameJa != null) 'name_ja': nameJa,
      if (nameEn != null) 'name_en': nameEn,
      if (season != null) 'season': season,
      if (publishedIn != null) 'published_in': publishedIn,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (direction != null) 'direction': direction,
      if (source != null) 'source': source,
      if (descriptionJa != null) 'description_ja': descriptionJa,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorksCompanion copyWith(
      {Value<int>? id,
      Value<int?>? series,
      Value<int>? index,
      Value<String>? nameJa,
      Value<String>? nameEn,
      Value<int?>? season,
      Value<int?>? publishedIn,
      Value<double>? latitude,
      Value<double>? longitude,
      Value<double?>? direction,
      Value<int>? source,
      Value<String>? descriptionJa,
      Value<String>? descriptionEn,
      Value<int>? rowid}) {
    return WorksCompanion(
      id: id ?? this.id,
      series: series ?? this.series,
      index: index ?? this.index,
      nameJa: nameJa ?? this.nameJa,
      nameEn: nameEn ?? this.nameEn,
      season: season ?? this.season,
      publishedIn: publishedIn ?? this.publishedIn,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      direction: direction ?? this.direction,
      source: source ?? this.source,
      descriptionJa: descriptionJa ?? this.descriptionJa,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (series.present) {
      map['series'] = Variable<int>(series.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (nameJa.present) {
      map['name_ja'] = Variable<String>(nameJa.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (season.present) {
      map['season'] = Variable<int>(season.value);
    }
    if (publishedIn.present) {
      map['published_in'] = Variable<int>(publishedIn.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (direction.present) {
      map['direction'] = Variable<double>(direction.value);
    }
    if (source.present) {
      map['source'] = Variable<int>(source.value);
    }
    if (descriptionJa.present) {
      map['description_ja'] = Variable<String>(descriptionJa.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorksCompanion(')
          ..write('id: $id, ')
          ..write('series: $series, ')
          ..write('index: $index, ')
          ..write('nameJa: $nameJa, ')
          ..write('nameEn: $nameEn, ')
          ..write('season: $season, ')
          ..write('publishedIn: $publishedIn, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('direction: $direction, ')
          ..write('source: $source, ')
          ..write('descriptionJa: $descriptionJa, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WorksPaintersTable extends WorksPainters
    with TableInfo<$WorksPaintersTable, WorkPainter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorksPaintersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
      'work_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES works(id) NOT NULL');
  static const VerificationMeta _painterIdMeta =
      const VerificationMeta('painterId');
  @override
  late final GeneratedColumn<int> painterId = GeneratedColumn<int>(
      'painter_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES painters(id) NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [workId, painterId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'works_painters';
  @override
  VerificationContext validateIntegrity(Insertable<WorkPainter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(_workIdMeta,
          workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta));
    } else if (isInserting) {
      context.missing(_workIdMeta);
    }
    if (data.containsKey('painter_id')) {
      context.handle(_painterIdMeta,
          painterId.isAcceptableOrUnknown(data['painter_id']!, _painterIdMeta));
    } else if (isInserting) {
      context.missing(_painterIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId, painterId};
  @override
  WorkPainter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkPainter(
      workId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_id'])!,
      painterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}painter_id'])!,
    );
  }

  @override
  $WorksPaintersTable createAlias(String alias) {
    return $WorksPaintersTable(attachedDatabase, alias);
  }
}

class WorkPainter extends DataClass implements Insertable<WorkPainter> {
  final int workId;
  final int painterId;
  const WorkPainter({required this.workId, required this.painterId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    map['painter_id'] = Variable<int>(painterId);
    return map;
  }

  WorksPaintersCompanion toCompanion(bool nullToAbsent) {
    return WorksPaintersCompanion(
      workId: Value(workId),
      painterId: Value(painterId),
    );
  }

  factory WorkPainter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkPainter(
      workId: serializer.fromJson<int>(json['workId']),
      painterId: serializer.fromJson<int>(json['painterId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
      'painterId': serializer.toJson<int>(painterId),
    };
  }

  WorkPainter copyWith({int? workId, int? painterId}) => WorkPainter(
        workId: workId ?? this.workId,
        painterId: painterId ?? this.painterId,
      );
  WorkPainter copyWithCompanion(WorksPaintersCompanion data) {
    return WorkPainter(
      workId: data.workId.present ? data.workId.value : this.workId,
      painterId: data.painterId.present ? data.painterId.value : this.painterId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkPainter(')
          ..write('workId: $workId, ')
          ..write('painterId: $painterId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(workId, painterId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkPainter &&
          other.workId == this.workId &&
          other.painterId == this.painterId);
}

class WorksPaintersCompanion extends UpdateCompanion<WorkPainter> {
  final Value<int> workId;
  final Value<int> painterId;
  final Value<int> rowid;
  const WorksPaintersCompanion({
    this.workId = const Value.absent(),
    this.painterId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorksPaintersCompanion.insert({
    required int workId,
    required int painterId,
    this.rowid = const Value.absent(),
  })  : workId = Value(workId),
        painterId = Value(painterId);
  static Insertable<WorkPainter> custom({
    Expression<int>? workId,
    Expression<int>? painterId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
      if (painterId != null) 'painter_id': painterId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorksPaintersCompanion copyWith(
      {Value<int>? workId, Value<int>? painterId, Value<int>? rowid}) {
    return WorksPaintersCompanion(
      workId: workId ?? this.workId,
      painterId: painterId ?? this.painterId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    if (painterId.present) {
      map['painter_id'] = Variable<int>(painterId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorksPaintersCompanion(')
          ..write('workId: $workId, ')
          ..write('painterId: $painterId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavouritesTable extends Favourites
    with TableInfo<$FavouritesTable, Favourite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavouritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _workIdMeta = const VerificationMeta('workId');
  @override
  late final GeneratedColumn<int> workId = GeneratedColumn<int>(
      'work_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES works(id) NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [workId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favourites';
  @override
  VerificationContext validateIntegrity(Insertable<Favourite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('work_id')) {
      context.handle(_workIdMeta,
          workId.isAcceptableOrUnknown(data['work_id']!, _workIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {workId};
  @override
  Favourite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favourite(
      workId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_id'])!,
    );
  }

  @override
  $FavouritesTable createAlias(String alias) {
    return $FavouritesTable(attachedDatabase, alias);
  }
}

class Favourite extends DataClass implements Insertable<Favourite> {
  final int workId;
  const Favourite({required this.workId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['work_id'] = Variable<int>(workId);
    return map;
  }

  FavouritesCompanion toCompanion(bool nullToAbsent) {
    return FavouritesCompanion(
      workId: Value(workId),
    );
  }

  factory Favourite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favourite(
      workId: serializer.fromJson<int>(json['workId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'workId': serializer.toJson<int>(workId),
    };
  }

  Favourite copyWith({int? workId}) => Favourite(
        workId: workId ?? this.workId,
      );
  Favourite copyWithCompanion(FavouritesCompanion data) {
    return Favourite(
      workId: data.workId.present ? data.workId.value : this.workId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favourite(')
          ..write('workId: $workId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => workId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favourite && other.workId == this.workId);
}

class FavouritesCompanion extends UpdateCompanion<Favourite> {
  final Value<int> workId;
  const FavouritesCompanion({
    this.workId = const Value.absent(),
  });
  FavouritesCompanion.insert({
    this.workId = const Value.absent(),
  });
  static Insertable<Favourite> custom({
    Expression<int>? workId,
  }) {
    return RawValuesInsertable({
      if (workId != null) 'work_id': workId,
    });
  }

  FavouritesCompanion copyWith({Value<int>? workId}) {
    return FavouritesCompanion(
      workId: workId ?? this.workId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (workId.present) {
      map['work_id'] = Variable<int>(workId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavouritesCompanion(')
          ..write('workId: $workId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $SourcesTable sources = $SourcesTable(this);
  late final $SeriesesTable serieses = $SeriesesTable(this);
  late final $PaintersTable painters = $PaintersTable(this);
  late final $WorksTable works = $WorksTable(this);
  late final $WorksPaintersTable worksPainters = $WorksPaintersTable(this);
  late final $FavouritesTable favourites = $FavouritesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [sources, serieses, painters, works, worksPainters, favourites];
}

typedef $$SourcesTableCreateCompanionBuilder = SourcesCompanion Function({
  required int id,
  required String nameJa,
  required String nameEn,
  required String licenseJa,
  required String licenseEn,
  Value<int> rowid,
});
typedef $$SourcesTableUpdateCompanionBuilder = SourcesCompanion Function({
  Value<int> id,
  Value<String> nameJa,
  Value<String> nameEn,
  Value<String> licenseJa,
  Value<String> licenseEn,
  Value<int> rowid,
});

class $$SourcesTableTableManager extends RootTableManager<
    _$Database,
    $SourcesTable,
    Source,
    $$SourcesTableFilterComposer,
    $$SourcesTableOrderingComposer,
    $$SourcesTableCreateCompanionBuilder,
    $$SourcesTableUpdateCompanionBuilder> {
  $$SourcesTableTableManager(_$Database db, $SourcesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SourcesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SourcesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nameJa = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String> licenseJa = const Value.absent(),
            Value<String> licenseEn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SourcesCompanion(
            id: id,
            nameJa: nameJa,
            nameEn: nameEn,
            licenseJa: licenseJa,
            licenseEn: licenseEn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String nameJa,
            required String nameEn,
            required String licenseJa,
            required String licenseEn,
            Value<int> rowid = const Value.absent(),
          }) =>
              SourcesCompanion.insert(
            id: id,
            nameJa: nameJa,
            nameEn: nameEn,
            licenseJa: licenseJa,
            licenseEn: licenseEn,
            rowid: rowid,
          ),
        ));
}

class $$SourcesTableFilterComposer
    extends FilterComposer<_$Database, $SourcesTable> {
  $$SourcesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameJa => $state.composableBuilder(
      column: $state.table.nameJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameEn => $state.composableBuilder(
      column: $state.table.nameEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get licenseJa => $state.composableBuilder(
      column: $state.table.licenseJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get licenseEn => $state.composableBuilder(
      column: $state.table.licenseEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter worksRefs(
      ComposableFilter Function($$WorksTableFilterComposer f) f) {
    final $$WorksTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.works,
        getReferencedColumn: (t) => t.source,
        builder: (joinBuilder, parentComposers) => $$WorksTableFilterComposer(
            ComposerState(
                $state.db, $state.db.works, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$SourcesTableOrderingComposer
    extends OrderingComposer<_$Database, $SourcesTable> {
  $$SourcesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameJa => $state.composableBuilder(
      column: $state.table.nameJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameEn => $state.composableBuilder(
      column: $state.table.nameEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get licenseJa => $state.composableBuilder(
      column: $state.table.licenseJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get licenseEn => $state.composableBuilder(
      column: $state.table.licenseEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SeriesesTableCreateCompanionBuilder = SeriesesCompanion Function({
  required int id,
  required int sort,
  required String nameJa,
  required String nameEn,
  required String shortNameJa,
  required String shortNameEn,
  required String descriptionJa,
  required String descriptionEn,
  Value<int> rowid,
});
typedef $$SeriesesTableUpdateCompanionBuilder = SeriesesCompanion Function({
  Value<int> id,
  Value<int> sort,
  Value<String> nameJa,
  Value<String> nameEn,
  Value<String> shortNameJa,
  Value<String> shortNameEn,
  Value<String> descriptionJa,
  Value<String> descriptionEn,
  Value<int> rowid,
});

class $$SeriesesTableTableManager extends RootTableManager<
    _$Database,
    $SeriesesTable,
    Series,
    $$SeriesesTableFilterComposer,
    $$SeriesesTableOrderingComposer,
    $$SeriesesTableCreateCompanionBuilder,
    $$SeriesesTableUpdateCompanionBuilder> {
  $$SeriesesTableTableManager(_$Database db, $SeriesesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SeriesesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SeriesesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sort = const Value.absent(),
            Value<String> nameJa = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String> shortNameJa = const Value.absent(),
            Value<String> shortNameEn = const Value.absent(),
            Value<String> descriptionJa = const Value.absent(),
            Value<String> descriptionEn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SeriesesCompanion(
            id: id,
            sort: sort,
            nameJa: nameJa,
            nameEn: nameEn,
            shortNameJa: shortNameJa,
            shortNameEn: shortNameEn,
            descriptionJa: descriptionJa,
            descriptionEn: descriptionEn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int sort,
            required String nameJa,
            required String nameEn,
            required String shortNameJa,
            required String shortNameEn,
            required String descriptionJa,
            required String descriptionEn,
            Value<int> rowid = const Value.absent(),
          }) =>
              SeriesesCompanion.insert(
            id: id,
            sort: sort,
            nameJa: nameJa,
            nameEn: nameEn,
            shortNameJa: shortNameJa,
            shortNameEn: shortNameEn,
            descriptionJa: descriptionJa,
            descriptionEn: descriptionEn,
            rowid: rowid,
          ),
        ));
}

class $$SeriesesTableFilterComposer
    extends FilterComposer<_$Database, $SeriesesTable> {
  $$SeriesesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sort => $state.composableBuilder(
      column: $state.table.sort,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameJa => $state.composableBuilder(
      column: $state.table.nameJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameEn => $state.composableBuilder(
      column: $state.table.nameEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get shortNameJa => $state.composableBuilder(
      column: $state.table.shortNameJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get shortNameEn => $state.composableBuilder(
      column: $state.table.shortNameEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descriptionJa => $state.composableBuilder(
      column: $state.table.descriptionJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descriptionEn => $state.composableBuilder(
      column: $state.table.descriptionEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter worksRefs(
      ComposableFilter Function($$WorksTableFilterComposer f) f) {
    final $$WorksTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.works,
        getReferencedColumn: (t) => t.series,
        builder: (joinBuilder, parentComposers) => $$WorksTableFilterComposer(
            ComposerState(
                $state.db, $state.db.works, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$SeriesesTableOrderingComposer
    extends OrderingComposer<_$Database, $SeriesesTable> {
  $$SeriesesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sort => $state.composableBuilder(
      column: $state.table.sort,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameJa => $state.composableBuilder(
      column: $state.table.nameJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameEn => $state.composableBuilder(
      column: $state.table.nameEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get shortNameJa => $state.composableBuilder(
      column: $state.table.shortNameJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get shortNameEn => $state.composableBuilder(
      column: $state.table.shortNameEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descriptionJa => $state.composableBuilder(
      column: $state.table.descriptionJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descriptionEn => $state.composableBuilder(
      column: $state.table.descriptionEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PaintersTableCreateCompanionBuilder = PaintersCompanion Function({
  required int id,
  required int sort,
  required String nameJa,
  required String nameEn,
  required String shortNameJa,
  required String shortNameEn,
  required String aliasJa,
  required String aliasEn,
  Value<int?> bornIn,
  Value<int?> diedIn,
  required String descriptionJa,
  required String descriptionEn,
  required bool hasPortrait,
  Value<int> rowid,
});
typedef $$PaintersTableUpdateCompanionBuilder = PaintersCompanion Function({
  Value<int> id,
  Value<int> sort,
  Value<String> nameJa,
  Value<String> nameEn,
  Value<String> shortNameJa,
  Value<String> shortNameEn,
  Value<String> aliasJa,
  Value<String> aliasEn,
  Value<int?> bornIn,
  Value<int?> diedIn,
  Value<String> descriptionJa,
  Value<String> descriptionEn,
  Value<bool> hasPortrait,
  Value<int> rowid,
});

class $$PaintersTableTableManager extends RootTableManager<
    _$Database,
    $PaintersTable,
    Painter,
    $$PaintersTableFilterComposer,
    $$PaintersTableOrderingComposer,
    $$PaintersTableCreateCompanionBuilder,
    $$PaintersTableUpdateCompanionBuilder> {
  $$PaintersTableTableManager(_$Database db, $PaintersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PaintersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PaintersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sort = const Value.absent(),
            Value<String> nameJa = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<String> shortNameJa = const Value.absent(),
            Value<String> shortNameEn = const Value.absent(),
            Value<String> aliasJa = const Value.absent(),
            Value<String> aliasEn = const Value.absent(),
            Value<int?> bornIn = const Value.absent(),
            Value<int?> diedIn = const Value.absent(),
            Value<String> descriptionJa = const Value.absent(),
            Value<String> descriptionEn = const Value.absent(),
            Value<bool> hasPortrait = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaintersCompanion(
            id: id,
            sort: sort,
            nameJa: nameJa,
            nameEn: nameEn,
            shortNameJa: shortNameJa,
            shortNameEn: shortNameEn,
            aliasJa: aliasJa,
            aliasEn: aliasEn,
            bornIn: bornIn,
            diedIn: diedIn,
            descriptionJa: descriptionJa,
            descriptionEn: descriptionEn,
            hasPortrait: hasPortrait,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int sort,
            required String nameJa,
            required String nameEn,
            required String shortNameJa,
            required String shortNameEn,
            required String aliasJa,
            required String aliasEn,
            Value<int?> bornIn = const Value.absent(),
            Value<int?> diedIn = const Value.absent(),
            required String descriptionJa,
            required String descriptionEn,
            required bool hasPortrait,
            Value<int> rowid = const Value.absent(),
          }) =>
              PaintersCompanion.insert(
            id: id,
            sort: sort,
            nameJa: nameJa,
            nameEn: nameEn,
            shortNameJa: shortNameJa,
            shortNameEn: shortNameEn,
            aliasJa: aliasJa,
            aliasEn: aliasEn,
            bornIn: bornIn,
            diedIn: diedIn,
            descriptionJa: descriptionJa,
            descriptionEn: descriptionEn,
            hasPortrait: hasPortrait,
            rowid: rowid,
          ),
        ));
}

class $$PaintersTableFilterComposer
    extends FilterComposer<_$Database, $PaintersTable> {
  $$PaintersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sort => $state.composableBuilder(
      column: $state.table.sort,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameJa => $state.composableBuilder(
      column: $state.table.nameJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameEn => $state.composableBuilder(
      column: $state.table.nameEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get shortNameJa => $state.composableBuilder(
      column: $state.table.shortNameJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get shortNameEn => $state.composableBuilder(
      column: $state.table.shortNameEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get aliasJa => $state.composableBuilder(
      column: $state.table.aliasJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get aliasEn => $state.composableBuilder(
      column: $state.table.aliasEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get bornIn => $state.composableBuilder(
      column: $state.table.bornIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get diedIn => $state.composableBuilder(
      column: $state.table.diedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descriptionJa => $state.composableBuilder(
      column: $state.table.descriptionJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descriptionEn => $state.composableBuilder(
      column: $state.table.descriptionEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasPortrait => $state.composableBuilder(
      column: $state.table.hasPortrait,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter worksPaintersRefs(
      ComposableFilter Function($$WorksPaintersTableFilterComposer f) f) {
    final $$WorksPaintersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.worksPainters,
        getReferencedColumn: (t) => t.painterId,
        builder: (joinBuilder, parentComposers) =>
            $$WorksPaintersTableFilterComposer(ComposerState($state.db,
                $state.db.worksPainters, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$PaintersTableOrderingComposer
    extends OrderingComposer<_$Database, $PaintersTable> {
  $$PaintersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sort => $state.composableBuilder(
      column: $state.table.sort,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameJa => $state.composableBuilder(
      column: $state.table.nameJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameEn => $state.composableBuilder(
      column: $state.table.nameEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get shortNameJa => $state.composableBuilder(
      column: $state.table.shortNameJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get shortNameEn => $state.composableBuilder(
      column: $state.table.shortNameEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get aliasJa => $state.composableBuilder(
      column: $state.table.aliasJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get aliasEn => $state.composableBuilder(
      column: $state.table.aliasEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get bornIn => $state.composableBuilder(
      column: $state.table.bornIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get diedIn => $state.composableBuilder(
      column: $state.table.diedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descriptionJa => $state.composableBuilder(
      column: $state.table.descriptionJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descriptionEn => $state.composableBuilder(
      column: $state.table.descriptionEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasPortrait => $state.composableBuilder(
      column: $state.table.hasPortrait,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$WorksTableCreateCompanionBuilder = WorksCompanion Function({
  required int id,
  Value<int?> series,
  required int index,
  required String nameJa,
  required String nameEn,
  Value<int?> season,
  Value<int?> publishedIn,
  required double latitude,
  required double longitude,
  Value<double?> direction,
  required int source,
  required String descriptionJa,
  required String descriptionEn,
  Value<int> rowid,
});
typedef $$WorksTableUpdateCompanionBuilder = WorksCompanion Function({
  Value<int> id,
  Value<int?> series,
  Value<int> index,
  Value<String> nameJa,
  Value<String> nameEn,
  Value<int?> season,
  Value<int?> publishedIn,
  Value<double> latitude,
  Value<double> longitude,
  Value<double?> direction,
  Value<int> source,
  Value<String> descriptionJa,
  Value<String> descriptionEn,
  Value<int> rowid,
});

class $$WorksTableTableManager extends RootTableManager<
    _$Database,
    $WorksTable,
    Work,
    $$WorksTableFilterComposer,
    $$WorksTableOrderingComposer,
    $$WorksTableCreateCompanionBuilder,
    $$WorksTableUpdateCompanionBuilder> {
  $$WorksTableTableManager(_$Database db, $WorksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorksTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorksTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> series = const Value.absent(),
            Value<int> index = const Value.absent(),
            Value<String> nameJa = const Value.absent(),
            Value<String> nameEn = const Value.absent(),
            Value<int?> season = const Value.absent(),
            Value<int?> publishedIn = const Value.absent(),
            Value<double> latitude = const Value.absent(),
            Value<double> longitude = const Value.absent(),
            Value<double?> direction = const Value.absent(),
            Value<int> source = const Value.absent(),
            Value<String> descriptionJa = const Value.absent(),
            Value<String> descriptionEn = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorksCompanion(
            id: id,
            series: series,
            index: index,
            nameJa: nameJa,
            nameEn: nameEn,
            season: season,
            publishedIn: publishedIn,
            latitude: latitude,
            longitude: longitude,
            direction: direction,
            source: source,
            descriptionJa: descriptionJa,
            descriptionEn: descriptionEn,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            Value<int?> series = const Value.absent(),
            required int index,
            required String nameJa,
            required String nameEn,
            Value<int?> season = const Value.absent(),
            Value<int?> publishedIn = const Value.absent(),
            required double latitude,
            required double longitude,
            Value<double?> direction = const Value.absent(),
            required int source,
            required String descriptionJa,
            required String descriptionEn,
            Value<int> rowid = const Value.absent(),
          }) =>
              WorksCompanion.insert(
            id: id,
            series: series,
            index: index,
            nameJa: nameJa,
            nameEn: nameEn,
            season: season,
            publishedIn: publishedIn,
            latitude: latitude,
            longitude: longitude,
            direction: direction,
            source: source,
            descriptionJa: descriptionJa,
            descriptionEn: descriptionEn,
            rowid: rowid,
          ),
        ));
}

class $$WorksTableFilterComposer
    extends FilterComposer<_$Database, $WorksTable> {
  $$WorksTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameJa => $state.composableBuilder(
      column: $state.table.nameJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nameEn => $state.composableBuilder(
      column: $state.table.nameEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get season => $state.composableBuilder(
      column: $state.table.season,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get publishedIn => $state.composableBuilder(
      column: $state.table.publishedIn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get latitude => $state.composableBuilder(
      column: $state.table.latitude,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get longitude => $state.composableBuilder(
      column: $state.table.longitude,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get direction => $state.composableBuilder(
      column: $state.table.direction,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descriptionJa => $state.composableBuilder(
      column: $state.table.descriptionJa,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descriptionEn => $state.composableBuilder(
      column: $state.table.descriptionEn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$SeriesesTableFilterComposer get series {
    final $$SeriesesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.series,
        referencedTable: $state.db.serieses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SeriesesTableFilterComposer(ComposerState(
                $state.db, $state.db.serieses, joinBuilder, parentComposers)));
    return composer;
  }

  $$SourcesTableFilterComposer get source {
    final $$SourcesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.source,
        referencedTable: $state.db.sources,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$SourcesTableFilterComposer(
            ComposerState(
                $state.db, $state.db.sources, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter worksPaintersRefs(
      ComposableFilter Function($$WorksPaintersTableFilterComposer f) f) {
    final $$WorksPaintersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.worksPainters,
        getReferencedColumn: (t) => t.workId,
        builder: (joinBuilder, parentComposers) =>
            $$WorksPaintersTableFilterComposer(ComposerState($state.db,
                $state.db.worksPainters, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter favouritesRefs(
      ComposableFilter Function($$FavouritesTableFilterComposer f) f) {
    final $$FavouritesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.favourites,
        getReferencedColumn: (t) => t.workId,
        builder: (joinBuilder, parentComposers) =>
            $$FavouritesTableFilterComposer(ComposerState($state.db,
                $state.db.favourites, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$WorksTableOrderingComposer
    extends OrderingComposer<_$Database, $WorksTable> {
  $$WorksTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get index => $state.composableBuilder(
      column: $state.table.index,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameJa => $state.composableBuilder(
      column: $state.table.nameJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nameEn => $state.composableBuilder(
      column: $state.table.nameEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get season => $state.composableBuilder(
      column: $state.table.season,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get publishedIn => $state.composableBuilder(
      column: $state.table.publishedIn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get latitude => $state.composableBuilder(
      column: $state.table.latitude,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get longitude => $state.composableBuilder(
      column: $state.table.longitude,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get direction => $state.composableBuilder(
      column: $state.table.direction,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descriptionJa => $state.composableBuilder(
      column: $state.table.descriptionJa,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descriptionEn => $state.composableBuilder(
      column: $state.table.descriptionEn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$SeriesesTableOrderingComposer get series {
    final $$SeriesesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.series,
        referencedTable: $state.db.serieses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SeriesesTableOrderingComposer(ComposerState(
                $state.db, $state.db.serieses, joinBuilder, parentComposers)));
    return composer;
  }

  $$SourcesTableOrderingComposer get source {
    final $$SourcesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.source,
        referencedTable: $state.db.sources,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$SourcesTableOrderingComposer(ComposerState(
                $state.db, $state.db.sources, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$WorksPaintersTableCreateCompanionBuilder = WorksPaintersCompanion
    Function({
  required int workId,
  required int painterId,
  Value<int> rowid,
});
typedef $$WorksPaintersTableUpdateCompanionBuilder = WorksPaintersCompanion
    Function({
  Value<int> workId,
  Value<int> painterId,
  Value<int> rowid,
});

class $$WorksPaintersTableTableManager extends RootTableManager<
    _$Database,
    $WorksPaintersTable,
    WorkPainter,
    $$WorksPaintersTableFilterComposer,
    $$WorksPaintersTableOrderingComposer,
    $$WorksPaintersTableCreateCompanionBuilder,
    $$WorksPaintersTableUpdateCompanionBuilder> {
  $$WorksPaintersTableTableManager(_$Database db, $WorksPaintersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WorksPaintersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WorksPaintersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> workId = const Value.absent(),
            Value<int> painterId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WorksPaintersCompanion(
            workId: workId,
            painterId: painterId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int workId,
            required int painterId,
            Value<int> rowid = const Value.absent(),
          }) =>
              WorksPaintersCompanion.insert(
            workId: workId,
            painterId: painterId,
            rowid: rowid,
          ),
        ));
}

class $$WorksPaintersTableFilterComposer
    extends FilterComposer<_$Database, $WorksPaintersTable> {
  $$WorksPaintersTableFilterComposer(super.$state);
  $$WorksTableFilterComposer get workId {
    final $$WorksTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $state.db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WorksTableFilterComposer(
            ComposerState(
                $state.db, $state.db.works, joinBuilder, parentComposers)));
    return composer;
  }

  $$PaintersTableFilterComposer get painterId {
    final $$PaintersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.painterId,
        referencedTable: $state.db.painters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PaintersTableFilterComposer(ComposerState(
                $state.db, $state.db.painters, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$WorksPaintersTableOrderingComposer
    extends OrderingComposer<_$Database, $WorksPaintersTable> {
  $$WorksPaintersTableOrderingComposer(super.$state);
  $$WorksTableOrderingComposer get workId {
    final $$WorksTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $state.db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WorksTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.works, joinBuilder, parentComposers)));
    return composer;
  }

  $$PaintersTableOrderingComposer get painterId {
    final $$PaintersTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.painterId,
        referencedTable: $state.db.painters,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PaintersTableOrderingComposer(ComposerState(
                $state.db, $state.db.painters, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$FavouritesTableCreateCompanionBuilder = FavouritesCompanion Function({
  Value<int> workId,
});
typedef $$FavouritesTableUpdateCompanionBuilder = FavouritesCompanion Function({
  Value<int> workId,
});

class $$FavouritesTableTableManager extends RootTableManager<
    _$Database,
    $FavouritesTable,
    Favourite,
    $$FavouritesTableFilterComposer,
    $$FavouritesTableOrderingComposer,
    $$FavouritesTableCreateCompanionBuilder,
    $$FavouritesTableUpdateCompanionBuilder> {
  $$FavouritesTableTableManager(_$Database db, $FavouritesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavouritesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FavouritesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> workId = const Value.absent(),
          }) =>
              FavouritesCompanion(
            workId: workId,
          ),
          createCompanionCallback: ({
            Value<int> workId = const Value.absent(),
          }) =>
              FavouritesCompanion.insert(
            workId: workId,
          ),
        ));
}

class $$FavouritesTableFilterComposer
    extends FilterComposer<_$Database, $FavouritesTable> {
  $$FavouritesTableFilterComposer(super.$state);
  $$WorksTableFilterComposer get workId {
    final $$WorksTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $state.db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WorksTableFilterComposer(
            ComposerState(
                $state.db, $state.db.works, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$FavouritesTableOrderingComposer
    extends OrderingComposer<_$Database, $FavouritesTable> {
  $$FavouritesTableOrderingComposer(super.$state);
  $$WorksTableOrderingComposer get workId {
    final $$WorksTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workId,
        referencedTable: $state.db.works,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$WorksTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.works, joinBuilder, parentComposers)));
    return composer;
  }
}

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$SourcesTableTableManager get sources =>
      $$SourcesTableTableManager(_db, _db.sources);
  $$SeriesesTableTableManager get serieses =>
      $$SeriesesTableTableManager(_db, _db.serieses);
  $$PaintersTableTableManager get painters =>
      $$PaintersTableTableManager(_db, _db.painters);
  $$WorksTableTableManager get works =>
      $$WorksTableTableManager(_db, _db.works);
  $$WorksPaintersTableTableManager get worksPainters =>
      $$WorksPaintersTableTableManager(_db, _db.worksPainters);
  $$FavouritesTableTableManager get favourites =>
      $$FavouritesTableTableManager(_db, _db.favourites);
}
