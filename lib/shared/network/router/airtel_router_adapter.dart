import 'package:fpdart/fpdart.dart';
import '../../errors/failure.dart';
import '../../utils/result.dart';
import '../../../database/tables/devices.dart';
import 'router_adapter.dart';

/// Implementation for Airtel routers.
class AirtelRouterAdapter extends RouterAdapter {
  AirtelRouterAdapter(super.gatewayIp);

  @override
  Future<Result<bool>> login(String username, String password) async {
    // TODO: Implement actual login logic
    return const Left(RouterFailure('Not implemented'));
  }

  @override
  Future<Result<List<DeviceEntry>>> getConnectedDevices() async {
    // TODO: Implement device extraction logic
    return const Left(RouterFailure('Not implemented'));
  }
}
