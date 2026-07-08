import 'package:fpdart/fpdart.dart';
import '../../errors/failure.dart';
import '../../utils/result.dart';
import '../../../database/tables/devices.dart';

/// Defines the contract for communicating with specific router models.
abstract class RouterAdapter {
  /// The gateway IP address of the router.
  final String gatewayIp;

  RouterAdapter(this.gatewayIp);

  /// Authenticates with the router's admin panel.
  Future<Result<bool>> login(String username, String password);

  /// Retrieves the list of connected devices directly from the router's DHCP/client table.
  Future<Result<List<DeviceEntry>>> getConnectedDevices();
}
