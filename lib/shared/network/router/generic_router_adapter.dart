import 'package:fpdart/fpdart.dart';
import '../../errors/failure.dart';
import '../../utils/result.dart';
import '../../../database/tables/devices.dart';
import 'router_adapter.dart';

/// Generic implementation for unknown or standard routers.
class GenericRouterAdapter extends RouterAdapter {
  GenericRouterAdapter(super.gatewayIp);

  @override
  Future<Result<bool>> login(String username, String password) async {
    // TODO: Implement generic login logic (e.g., standard HTTP basic auth or form login)
    return const Left(RouterFailure('Not implemented'));
  }

  @override
  Future<Result<List<DeviceEntry>>> getConnectedDevices() async {
    // TODO: Implement generic device extraction logic
    return const Left(RouterFailure('Not implemented'));
  }
}
