class RouterCapabilities {
  final bool canListDevices;
  final bool canBlockDevices;
  final bool canUnblockDevices;
  final bool canMonitorUsage;
  final bool canManageGuestNetwork;

  const RouterCapabilities({
    this.canListDevices = false,
    this.canBlockDevices = false,
    this.canUnblockDevices = false,
    this.canMonitorUsage = false,
    this.canManageGuestNetwork = false,
  });

  factory RouterCapabilities.generic() {
    return const RouterCapabilities();
  }

  factory RouterCapabilities.full() {
    return const RouterCapabilities(
      canListDevices: true,
      canBlockDevices: true,
      canUnblockDevices: true,
      canMonitorUsage: true,
      canManageGuestNetwork: true,
    );
  }
}
