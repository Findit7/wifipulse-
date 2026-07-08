// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DevicesTable extends Devices with TableInfo<$DevicesTable, DeviceEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ipAddressMeta =
      const VerificationMeta('ipAddress');
  @override
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
      'ip_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _macAddressMeta =
      const VerificationMeta('macAddress');
  @override
  late final GeneratedColumn<String> macAddress = GeneratedColumn<String>(
      'mac_address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hostnameMeta =
      const VerificationMeta('hostname');
  @override
  late final GeneratedColumn<String> hostname = GeneratedColumn<String>(
      'hostname', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _vendorMeta = const VerificationMeta('vendor');
  @override
  late final GeneratedColumn<String> vendor = GeneratedColumn<String>(
      'vendor', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deviceTypeMeta =
      const VerificationMeta('deviceType');
  @override
  late final GeneratedColumn<String> deviceType = GeneratedColumn<String>(
      'device_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firstSeenMeta =
      const VerificationMeta('firstSeen');
  @override
  late final GeneratedColumn<DateTime> firstSeen = GeneratedColumn<DateTime>(
      'first_seen', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _lastSeenMeta =
      const VerificationMeta('lastSeen');
  @override
  late final GeneratedColumn<DateTime> lastSeen = GeneratedColumn<DateTime>(
      'last_seen', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isTrustedMeta =
      const VerificationMeta('isTrusted');
  @override
  late final GeneratedColumn<bool> isTrusted = GeneratedColumn<bool>(
      'is_trusted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_trusted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _riskScoreMeta =
      const VerificationMeta('riskScore');
  @override
  late final GeneratedColumn<int> riskScore = GeneratedColumn<int>(
      'risk_score', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ipAddress,
        macAddress,
        hostname,
        vendor,
        deviceType,
        firstSeen,
        lastSeen,
        isTrusted,
        riskScore
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(Insertable<DeviceEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('ip_address')) {
      context.handle(_ipAddressMeta,
          ipAddress.isAcceptableOrUnknown(data['ip_address']!, _ipAddressMeta));
    } else if (isInserting) {
      context.missing(_ipAddressMeta);
    }
    if (data.containsKey('mac_address')) {
      context.handle(
          _macAddressMeta,
          macAddress.isAcceptableOrUnknown(
              data['mac_address']!, _macAddressMeta));
    } else if (isInserting) {
      context.missing(_macAddressMeta);
    }
    if (data.containsKey('hostname')) {
      context.handle(_hostnameMeta,
          hostname.isAcceptableOrUnknown(data['hostname']!, _hostnameMeta));
    }
    if (data.containsKey('vendor')) {
      context.handle(_vendorMeta,
          vendor.isAcceptableOrUnknown(data['vendor']!, _vendorMeta));
    }
    if (data.containsKey('device_type')) {
      context.handle(
          _deviceTypeMeta,
          deviceType.isAcceptableOrUnknown(
              data['device_type']!, _deviceTypeMeta));
    }
    if (data.containsKey('first_seen')) {
      context.handle(_firstSeenMeta,
          firstSeen.isAcceptableOrUnknown(data['first_seen']!, _firstSeenMeta));
    } else if (isInserting) {
      context.missing(_firstSeenMeta);
    }
    if (data.containsKey('last_seen')) {
      context.handle(_lastSeenMeta,
          lastSeen.isAcceptableOrUnknown(data['last_seen']!, _lastSeenMeta));
    } else if (isInserting) {
      context.missing(_lastSeenMeta);
    }
    if (data.containsKey('is_trusted')) {
      context.handle(_isTrustedMeta,
          isTrusted.isAcceptableOrUnknown(data['is_trusted']!, _isTrustedMeta));
    }
    if (data.containsKey('risk_score')) {
      context.handle(_riskScoreMeta,
          riskScore.isAcceptableOrUnknown(data['risk_score']!, _riskScoreMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeviceEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      ipAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ip_address'])!,
      macAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mac_address'])!,
      hostname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hostname']),
      vendor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vendor']),
      deviceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_type']),
      firstSeen: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}first_seen'])!,
      lastSeen: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_seen'])!,
      isTrusted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_trusted'])!,
      riskScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}risk_score'])!,
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class DeviceEntry extends DataClass implements Insertable<DeviceEntry> {
  final String id;
  final String ipAddress;
  final String macAddress;
  final String? hostname;
  final String? vendor;
  final String? deviceType;
  final DateTime firstSeen;
  final DateTime lastSeen;
  final bool isTrusted;
  final int riskScore;
  const DeviceEntry(
      {required this.id,
      required this.ipAddress,
      required this.macAddress,
      this.hostname,
      this.vendor,
      this.deviceType,
      required this.firstSeen,
      required this.lastSeen,
      required this.isTrusted,
      required this.riskScore});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['ip_address'] = Variable<String>(ipAddress);
    map['mac_address'] = Variable<String>(macAddress);
    if (!nullToAbsent || hostname != null) {
      map['hostname'] = Variable<String>(hostname);
    }
    if (!nullToAbsent || vendor != null) {
      map['vendor'] = Variable<String>(vendor);
    }
    if (!nullToAbsent || deviceType != null) {
      map['device_type'] = Variable<String>(deviceType);
    }
    map['first_seen'] = Variable<DateTime>(firstSeen);
    map['last_seen'] = Variable<DateTime>(lastSeen);
    map['is_trusted'] = Variable<bool>(isTrusted);
    map['risk_score'] = Variable<int>(riskScore);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      ipAddress: Value(ipAddress),
      macAddress: Value(macAddress),
      hostname: hostname == null && nullToAbsent
          ? const Value.absent()
          : Value(hostname),
      vendor:
          vendor == null && nullToAbsent ? const Value.absent() : Value(vendor),
      deviceType: deviceType == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceType),
      firstSeen: Value(firstSeen),
      lastSeen: Value(lastSeen),
      isTrusted: Value(isTrusted),
      riskScore: Value(riskScore),
    );
  }

  factory DeviceEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceEntry(
      id: serializer.fromJson<String>(json['id']),
      ipAddress: serializer.fromJson<String>(json['ipAddress']),
      macAddress: serializer.fromJson<String>(json['macAddress']),
      hostname: serializer.fromJson<String?>(json['hostname']),
      vendor: serializer.fromJson<String?>(json['vendor']),
      deviceType: serializer.fromJson<String?>(json['deviceType']),
      firstSeen: serializer.fromJson<DateTime>(json['firstSeen']),
      lastSeen: serializer.fromJson<DateTime>(json['lastSeen']),
      isTrusted: serializer.fromJson<bool>(json['isTrusted']),
      riskScore: serializer.fromJson<int>(json['riskScore']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ipAddress': serializer.toJson<String>(ipAddress),
      'macAddress': serializer.toJson<String>(macAddress),
      'hostname': serializer.toJson<String?>(hostname),
      'vendor': serializer.toJson<String?>(vendor),
      'deviceType': serializer.toJson<String?>(deviceType),
      'firstSeen': serializer.toJson<DateTime>(firstSeen),
      'lastSeen': serializer.toJson<DateTime>(lastSeen),
      'isTrusted': serializer.toJson<bool>(isTrusted),
      'riskScore': serializer.toJson<int>(riskScore),
    };
  }

  DeviceEntry copyWith(
          {String? id,
          String? ipAddress,
          String? macAddress,
          Value<String?> hostname = const Value.absent(),
          Value<String?> vendor = const Value.absent(),
          Value<String?> deviceType = const Value.absent(),
          DateTime? firstSeen,
          DateTime? lastSeen,
          bool? isTrusted,
          int? riskScore}) =>
      DeviceEntry(
        id: id ?? this.id,
        ipAddress: ipAddress ?? this.ipAddress,
        macAddress: macAddress ?? this.macAddress,
        hostname: hostname.present ? hostname.value : this.hostname,
        vendor: vendor.present ? vendor.value : this.vendor,
        deviceType: deviceType.present ? deviceType.value : this.deviceType,
        firstSeen: firstSeen ?? this.firstSeen,
        lastSeen: lastSeen ?? this.lastSeen,
        isTrusted: isTrusted ?? this.isTrusted,
        riskScore: riskScore ?? this.riskScore,
      );
  DeviceEntry copyWithCompanion(DevicesCompanion data) {
    return DeviceEntry(
      id: data.id.present ? data.id.value : this.id,
      ipAddress: data.ipAddress.present ? data.ipAddress.value : this.ipAddress,
      macAddress:
          data.macAddress.present ? data.macAddress.value : this.macAddress,
      hostname: data.hostname.present ? data.hostname.value : this.hostname,
      vendor: data.vendor.present ? data.vendor.value : this.vendor,
      deviceType:
          data.deviceType.present ? data.deviceType.value : this.deviceType,
      firstSeen: data.firstSeen.present ? data.firstSeen.value : this.firstSeen,
      lastSeen: data.lastSeen.present ? data.lastSeen.value : this.lastSeen,
      isTrusted: data.isTrusted.present ? data.isTrusted.value : this.isTrusted,
      riskScore: data.riskScore.present ? data.riskScore.value : this.riskScore,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceEntry(')
          ..write('id: $id, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('macAddress: $macAddress, ')
          ..write('hostname: $hostname, ')
          ..write('vendor: $vendor, ')
          ..write('deviceType: $deviceType, ')
          ..write('firstSeen: $firstSeen, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('isTrusted: $isTrusted, ')
          ..write('riskScore: $riskScore')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ipAddress, macAddress, hostname, vendor,
      deviceType, firstSeen, lastSeen, isTrusted, riskScore);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceEntry &&
          other.id == this.id &&
          other.ipAddress == this.ipAddress &&
          other.macAddress == this.macAddress &&
          other.hostname == this.hostname &&
          other.vendor == this.vendor &&
          other.deviceType == this.deviceType &&
          other.firstSeen == this.firstSeen &&
          other.lastSeen == this.lastSeen &&
          other.isTrusted == this.isTrusted &&
          other.riskScore == this.riskScore);
}

class DevicesCompanion extends UpdateCompanion<DeviceEntry> {
  final Value<String> id;
  final Value<String> ipAddress;
  final Value<String> macAddress;
  final Value<String?> hostname;
  final Value<String?> vendor;
  final Value<String?> deviceType;
  final Value<DateTime> firstSeen;
  final Value<DateTime> lastSeen;
  final Value<bool> isTrusted;
  final Value<int> riskScore;
  final Value<int> rowid;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.ipAddress = const Value.absent(),
    this.macAddress = const Value.absent(),
    this.hostname = const Value.absent(),
    this.vendor = const Value.absent(),
    this.deviceType = const Value.absent(),
    this.firstSeen = const Value.absent(),
    this.lastSeen = const Value.absent(),
    this.isTrusted = const Value.absent(),
    this.riskScore = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DevicesCompanion.insert({
    required String id,
    required String ipAddress,
    required String macAddress,
    this.hostname = const Value.absent(),
    this.vendor = const Value.absent(),
    this.deviceType = const Value.absent(),
    required DateTime firstSeen,
    required DateTime lastSeen,
    this.isTrusted = const Value.absent(),
    this.riskScore = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        ipAddress = Value(ipAddress),
        macAddress = Value(macAddress),
        firstSeen = Value(firstSeen),
        lastSeen = Value(lastSeen);
  static Insertable<DeviceEntry> custom({
    Expression<String>? id,
    Expression<String>? ipAddress,
    Expression<String>? macAddress,
    Expression<String>? hostname,
    Expression<String>? vendor,
    Expression<String>? deviceType,
    Expression<DateTime>? firstSeen,
    Expression<DateTime>? lastSeen,
    Expression<bool>? isTrusted,
    Expression<int>? riskScore,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ipAddress != null) 'ip_address': ipAddress,
      if (macAddress != null) 'mac_address': macAddress,
      if (hostname != null) 'hostname': hostname,
      if (vendor != null) 'vendor': vendor,
      if (deviceType != null) 'device_type': deviceType,
      if (firstSeen != null) 'first_seen': firstSeen,
      if (lastSeen != null) 'last_seen': lastSeen,
      if (isTrusted != null) 'is_trusted': isTrusted,
      if (riskScore != null) 'risk_score': riskScore,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DevicesCompanion copyWith(
      {Value<String>? id,
      Value<String>? ipAddress,
      Value<String>? macAddress,
      Value<String?>? hostname,
      Value<String?>? vendor,
      Value<String?>? deviceType,
      Value<DateTime>? firstSeen,
      Value<DateTime>? lastSeen,
      Value<bool>? isTrusted,
      Value<int>? riskScore,
      Value<int>? rowid}) {
    return DevicesCompanion(
      id: id ?? this.id,
      ipAddress: ipAddress ?? this.ipAddress,
      macAddress: macAddress ?? this.macAddress,
      hostname: hostname ?? this.hostname,
      vendor: vendor ?? this.vendor,
      deviceType: deviceType ?? this.deviceType,
      firstSeen: firstSeen ?? this.firstSeen,
      lastSeen: lastSeen ?? this.lastSeen,
      isTrusted: isTrusted ?? this.isTrusted,
      riskScore: riskScore ?? this.riskScore,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ipAddress.present) {
      map['ip_address'] = Variable<String>(ipAddress.value);
    }
    if (macAddress.present) {
      map['mac_address'] = Variable<String>(macAddress.value);
    }
    if (hostname.present) {
      map['hostname'] = Variable<String>(hostname.value);
    }
    if (vendor.present) {
      map['vendor'] = Variable<String>(vendor.value);
    }
    if (deviceType.present) {
      map['device_type'] = Variable<String>(deviceType.value);
    }
    if (firstSeen.present) {
      map['first_seen'] = Variable<DateTime>(firstSeen.value);
    }
    if (lastSeen.present) {
      map['last_seen'] = Variable<DateTime>(lastSeen.value);
    }
    if (isTrusted.present) {
      map['is_trusted'] = Variable<bool>(isTrusted.value);
    }
    if (riskScore.present) {
      map['risk_score'] = Variable<int>(riskScore.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('ipAddress: $ipAddress, ')
          ..write('macAddress: $macAddress, ')
          ..write('hostname: $hostname, ')
          ..write('vendor: $vendor, ')
          ..write('deviceType: $deviceType, ')
          ..write('firstSeen: $firstSeen, ')
          ..write('lastSeen: $lastSeen, ')
          ..write('isTrusted: $isTrusted, ')
          ..write('riskScore: $riskScore, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NetworksTable extends Networks
    with TableInfo<$NetworksTable, NetworkEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NetworksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ssidMeta = const VerificationMeta('ssid');
  @override
  late final GeneratedColumn<String> ssid = GeneratedColumn<String>(
      'ssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bssidMeta = const VerificationMeta('bssid');
  @override
  late final GeneratedColumn<String> bssid = GeneratedColumn<String>(
      'bssid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gatewayIpMeta =
      const VerificationMeta('gatewayIp');
  @override
  late final GeneratedColumn<String> gatewayIp = GeneratedColumn<String>(
      'gateway_ip', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _routerVendorMeta =
      const VerificationMeta('routerVendor');
  @override
  late final GeneratedColumn<String> routerVendor = GeneratedColumn<String>(
      'router_vendor', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _securityTypeMeta =
      const VerificationMeta('securityType');
  @override
  late final GeneratedColumn<String> securityType = GeneratedColumn<String>(
      'security_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ssid, bssid, gatewayIp, routerVendor, securityType, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'networks';
  @override
  VerificationContext validateIntegrity(Insertable<NetworkEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('ssid')) {
      context.handle(
          _ssidMeta, ssid.isAcceptableOrUnknown(data['ssid']!, _ssidMeta));
    } else if (isInserting) {
      context.missing(_ssidMeta);
    }
    if (data.containsKey('bssid')) {
      context.handle(
          _bssidMeta, bssid.isAcceptableOrUnknown(data['bssid']!, _bssidMeta));
    } else if (isInserting) {
      context.missing(_bssidMeta);
    }
    if (data.containsKey('gateway_ip')) {
      context.handle(_gatewayIpMeta,
          gatewayIp.isAcceptableOrUnknown(data['gateway_ip']!, _gatewayIpMeta));
    } else if (isInserting) {
      context.missing(_gatewayIpMeta);
    }
    if (data.containsKey('router_vendor')) {
      context.handle(
          _routerVendorMeta,
          routerVendor.isAcceptableOrUnknown(
              data['router_vendor']!, _routerVendorMeta));
    }
    if (data.containsKey('security_type')) {
      context.handle(
          _securityTypeMeta,
          securityType.isAcceptableOrUnknown(
              data['security_type']!, _securityTypeMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NetworkEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NetworkEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      ssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ssid'])!,
      bssid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bssid'])!,
      gatewayIp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gateway_ip'])!,
      routerVendor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}router_vendor']),
      securityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}security_type']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NetworksTable createAlias(String alias) {
    return $NetworksTable(attachedDatabase, alias);
  }
}

class NetworkEntry extends DataClass implements Insertable<NetworkEntry> {
  final String id;
  final String ssid;
  final String bssid;
  final String gatewayIp;
  final String? routerVendor;
  final String? securityType;
  final DateTime createdAt;
  const NetworkEntry(
      {required this.id,
      required this.ssid,
      required this.bssid,
      required this.gatewayIp,
      this.routerVendor,
      this.securityType,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['ssid'] = Variable<String>(ssid);
    map['bssid'] = Variable<String>(bssid);
    map['gateway_ip'] = Variable<String>(gatewayIp);
    if (!nullToAbsent || routerVendor != null) {
      map['router_vendor'] = Variable<String>(routerVendor);
    }
    if (!nullToAbsent || securityType != null) {
      map['security_type'] = Variable<String>(securityType);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NetworksCompanion toCompanion(bool nullToAbsent) {
    return NetworksCompanion(
      id: Value(id),
      ssid: Value(ssid),
      bssid: Value(bssid),
      gatewayIp: Value(gatewayIp),
      routerVendor: routerVendor == null && nullToAbsent
          ? const Value.absent()
          : Value(routerVendor),
      securityType: securityType == null && nullToAbsent
          ? const Value.absent()
          : Value(securityType),
      createdAt: Value(createdAt),
    );
  }

  factory NetworkEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NetworkEntry(
      id: serializer.fromJson<String>(json['id']),
      ssid: serializer.fromJson<String>(json['ssid']),
      bssid: serializer.fromJson<String>(json['bssid']),
      gatewayIp: serializer.fromJson<String>(json['gatewayIp']),
      routerVendor: serializer.fromJson<String?>(json['routerVendor']),
      securityType: serializer.fromJson<String?>(json['securityType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ssid': serializer.toJson<String>(ssid),
      'bssid': serializer.toJson<String>(bssid),
      'gatewayIp': serializer.toJson<String>(gatewayIp),
      'routerVendor': serializer.toJson<String?>(routerVendor),
      'securityType': serializer.toJson<String?>(securityType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  NetworkEntry copyWith(
          {String? id,
          String? ssid,
          String? bssid,
          String? gatewayIp,
          Value<String?> routerVendor = const Value.absent(),
          Value<String?> securityType = const Value.absent(),
          DateTime? createdAt}) =>
      NetworkEntry(
        id: id ?? this.id,
        ssid: ssid ?? this.ssid,
        bssid: bssid ?? this.bssid,
        gatewayIp: gatewayIp ?? this.gatewayIp,
        routerVendor:
            routerVendor.present ? routerVendor.value : this.routerVendor,
        securityType:
            securityType.present ? securityType.value : this.securityType,
        createdAt: createdAt ?? this.createdAt,
      );
  NetworkEntry copyWithCompanion(NetworksCompanion data) {
    return NetworkEntry(
      id: data.id.present ? data.id.value : this.id,
      ssid: data.ssid.present ? data.ssid.value : this.ssid,
      bssid: data.bssid.present ? data.bssid.value : this.bssid,
      gatewayIp: data.gatewayIp.present ? data.gatewayIp.value : this.gatewayIp,
      routerVendor: data.routerVendor.present
          ? data.routerVendor.value
          : this.routerVendor,
      securityType: data.securityType.present
          ? data.securityType.value
          : this.securityType,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NetworkEntry(')
          ..write('id: $id, ')
          ..write('ssid: $ssid, ')
          ..write('bssid: $bssid, ')
          ..write('gatewayIp: $gatewayIp, ')
          ..write('routerVendor: $routerVendor, ')
          ..write('securityType: $securityType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, ssid, bssid, gatewayIp, routerVendor, securityType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NetworkEntry &&
          other.id == this.id &&
          other.ssid == this.ssid &&
          other.bssid == this.bssid &&
          other.gatewayIp == this.gatewayIp &&
          other.routerVendor == this.routerVendor &&
          other.securityType == this.securityType &&
          other.createdAt == this.createdAt);
}

class NetworksCompanion extends UpdateCompanion<NetworkEntry> {
  final Value<String> id;
  final Value<String> ssid;
  final Value<String> bssid;
  final Value<String> gatewayIp;
  final Value<String?> routerVendor;
  final Value<String?> securityType;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const NetworksCompanion({
    this.id = const Value.absent(),
    this.ssid = const Value.absent(),
    this.bssid = const Value.absent(),
    this.gatewayIp = const Value.absent(),
    this.routerVendor = const Value.absent(),
    this.securityType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NetworksCompanion.insert({
    required String id,
    required String ssid,
    required String bssid,
    required String gatewayIp,
    this.routerVendor = const Value.absent(),
    this.securityType = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        ssid = Value(ssid),
        bssid = Value(bssid),
        gatewayIp = Value(gatewayIp),
        createdAt = Value(createdAt);
  static Insertable<NetworkEntry> custom({
    Expression<String>? id,
    Expression<String>? ssid,
    Expression<String>? bssid,
    Expression<String>? gatewayIp,
    Expression<String>? routerVendor,
    Expression<String>? securityType,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ssid != null) 'ssid': ssid,
      if (bssid != null) 'bssid': bssid,
      if (gatewayIp != null) 'gateway_ip': gatewayIp,
      if (routerVendor != null) 'router_vendor': routerVendor,
      if (securityType != null) 'security_type': securityType,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NetworksCompanion copyWith(
      {Value<String>? id,
      Value<String>? ssid,
      Value<String>? bssid,
      Value<String>? gatewayIp,
      Value<String?>? routerVendor,
      Value<String?>? securityType,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return NetworksCompanion(
      id: id ?? this.id,
      ssid: ssid ?? this.ssid,
      bssid: bssid ?? this.bssid,
      gatewayIp: gatewayIp ?? this.gatewayIp,
      routerVendor: routerVendor ?? this.routerVendor,
      securityType: securityType ?? this.securityType,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ssid.present) {
      map['ssid'] = Variable<String>(ssid.value);
    }
    if (bssid.present) {
      map['bssid'] = Variable<String>(bssid.value);
    }
    if (gatewayIp.present) {
      map['gateway_ip'] = Variable<String>(gatewayIp.value);
    }
    if (routerVendor.present) {
      map['router_vendor'] = Variable<String>(routerVendor.value);
    }
    if (securityType.present) {
      map['security_type'] = Variable<String>(securityType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NetworksCompanion(')
          ..write('id: $id, ')
          ..write('ssid: $ssid, ')
          ..write('bssid: $bssid, ')
          ..write('gatewayIp: $gatewayIp, ')
          ..write('routerVendor: $routerVendor, ')
          ..write('securityType: $securityType, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpeedTestsTable extends SpeedTests
    with TableInfo<$SpeedTestsTable, SpeedTestEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpeedTestsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _downloadSpeedMeta =
      const VerificationMeta('downloadSpeed');
  @override
  late final GeneratedColumn<double> downloadSpeed = GeneratedColumn<double>(
      'download_speed', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _uploadSpeedMeta =
      const VerificationMeta('uploadSpeed');
  @override
  late final GeneratedColumn<double> uploadSpeed = GeneratedColumn<double>(
      'upload_speed', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _pingMeta = const VerificationMeta('ping');
  @override
  late final GeneratedColumn<double> ping = GeneratedColumn<double>(
      'ping', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _jitterMeta = const VerificationMeta('jitter');
  @override
  late final GeneratedColumn<double> jitter = GeneratedColumn<double>(
      'jitter', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, downloadSpeed, uploadSpeed, ping, jitter, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'speed_tests';
  @override
  VerificationContext validateIntegrity(Insertable<SpeedTestEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('download_speed')) {
      context.handle(
          _downloadSpeedMeta,
          downloadSpeed.isAcceptableOrUnknown(
              data['download_speed']!, _downloadSpeedMeta));
    } else if (isInserting) {
      context.missing(_downloadSpeedMeta);
    }
    if (data.containsKey('upload_speed')) {
      context.handle(
          _uploadSpeedMeta,
          uploadSpeed.isAcceptableOrUnknown(
              data['upload_speed']!, _uploadSpeedMeta));
    } else if (isInserting) {
      context.missing(_uploadSpeedMeta);
    }
    if (data.containsKey('ping')) {
      context.handle(
          _pingMeta, ping.isAcceptableOrUnknown(data['ping']!, _pingMeta));
    } else if (isInserting) {
      context.missing(_pingMeta);
    }
    if (data.containsKey('jitter')) {
      context.handle(_jitterMeta,
          jitter.isAcceptableOrUnknown(data['jitter']!, _jitterMeta));
    } else if (isInserting) {
      context.missing(_jitterMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpeedTestEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpeedTestEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      downloadSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}download_speed'])!,
      uploadSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}upload_speed'])!,
      ping: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}ping'])!,
      jitter: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}jitter'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $SpeedTestsTable createAlias(String alias) {
    return $SpeedTestsTable(attachedDatabase, alias);
  }
}

class SpeedTestEntry extends DataClass implements Insertable<SpeedTestEntry> {
  final String id;
  final double downloadSpeed;
  final double uploadSpeed;
  final double ping;
  final double jitter;
  final DateTime timestamp;
  const SpeedTestEntry(
      {required this.id,
      required this.downloadSpeed,
      required this.uploadSpeed,
      required this.ping,
      required this.jitter,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['download_speed'] = Variable<double>(downloadSpeed);
    map['upload_speed'] = Variable<double>(uploadSpeed);
    map['ping'] = Variable<double>(ping);
    map['jitter'] = Variable<double>(jitter);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  SpeedTestsCompanion toCompanion(bool nullToAbsent) {
    return SpeedTestsCompanion(
      id: Value(id),
      downloadSpeed: Value(downloadSpeed),
      uploadSpeed: Value(uploadSpeed),
      ping: Value(ping),
      jitter: Value(jitter),
      timestamp: Value(timestamp),
    );
  }

  factory SpeedTestEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpeedTestEntry(
      id: serializer.fromJson<String>(json['id']),
      downloadSpeed: serializer.fromJson<double>(json['downloadSpeed']),
      uploadSpeed: serializer.fromJson<double>(json['uploadSpeed']),
      ping: serializer.fromJson<double>(json['ping']),
      jitter: serializer.fromJson<double>(json['jitter']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'downloadSpeed': serializer.toJson<double>(downloadSpeed),
      'uploadSpeed': serializer.toJson<double>(uploadSpeed),
      'ping': serializer.toJson<double>(ping),
      'jitter': serializer.toJson<double>(jitter),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  SpeedTestEntry copyWith(
          {String? id,
          double? downloadSpeed,
          double? uploadSpeed,
          double? ping,
          double? jitter,
          DateTime? timestamp}) =>
      SpeedTestEntry(
        id: id ?? this.id,
        downloadSpeed: downloadSpeed ?? this.downloadSpeed,
        uploadSpeed: uploadSpeed ?? this.uploadSpeed,
        ping: ping ?? this.ping,
        jitter: jitter ?? this.jitter,
        timestamp: timestamp ?? this.timestamp,
      );
  SpeedTestEntry copyWithCompanion(SpeedTestsCompanion data) {
    return SpeedTestEntry(
      id: data.id.present ? data.id.value : this.id,
      downloadSpeed: data.downloadSpeed.present
          ? data.downloadSpeed.value
          : this.downloadSpeed,
      uploadSpeed:
          data.uploadSpeed.present ? data.uploadSpeed.value : this.uploadSpeed,
      ping: data.ping.present ? data.ping.value : this.ping,
      jitter: data.jitter.present ? data.jitter.value : this.jitter,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpeedTestEntry(')
          ..write('id: $id, ')
          ..write('downloadSpeed: $downloadSpeed, ')
          ..write('uploadSpeed: $uploadSpeed, ')
          ..write('ping: $ping, ')
          ..write('jitter: $jitter, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, downloadSpeed, uploadSpeed, ping, jitter, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpeedTestEntry &&
          other.id == this.id &&
          other.downloadSpeed == this.downloadSpeed &&
          other.uploadSpeed == this.uploadSpeed &&
          other.ping == this.ping &&
          other.jitter == this.jitter &&
          other.timestamp == this.timestamp);
}

class SpeedTestsCompanion extends UpdateCompanion<SpeedTestEntry> {
  final Value<String> id;
  final Value<double> downloadSpeed;
  final Value<double> uploadSpeed;
  final Value<double> ping;
  final Value<double> jitter;
  final Value<DateTime> timestamp;
  final Value<int> rowid;
  const SpeedTestsCompanion({
    this.id = const Value.absent(),
    this.downloadSpeed = const Value.absent(),
    this.uploadSpeed = const Value.absent(),
    this.ping = const Value.absent(),
    this.jitter = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpeedTestsCompanion.insert({
    required String id,
    required double downloadSpeed,
    required double uploadSpeed,
    required double ping,
    required double jitter,
    required DateTime timestamp,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        downloadSpeed = Value(downloadSpeed),
        uploadSpeed = Value(uploadSpeed),
        ping = Value(ping),
        jitter = Value(jitter),
        timestamp = Value(timestamp);
  static Insertable<SpeedTestEntry> custom({
    Expression<String>? id,
    Expression<double>? downloadSpeed,
    Expression<double>? uploadSpeed,
    Expression<double>? ping,
    Expression<double>? jitter,
    Expression<DateTime>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (downloadSpeed != null) 'download_speed': downloadSpeed,
      if (uploadSpeed != null) 'upload_speed': uploadSpeed,
      if (ping != null) 'ping': ping,
      if (jitter != null) 'jitter': jitter,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpeedTestsCompanion copyWith(
      {Value<String>? id,
      Value<double>? downloadSpeed,
      Value<double>? uploadSpeed,
      Value<double>? ping,
      Value<double>? jitter,
      Value<DateTime>? timestamp,
      Value<int>? rowid}) {
    return SpeedTestsCompanion(
      id: id ?? this.id,
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      ping: ping ?? this.ping,
      jitter: jitter ?? this.jitter,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (downloadSpeed.present) {
      map['download_speed'] = Variable<double>(downloadSpeed.value);
    }
    if (uploadSpeed.present) {
      map['upload_speed'] = Variable<double>(uploadSpeed.value);
    }
    if (ping.present) {
      map['ping'] = Variable<double>(ping.value);
    }
    if (jitter.present) {
      map['jitter'] = Variable<double>(jitter.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpeedTestsCompanion(')
          ..write('id: $id, ')
          ..write('downloadSpeed: $downloadSpeed, ')
          ..write('uploadSpeed: $uploadSpeed, ')
          ..write('ping: $ping, ')
          ..write('jitter: $jitter, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsageAnalyticsTable extends UsageAnalytics
    with TableInfo<$UsageAnalyticsTable, UsageAnalyticsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsageAnalyticsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _uploadBytesMeta =
      const VerificationMeta('uploadBytes');
  @override
  late final GeneratedColumn<int> uploadBytes = GeneratedColumn<int>(
      'upload_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _downloadBytesMeta =
      const VerificationMeta('downloadBytes');
  @override
  late final GeneratedColumn<int> downloadBytes = GeneratedColumn<int>(
      'download_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _recordedAtMeta =
      const VerificationMeta('recordedAt');
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
      'recorded_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, deviceId, uploadBytes, downloadBytes, recordedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usage_analytics';
  @override
  VerificationContext validateIntegrity(
      Insertable<UsageAnalyticsEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('upload_bytes')) {
      context.handle(
          _uploadBytesMeta,
          uploadBytes.isAcceptableOrUnknown(
              data['upload_bytes']!, _uploadBytesMeta));
    } else if (isInserting) {
      context.missing(_uploadBytesMeta);
    }
    if (data.containsKey('download_bytes')) {
      context.handle(
          _downloadBytesMeta,
          downloadBytes.isAcceptableOrUnknown(
              data['download_bytes']!, _downloadBytesMeta));
    } else if (isInserting) {
      context.missing(_downloadBytesMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
          _recordedAtMeta,
          recordedAt.isAcceptableOrUnknown(
              data['recorded_at']!, _recordedAtMeta));
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsageAnalyticsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsageAnalyticsEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      uploadBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}upload_bytes'])!,
      downloadBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}download_bytes'])!,
      recordedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}recorded_at'])!,
    );
  }

  @override
  $UsageAnalyticsTable createAlias(String alias) {
    return $UsageAnalyticsTable(attachedDatabase, alias);
  }
}

class UsageAnalyticsEntry extends DataClass
    implements Insertable<UsageAnalyticsEntry> {
  final String id;
  final String deviceId;
  final int uploadBytes;
  final int downloadBytes;
  final DateTime recordedAt;
  const UsageAnalyticsEntry(
      {required this.id,
      required this.deviceId,
      required this.uploadBytes,
      required this.downloadBytes,
      required this.recordedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['device_id'] = Variable<String>(deviceId);
    map['upload_bytes'] = Variable<int>(uploadBytes);
    map['download_bytes'] = Variable<int>(downloadBytes);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  UsageAnalyticsCompanion toCompanion(bool nullToAbsent) {
    return UsageAnalyticsCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      uploadBytes: Value(uploadBytes),
      downloadBytes: Value(downloadBytes),
      recordedAt: Value(recordedAt),
    );
  }

  factory UsageAnalyticsEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsageAnalyticsEntry(
      id: serializer.fromJson<String>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      uploadBytes: serializer.fromJson<int>(json['uploadBytes']),
      downloadBytes: serializer.fromJson<int>(json['downloadBytes']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'uploadBytes': serializer.toJson<int>(uploadBytes),
      'downloadBytes': serializer.toJson<int>(downloadBytes),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  UsageAnalyticsEntry copyWith(
          {String? id,
          String? deviceId,
          int? uploadBytes,
          int? downloadBytes,
          DateTime? recordedAt}) =>
      UsageAnalyticsEntry(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        uploadBytes: uploadBytes ?? this.uploadBytes,
        downloadBytes: downloadBytes ?? this.downloadBytes,
        recordedAt: recordedAt ?? this.recordedAt,
      );
  UsageAnalyticsEntry copyWithCompanion(UsageAnalyticsCompanion data) {
    return UsageAnalyticsEntry(
      id: data.id.present ? data.id.value : this.id,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      uploadBytes:
          data.uploadBytes.present ? data.uploadBytes.value : this.uploadBytes,
      downloadBytes: data.downloadBytes.present
          ? data.downloadBytes.value
          : this.downloadBytes,
      recordedAt:
          data.recordedAt.present ? data.recordedAt.value : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsageAnalyticsEntry(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('uploadBytes: $uploadBytes, ')
          ..write('downloadBytes: $downloadBytes, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, deviceId, uploadBytes, downloadBytes, recordedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsageAnalyticsEntry &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.uploadBytes == this.uploadBytes &&
          other.downloadBytes == this.downloadBytes &&
          other.recordedAt == this.recordedAt);
}

class UsageAnalyticsCompanion extends UpdateCompanion<UsageAnalyticsEntry> {
  final Value<String> id;
  final Value<String> deviceId;
  final Value<int> uploadBytes;
  final Value<int> downloadBytes;
  final Value<DateTime> recordedAt;
  final Value<int> rowid;
  const UsageAnalyticsCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.uploadBytes = const Value.absent(),
    this.downloadBytes = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsageAnalyticsCompanion.insert({
    required String id,
    required String deviceId,
    required int uploadBytes,
    required int downloadBytes,
    required DateTime recordedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        deviceId = Value(deviceId),
        uploadBytes = Value(uploadBytes),
        downloadBytes = Value(downloadBytes),
        recordedAt = Value(recordedAt);
  static Insertable<UsageAnalyticsEntry> custom({
    Expression<String>? id,
    Expression<String>? deviceId,
    Expression<int>? uploadBytes,
    Expression<int>? downloadBytes,
    Expression<DateTime>? recordedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (uploadBytes != null) 'upload_bytes': uploadBytes,
      if (downloadBytes != null) 'download_bytes': downloadBytes,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsageAnalyticsCompanion copyWith(
      {Value<String>? id,
      Value<String>? deviceId,
      Value<int>? uploadBytes,
      Value<int>? downloadBytes,
      Value<DateTime>? recordedAt,
      Value<int>? rowid}) {
    return UsageAnalyticsCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      uploadBytes: uploadBytes ?? this.uploadBytes,
      downloadBytes: downloadBytes ?? this.downloadBytes,
      recordedAt: recordedAt ?? this.recordedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (uploadBytes.present) {
      map['upload_bytes'] = Variable<int>(uploadBytes.value);
    }
    if (downloadBytes.present) {
      map['download_bytes'] = Variable<int>(downloadBytes.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsageAnalyticsCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('uploadBytes: $uploadBytes, ')
          ..write('downloadBytes: $downloadBytes, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SecurityEventsTable extends SecurityEvents
    with TableInfo<$SecurityEventsTable, SecurityEventEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SecurityEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eventTypeMeta =
      const VerificationMeta('eventType');
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
      'event_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
      'severity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, eventType, severity, description, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'security_events';
  @override
  VerificationContext validateIntegrity(Insertable<SecurityEventEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(_eventTypeMeta,
          eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta));
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(_severityMeta,
          severity.isAcceptableOrUnknown(data['severity']!, _severityMeta));
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SecurityEventEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SecurityEventEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      eventType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}event_type'])!,
      severity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}severity'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $SecurityEventsTable createAlias(String alias) {
    return $SecurityEventsTable(attachedDatabase, alias);
  }
}

class SecurityEventEntry extends DataClass
    implements Insertable<SecurityEventEntry> {
  final String id;
  final String eventType;
  final String severity;
  final String description;
  final DateTime timestamp;
  const SecurityEventEntry(
      {required this.id,
      required this.eventType,
      required this.severity,
      required this.description,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['event_type'] = Variable<String>(eventType);
    map['severity'] = Variable<String>(severity);
    map['description'] = Variable<String>(description);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  SecurityEventsCompanion toCompanion(bool nullToAbsent) {
    return SecurityEventsCompanion(
      id: Value(id),
      eventType: Value(eventType),
      severity: Value(severity),
      description: Value(description),
      timestamp: Value(timestamp),
    );
  }

  factory SecurityEventEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SecurityEventEntry(
      id: serializer.fromJson<String>(json['id']),
      eventType: serializer.fromJson<String>(json['eventType']),
      severity: serializer.fromJson<String>(json['severity']),
      description: serializer.fromJson<String>(json['description']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'eventType': serializer.toJson<String>(eventType),
      'severity': serializer.toJson<String>(severity),
      'description': serializer.toJson<String>(description),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  SecurityEventEntry copyWith(
          {String? id,
          String? eventType,
          String? severity,
          String? description,
          DateTime? timestamp}) =>
      SecurityEventEntry(
        id: id ?? this.id,
        eventType: eventType ?? this.eventType,
        severity: severity ?? this.severity,
        description: description ?? this.description,
        timestamp: timestamp ?? this.timestamp,
      );
  SecurityEventEntry copyWithCompanion(SecurityEventsCompanion data) {
    return SecurityEventEntry(
      id: data.id.present ? data.id.value : this.id,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      severity: data.severity.present ? data.severity.value : this.severity,
      description:
          data.description.present ? data.description.value : this.description,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SecurityEventEntry(')
          ..write('id: $id, ')
          ..write('eventType: $eventType, ')
          ..write('severity: $severity, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, eventType, severity, description, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SecurityEventEntry &&
          other.id == this.id &&
          other.eventType == this.eventType &&
          other.severity == this.severity &&
          other.description == this.description &&
          other.timestamp == this.timestamp);
}

class SecurityEventsCompanion extends UpdateCompanion<SecurityEventEntry> {
  final Value<String> id;
  final Value<String> eventType;
  final Value<String> severity;
  final Value<String> description;
  final Value<DateTime> timestamp;
  final Value<int> rowid;
  const SecurityEventsCompanion({
    this.id = const Value.absent(),
    this.eventType = const Value.absent(),
    this.severity = const Value.absent(),
    this.description = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SecurityEventsCompanion.insert({
    required String id,
    required String eventType,
    required String severity,
    required String description,
    required DateTime timestamp,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        eventType = Value(eventType),
        severity = Value(severity),
        description = Value(description),
        timestamp = Value(timestamp);
  static Insertable<SecurityEventEntry> custom({
    Expression<String>? id,
    Expression<String>? eventType,
    Expression<String>? severity,
    Expression<String>? description,
    Expression<DateTime>? timestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (eventType != null) 'event_type': eventType,
      if (severity != null) 'severity': severity,
      if (description != null) 'description': description,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SecurityEventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? eventType,
      Value<String>? severity,
      Value<String>? description,
      Value<DateTime>? timestamp,
      Value<int>? rowid}) {
    return SecurityEventsCompanion(
      id: id ?? this.id,
      eventType: eventType ?? this.eventType,
      severity: severity ?? this.severity,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SecurityEventsCompanion(')
          ..write('id: $id, ')
          ..write('eventType: $eventType, ')
          ..write('severity: $severity, ')
          ..write('description: $description, ')
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $NetworksTable networks = $NetworksTable(this);
  late final $SpeedTestsTable speedTests = $SpeedTestsTable(this);
  late final $UsageAnalyticsTable usageAnalytics = $UsageAnalyticsTable(this);
  late final $SecurityEventsTable securityEvents = $SecurityEventsTable(this);
  late final DeviceDao deviceDao = DeviceDao(this as AppDatabase);
  late final NetworkDao networkDao = NetworkDao(this as AppDatabase);
  late final SpeedTestDao speedTestDao = SpeedTestDao(this as AppDatabase);
  late final UsageAnalyticsDao usageAnalyticsDao =
      UsageAnalyticsDao(this as AppDatabase);
  late final SecurityEventDao securityEventDao =
      SecurityEventDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [devices, networks, speedTests, usageAnalytics, securityEvents];
}

typedef $$DevicesTableCreateCompanionBuilder = DevicesCompanion Function({
  required String id,
  required String ipAddress,
  required String macAddress,
  Value<String?> hostname,
  Value<String?> vendor,
  Value<String?> deviceType,
  required DateTime firstSeen,
  required DateTime lastSeen,
  Value<bool> isTrusted,
  Value<int> riskScore,
  Value<int> rowid,
});
typedef $$DevicesTableUpdateCompanionBuilder = DevicesCompanion Function({
  Value<String> id,
  Value<String> ipAddress,
  Value<String> macAddress,
  Value<String?> hostname,
  Value<String?> vendor,
  Value<String?> deviceType,
  Value<DateTime> firstSeen,
  Value<DateTime> lastSeen,
  Value<bool> isTrusted,
  Value<int> riskScore,
  Value<int> rowid,
});

class $$DevicesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DevicesTable,
    DeviceEntry,
    $$DevicesTableFilterComposer,
    $$DevicesTableOrderingComposer,
    $$DevicesTableCreateCompanionBuilder,
    $$DevicesTableUpdateCompanionBuilder> {
  $$DevicesTableTableManager(_$AppDatabase db, $DevicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DevicesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DevicesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> ipAddress = const Value.absent(),
            Value<String> macAddress = const Value.absent(),
            Value<String?> hostname = const Value.absent(),
            Value<String?> vendor = const Value.absent(),
            Value<String?> deviceType = const Value.absent(),
            Value<DateTime> firstSeen = const Value.absent(),
            Value<DateTime> lastSeen = const Value.absent(),
            Value<bool> isTrusted = const Value.absent(),
            Value<int> riskScore = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DevicesCompanion(
            id: id,
            ipAddress: ipAddress,
            macAddress: macAddress,
            hostname: hostname,
            vendor: vendor,
            deviceType: deviceType,
            firstSeen: firstSeen,
            lastSeen: lastSeen,
            isTrusted: isTrusted,
            riskScore: riskScore,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String ipAddress,
            required String macAddress,
            Value<String?> hostname = const Value.absent(),
            Value<String?> vendor = const Value.absent(),
            Value<String?> deviceType = const Value.absent(),
            required DateTime firstSeen,
            required DateTime lastSeen,
            Value<bool> isTrusted = const Value.absent(),
            Value<int> riskScore = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DevicesCompanion.insert(
            id: id,
            ipAddress: ipAddress,
            macAddress: macAddress,
            hostname: hostname,
            vendor: vendor,
            deviceType: deviceType,
            firstSeen: firstSeen,
            lastSeen: lastSeen,
            isTrusted: isTrusted,
            riskScore: riskScore,
            rowid: rowid,
          ),
        ));
}

class $$DevicesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ipAddress => $state.composableBuilder(
      column: $state.table.ipAddress,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get macAddress => $state.composableBuilder(
      column: $state.table.macAddress,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hostname => $state.composableBuilder(
      column: $state.table.hostname,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get vendor => $state.composableBuilder(
      column: $state.table.vendor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get deviceType => $state.composableBuilder(
      column: $state.table.deviceType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get firstSeen => $state.composableBuilder(
      column: $state.table.firstSeen,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastSeen => $state.composableBuilder(
      column: $state.table.lastSeen,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isTrusted => $state.composableBuilder(
      column: $state.table.isTrusted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get riskScore => $state.composableBuilder(
      column: $state.table.riskScore,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DevicesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ipAddress => $state.composableBuilder(
      column: $state.table.ipAddress,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get macAddress => $state.composableBuilder(
      column: $state.table.macAddress,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hostname => $state.composableBuilder(
      column: $state.table.hostname,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get vendor => $state.composableBuilder(
      column: $state.table.vendor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get deviceType => $state.composableBuilder(
      column: $state.table.deviceType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get firstSeen => $state.composableBuilder(
      column: $state.table.firstSeen,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastSeen => $state.composableBuilder(
      column: $state.table.lastSeen,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isTrusted => $state.composableBuilder(
      column: $state.table.isTrusted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get riskScore => $state.composableBuilder(
      column: $state.table.riskScore,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$NetworksTableCreateCompanionBuilder = NetworksCompanion Function({
  required String id,
  required String ssid,
  required String bssid,
  required String gatewayIp,
  Value<String?> routerVendor,
  Value<String?> securityType,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$NetworksTableUpdateCompanionBuilder = NetworksCompanion Function({
  Value<String> id,
  Value<String> ssid,
  Value<String> bssid,
  Value<String> gatewayIp,
  Value<String?> routerVendor,
  Value<String?> securityType,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$NetworksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NetworksTable,
    NetworkEntry,
    $$NetworksTableFilterComposer,
    $$NetworksTableOrderingComposer,
    $$NetworksTableCreateCompanionBuilder,
    $$NetworksTableUpdateCompanionBuilder> {
  $$NetworksTableTableManager(_$AppDatabase db, $NetworksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NetworksTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NetworksTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> ssid = const Value.absent(),
            Value<String> bssid = const Value.absent(),
            Value<String> gatewayIp = const Value.absent(),
            Value<String?> routerVendor = const Value.absent(),
            Value<String?> securityType = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NetworksCompanion(
            id: id,
            ssid: ssid,
            bssid: bssid,
            gatewayIp: gatewayIp,
            routerVendor: routerVendor,
            securityType: securityType,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String ssid,
            required String bssid,
            required String gatewayIp,
            Value<String?> routerVendor = const Value.absent(),
            Value<String?> securityType = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              NetworksCompanion.insert(
            id: id,
            ssid: ssid,
            bssid: bssid,
            gatewayIp: gatewayIp,
            routerVendor: routerVendor,
            securityType: securityType,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$NetworksTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NetworksTable> {
  $$NetworksTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ssid => $state.composableBuilder(
      column: $state.table.ssid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get bssid => $state.composableBuilder(
      column: $state.table.bssid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get gatewayIp => $state.composableBuilder(
      column: $state.table.gatewayIp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get routerVendor => $state.composableBuilder(
      column: $state.table.routerVendor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get securityType => $state.composableBuilder(
      column: $state.table.securityType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NetworksTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NetworksTable> {
  $$NetworksTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ssid => $state.composableBuilder(
      column: $state.table.ssid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get bssid => $state.composableBuilder(
      column: $state.table.bssid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get gatewayIp => $state.composableBuilder(
      column: $state.table.gatewayIp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get routerVendor => $state.composableBuilder(
      column: $state.table.routerVendor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get securityType => $state.composableBuilder(
      column: $state.table.securityType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SpeedTestsTableCreateCompanionBuilder = SpeedTestsCompanion Function({
  required String id,
  required double downloadSpeed,
  required double uploadSpeed,
  required double ping,
  required double jitter,
  required DateTime timestamp,
  Value<int> rowid,
});
typedef $$SpeedTestsTableUpdateCompanionBuilder = SpeedTestsCompanion Function({
  Value<String> id,
  Value<double> downloadSpeed,
  Value<double> uploadSpeed,
  Value<double> ping,
  Value<double> jitter,
  Value<DateTime> timestamp,
  Value<int> rowid,
});

class $$SpeedTestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SpeedTestsTable,
    SpeedTestEntry,
    $$SpeedTestsTableFilterComposer,
    $$SpeedTestsTableOrderingComposer,
    $$SpeedTestsTableCreateCompanionBuilder,
    $$SpeedTestsTableUpdateCompanionBuilder> {
  $$SpeedTestsTableTableManager(_$AppDatabase db, $SpeedTestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SpeedTestsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SpeedTestsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<double> downloadSpeed = const Value.absent(),
            Value<double> uploadSpeed = const Value.absent(),
            Value<double> ping = const Value.absent(),
            Value<double> jitter = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SpeedTestsCompanion(
            id: id,
            downloadSpeed: downloadSpeed,
            uploadSpeed: uploadSpeed,
            ping: ping,
            jitter: jitter,
            timestamp: timestamp,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required double downloadSpeed,
            required double uploadSpeed,
            required double ping,
            required double jitter,
            required DateTime timestamp,
            Value<int> rowid = const Value.absent(),
          }) =>
              SpeedTestsCompanion.insert(
            id: id,
            downloadSpeed: downloadSpeed,
            uploadSpeed: uploadSpeed,
            ping: ping,
            jitter: jitter,
            timestamp: timestamp,
            rowid: rowid,
          ),
        ));
}

class $$SpeedTestsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SpeedTestsTable> {
  $$SpeedTestsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get downloadSpeed => $state.composableBuilder(
      column: $state.table.downloadSpeed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get uploadSpeed => $state.composableBuilder(
      column: $state.table.uploadSpeed,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get ping => $state.composableBuilder(
      column: $state.table.ping,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get jitter => $state.composableBuilder(
      column: $state.table.jitter,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SpeedTestsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SpeedTestsTable> {
  $$SpeedTestsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get downloadSpeed => $state.composableBuilder(
      column: $state.table.downloadSpeed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get uploadSpeed => $state.composableBuilder(
      column: $state.table.uploadSpeed,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get ping => $state.composableBuilder(
      column: $state.table.ping,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get jitter => $state.composableBuilder(
      column: $state.table.jitter,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UsageAnalyticsTableCreateCompanionBuilder = UsageAnalyticsCompanion
    Function({
  required String id,
  required String deviceId,
  required int uploadBytes,
  required int downloadBytes,
  required DateTime recordedAt,
  Value<int> rowid,
});
typedef $$UsageAnalyticsTableUpdateCompanionBuilder = UsageAnalyticsCompanion
    Function({
  Value<String> id,
  Value<String> deviceId,
  Value<int> uploadBytes,
  Value<int> downloadBytes,
  Value<DateTime> recordedAt,
  Value<int> rowid,
});

class $$UsageAnalyticsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsageAnalyticsTable,
    UsageAnalyticsEntry,
    $$UsageAnalyticsTableFilterComposer,
    $$UsageAnalyticsTableOrderingComposer,
    $$UsageAnalyticsTableCreateCompanionBuilder,
    $$UsageAnalyticsTableUpdateCompanionBuilder> {
  $$UsageAnalyticsTableTableManager(
      _$AppDatabase db, $UsageAnalyticsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsageAnalyticsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsageAnalyticsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> deviceId = const Value.absent(),
            Value<int> uploadBytes = const Value.absent(),
            Value<int> downloadBytes = const Value.absent(),
            Value<DateTime> recordedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsageAnalyticsCompanion(
            id: id,
            deviceId: deviceId,
            uploadBytes: uploadBytes,
            downloadBytes: downloadBytes,
            recordedAt: recordedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String deviceId,
            required int uploadBytes,
            required int downloadBytes,
            required DateTime recordedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsageAnalyticsCompanion.insert(
            id: id,
            deviceId: deviceId,
            uploadBytes: uploadBytes,
            downloadBytes: downloadBytes,
            recordedAt: recordedAt,
            rowid: rowid,
          ),
        ));
}

class $$UsageAnalyticsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsageAnalyticsTable> {
  $$UsageAnalyticsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get deviceId => $state.composableBuilder(
      column: $state.table.deviceId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get uploadBytes => $state.composableBuilder(
      column: $state.table.uploadBytes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get downloadBytes => $state.composableBuilder(
      column: $state.table.downloadBytes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get recordedAt => $state.composableBuilder(
      column: $state.table.recordedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UsageAnalyticsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsageAnalyticsTable> {
  $$UsageAnalyticsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get deviceId => $state.composableBuilder(
      column: $state.table.deviceId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get uploadBytes => $state.composableBuilder(
      column: $state.table.uploadBytes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get downloadBytes => $state.composableBuilder(
      column: $state.table.downloadBytes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get recordedAt => $state.composableBuilder(
      column: $state.table.recordedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$SecurityEventsTableCreateCompanionBuilder = SecurityEventsCompanion
    Function({
  required String id,
  required String eventType,
  required String severity,
  required String description,
  required DateTime timestamp,
  Value<int> rowid,
});
typedef $$SecurityEventsTableUpdateCompanionBuilder = SecurityEventsCompanion
    Function({
  Value<String> id,
  Value<String> eventType,
  Value<String> severity,
  Value<String> description,
  Value<DateTime> timestamp,
  Value<int> rowid,
});

class $$SecurityEventsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SecurityEventsTable,
    SecurityEventEntry,
    $$SecurityEventsTableFilterComposer,
    $$SecurityEventsTableOrderingComposer,
    $$SecurityEventsTableCreateCompanionBuilder,
    $$SecurityEventsTableUpdateCompanionBuilder> {
  $$SecurityEventsTableTableManager(
      _$AppDatabase db, $SecurityEventsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SecurityEventsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SecurityEventsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> eventType = const Value.absent(),
            Value<String> severity = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SecurityEventsCompanion(
            id: id,
            eventType: eventType,
            severity: severity,
            description: description,
            timestamp: timestamp,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String eventType,
            required String severity,
            required String description,
            required DateTime timestamp,
            Value<int> rowid = const Value.absent(),
          }) =>
              SecurityEventsCompanion.insert(
            id: id,
            eventType: eventType,
            severity: severity,
            description: description,
            timestamp: timestamp,
            rowid: rowid,
          ),
        ));
}

class $$SecurityEventsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SecurityEventsTable> {
  $$SecurityEventsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get eventType => $state.composableBuilder(
      column: $state.table.eventType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get severity => $state.composableBuilder(
      column: $state.table.severity,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SecurityEventsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SecurityEventsTable> {
  $$SecurityEventsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get eventType => $state.composableBuilder(
      column: $state.table.eventType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get severity => $state.composableBuilder(
      column: $state.table.severity,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get timestamp => $state.composableBuilder(
      column: $state.table.timestamp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$NetworksTableTableManager get networks =>
      $$NetworksTableTableManager(_db, _db.networks);
  $$SpeedTestsTableTableManager get speedTests =>
      $$SpeedTestsTableTableManager(_db, _db.speedTests);
  $$UsageAnalyticsTableTableManager get usageAnalytics =>
      $$UsageAnalyticsTableTableManager(_db, _db.usageAnalytics);
  $$SecurityEventsTableTableManager get securityEvents =>
      $$SecurityEventsTableTableManager(_db, _db.securityEvents);
}
