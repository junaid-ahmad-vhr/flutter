import 'dart:io';

class AdHelper {

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4893816751129838/5742022165';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4893816751129838/5742022165';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4893816751129838/7486348671';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4893816751129838/7486348671';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4893816751129838/8965600235';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-4893816751129838/8965600235';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}