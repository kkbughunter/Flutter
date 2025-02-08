To get specific IPs based on connection type (Wi-Fi, hotspot, or mobile data), you need to filter network interfaces properly. Here’s how you can achieve it in Flutter/Dart:

1. Get Wi-Fi IP (WLAN)

Future<String?> getWifiIp() async {
  for (var interface in await NetworkInterface.list()) {
    if (interface.name.contains("wlan")) { // WLAN for Wi-Fi
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          return addr.address;
        }
      }
    }
  }
  return null; // No Wi-Fi IP found
}

2. Get Hotspot IP (Tethered Interface)

Hotspot interfaces vary by device, but common names are "ap" or "wlan1".

Future<String?> getHotspotIp() async {
  for (var interface in await NetworkInterface.list()) {
    if (interface.name.contains("ap") || interface.name.contains("wlan1")) { // "ap" is common for hotspot
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          return addr.address;
        }
      }
    }
  }
  return null; // No Hotspot IP found
}

3. Get Mobile Data IP (Cellular)

Mobile data interfaces often use "rmnet" or "ccmni" in Android.

Future<String?> getMobileDataIp() async {
  for (var interface in await NetworkInterface.list()) {
    if (interface.name.contains("rmnet") || interface.name.contains("ccmni") || interface.name.contains("usb")) { 
      for (var addr in interface.addresses) {
        if (addr.type == InternetAddressType.IPv4) {
          return addr.address;
        }
      }
    }
  }
  return null; // No Mobile Data IP found
}

Usage Example

void main() async {
  String? wifiIp = await getWifiIp();
  String? hotspotIp = await getHotspotIp();
  String? mobileIp = await getMobileDataIp();

  print("Wi-Fi IP: $wifiIp");
  print("Hotspot IP: $hotspotIp");
  print("Mobile Data IP: $mobileIp");
}

Note:

These interface names ("wlan", "ap", "rmnet", etc.) may vary by device and OS version.

On iOS, getting mobile data IP may not work due to restrictions.

You can print NetworkInterface.list() to check available interfaces on your device.


