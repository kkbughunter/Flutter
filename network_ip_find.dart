Future<void> getLocalIpInMobileData() async {
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4) {
            setState(() {
              localIp = addr.address;
            });
            return;
          }
        }
      }
    } catch (e) {
      setState(() {
        localIp = "Error: $e";
      });
    }
  }
  Future<void> getLocalIp() async {
    try {
      for (var interface in await NetworkInterface.list()) {
        if (interface.name.contains("wlan") || interface.name.contains("eth")) {
          // Wi-Fi or Ethernet
          for (var addr in interface.addresses) {
            if (addr.type == InternetAddressType.IPv4) {
              setState(() {
                localIp = addr.address;
              });
              return; // Exit after finding the correct IP
            }
          }
        }
      }
    } catch (e) {
      setState(() {
        localIp = "Error: $e";
      });
    }
  }
