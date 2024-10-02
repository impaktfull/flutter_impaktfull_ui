import 'device_util.dart'
    if (dart.library.html) 'device_util_web.dart'
    if (dart.library.io) 'device_util_io.dart' as platform;

bool isMobileWeb() => platform.isMobileWeb();
bool isApple() => platform.isApple();
