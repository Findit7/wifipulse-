class VendorLookupService {
  static const Map<String, String> _commonMacPrefixes = {
    '00:1A:11': 'Google',
    'FC:FC:48': 'Apple',
    'CC:3D:82': 'Samsung',
    'B8:27:EB': 'Raspberry Pi Foundation',
  };

  Future<String?> lookupVendor(String macAddress) async {
    final prefix = macAddress.toUpperCase().replaceAll(':', '').substring(0, 6);
    // In production, this hits an OUI mapping DB
    return _commonMacPrefixes[prefix] ?? 'Generic Manufacturer';
  }
}
