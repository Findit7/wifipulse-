class ClassificationEngine {
  static const List<String> validTypes = [
    'Phone', 'Laptop', 'Desktop', 'Tablet', 'Smart TV', 
    'Streaming Device', 'Gaming Console', 'Printer', 
    'Camera', 'Smart Speaker', 'IoT Device', 'Unknown'
  ];

  Future<String> classify({String? vendor, String? osGuess, String? hostname}) async {
    final combinedString = '${vendor ?? ''} ${osGuess ?? ''} ${hostname ?? ''}'.toLowerCase();

    if (combinedString.contains('iphone') || combinedString.contains('galaxy')) return 'Phone';
    if (combinedString.contains('macbook') || combinedString.contains('windows')) return 'Laptop';
    if (combinedString.contains('ipad')) return 'Tablet';
    if (combinedString.contains('tv') || combinedString.contains('roku') || combinedString.contains('chromecast')) return 'Streaming Device';
    if (combinedString.contains('playstation') || combinedString.contains('xbox') || combinedString.contains('nintendo')) return 'Gaming Console';
    if (combinedString.contains('printer') || combinedString.contains('hp') || combinedString.contains('canon')) return 'Printer';
    if (combinedString.contains('camera') || combinedString.contains('wyze') || combinedString.contains('nest')) return 'Camera';
    if (combinedString.contains('echo') || combinedString.contains('sonos')) return 'Smart Speaker';
    if (combinedString.contains('hue') || combinedString.contains('smart') || combinedString.contains('iot')) return 'IoT Device';
    
    return 'Unknown';
  }
}
