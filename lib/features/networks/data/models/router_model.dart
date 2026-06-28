import 'dart:convert';
import '../../domain/entities/router_entity.dart';

class RouterModel extends RouterEntity {
  const RouterModel({
    required super.id,
    required super.networkId,
    required super.vendor,
    super.model,
    required super.gatewayIp,
    required super.adminUsername,
    required super.adminPassword,
    super.capabilities,
  });

  factory RouterModel.fromMap(Map<String, dynamic> map) {
    return RouterModel(
      id: map['id'] as String,
      networkId: map['network_id'] as String,
      vendor: map['vendor'] as String,
      model: map['model'] as String?,
      gatewayIp: map['gateway_ip'] as String,
      adminUsername: map['admin_username'] as String,
      adminPassword: map['admin_password'] as String,
      capabilities: map['capabilities'] != null 
          ? jsonDecode(map['capabilities'] as String) 
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'network_id': networkId,
      'vendor': vendor,
      'model': model,
      'gateway_ip': gatewayIp,
      'admin_username': adminUsername,
      'admin_password': adminPassword,
      'capabilities': capabilities != null ? jsonEncode(capabilities) : null,
    };
  }

  factory RouterModel.fromEntity(RouterEntity entity) {
    return RouterModel(
      id: entity.id,
      networkId: entity.networkId,
      vendor: entity.vendor,
      model: entity.model,
      gatewayIp: entity.gatewayIp,
      adminUsername: entity.adminUsername,
      adminPassword: entity.adminPassword,
      capabilities: entity.capabilities,
    );
  }
}
