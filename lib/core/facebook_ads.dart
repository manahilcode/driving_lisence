// import 'package:flutter/material.dart';
//
// import 'facebook_Ads_repo.dart';
//
// class FacebookAdsProvider with ChangeNotifier {
//   final FacebookAdsRepo _adsRepo = FacebookAdsRepo();
//   bool _isLoading = false;
//   String? _error;
//
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//   bool get isRewardedAdLoaded => _adsRepo.isRewardedAdLoaded;
//
//   Future<void> initializeAds() async {
//     _isLoading = true;
//     notifyListeners();
//
//     try {
//       await _adsRepo.initialize();
//       _error = null;
//     } catch (e) {
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   Widget showBannerAd() {
//     return _adsRepo.nativeBannerAd();
//   }
//
//   Widget showNativeBannerAd() {
//     return _adsRepo.nativeAd();
//   }
//
//   Future<void> loadRewardedAd() async {
//     _isLoading = true;
//     notifyListeners();
//
//     try {
//       await _adsRepo.loadRewardedAd();
//       _error = null;
//     } catch (e) {
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   Future<bool> showRewardedAd() async {
//     try {
//       return await _adsRepo.showRewardedAd();
//     } catch (e) {
//       _error = e.toString();
//       notifyListeners();
//       return false;
//     }
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';

//class ///FacebookAdsProvider with ChangeNotifier {
// AppAdIds? _admobAdIds;
// AppAdIds? _unityAdIds;
// AppAdIds? _appLovinAdIds;
// AppAdIds? _fbAdIds;
// final IAdIdManager _adIdManager = TestAdIdManager();
//
//
// FacebookAdsProvider() {
//   EasyAds.instance.initialize(
//     _adIdManager,
//     adMobAdRequest: const AdRequest(),
//     // To enable Facebook Test mode ads
//     fbTestMode: true,
//     admobConfiguration: RequestConfiguration(testDeviceIds: [
//       '072D2F3992EF5B4493042ADC632CE39F', // Mi Phone
//       '00008030-00163022226A802E',
//     ]),
//   );
// }
//
//
// @override
// AppAdIds? get admobAdIds {
//   _admobAdIds ??= AppAdIds(
//       appId: Platform.isAndroid
//           ? 'ca-app-pub-3940256099942544~3347511713'
//           : 'ca-app-pub-3940256099942544~1458002511',
//       appOpenId: Platform.isAndroid
//           ? 'ca-app-pub-3940256099942544/3419835294'
//           : 'ca-app-pub-3940256099942544/5662855259',
//       bannerId: 'ca-app-pub-3940256099942544/6300978111',
//       interstitialId: 'ca-app-pub-3940256099942544/1033173712',
//       rewardedId: 'ca-app-pub-3940256099942544/5224354917',
//     );
//   return _admobAdIds;
// }
//
// @override
// AppAdIds? get unityAdIds {
//   _unityAdIds ??= AppAdIds(
//       appId: Platform.isAndroid ? '4374881' : '4374880',
//       bannerId: Platform.isAndroid ? 'Banner_Android' : 'Banner_iOS',
//       interstitialId:
//       Platform.isAndroid ? 'Interstitial_Android' : 'Interstitial_iOS',
//       rewardedId: Platform.isAndroid ? 'Rewarded_Android' : 'Rewarded_iOS',
//     );
//   return _unityAdIds;
// }
//
// @override
// AppAdIds? get appLovinAdIds {
//   _appLovinAdIds ??= AppAdIds(
//       appId:
//       'OeKTS4Zl758OIlAs3KQ6-3WE1IkdOo3nQNJtRubTzlyFU76TRWeQZAeaSMCr9GcZdxR4p2cnoZ1Gg7p7eSXCdA',
//       bannerId: Platform.isAndroid ? 'b2c4f43d3986bcfb' : '80c269494c0e45c2',
//       interstitialId:
//       Platform.isAndroid ? 'c48f54c6ce5ff297' : 'e33147110a6d12d2',
//       rewardedId:
//       Platform.isAndroid ? 'ffbed216d19efb09' : 'f4af3e10dd48ee4f',
//     );
//   return _appLovinAdIds;
// }
//
// @override
// AppAdIds? get fbAdIds {
//   _fbAdIds ??= AppAdIds(
//       appId: 'YOUR_APP_ID',
//       interstitialId: 'VID_HD_16_9_15S_LINK#YOUR_PLACEMENT_ID',
//       bannerId: 'IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID',
//       rewardedId: 'VID_HD_16_9_46S_APP_INSTALL#YOUR_PLACEMENT_ID',
//     );
//   return _fbAdIds;
// }
//}
import 'package:audience_network/audience_network.dart';

class FacebookAdsProvider extends ChangeNotifier {
  bool _isInterstitialAdLoaded = false;
  bool _isRewardedAdLoaded = false;
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  Widget _currentAd = const SizedBox(width: 0.0, height: 0.0);

  FacebookAdsProvider() {
// Initialize the Audience Network in test mode.
    AudienceNetwork.init(testMode: true).then((_) {
      _loadInterstitialAd();
      _loadRewardedVideoAd();
    });
  }

  Widget get currentAd => _currentAd;
  bool get isInterstitialAdLoaded => _isInterstitialAdLoaded;
  bool get isRewardedAdLoaded => _isRewardedAdLoaded;

  void _loadInterstitialAd() {
    final interstitialAd = InterstitialAd(InterstitialAd.testPlacementId);
    interstitialAd.listener = InterstitialAdListener(
      onLoaded: () {
        _isInterstitialAdLoaded = true;
        print('interstitial ad loaded');
        notifyListeners();
      },
      onError: (code, message) {
        print('interstitial ad error\ncode = $code\nmessage = $message');
      },
      onDismissed: () {
// When the ad is dismissed, destroy it and load a new one.
        interstitialAd.destroy();
        _isInterstitialAdLoaded = false;
        _loadInterstitialAd();
        notifyListeners();
      },
    );
    interstitialAd.load();
    _interstitialAd = interstitialAd;
  }

  void _loadRewardedVideoAd() {
    final rewardedAd = RewardedAd(RewardedAd.testPlacementId);
    rewardedAd.listener = RewardedAdListener(
      onLoaded: () {
        _isRewardedAdLoaded = true;
        print('rewarded ad loaded');
        notifyListeners();
      },
      onError: (code, message) {
        print('rewarded ad error\ncode = $code\nmessage = $message');
      },
      onVideoClosed: () {
// When the video is closed, destroy it and load a new one.
        rewardedAd.destroy();
        _isRewardedAdLoaded = false;
        _loadRewardedVideoAd();
        notifyListeners();
      },
    );
    rewardedAd.load();
    _rewardedAd = rewardedAd;
  }

  void showInterstitialAd() {
    if (_interstitialAd != null && _isInterstitialAdLoaded) {
      _interstitialAd!.show();
    } else {
      print("Interstitial Ad not yet loaded!");
    }
  }

  void showRewardedAd() {
    if (_rewardedAd != null && _isRewardedAdLoaded) {
      _rewardedAd!.show();
    } else {
      print("Rewarded Ad not yet loaded!");
    }
  }

  void showBannerAd() {
    _currentAd = BannerAd(
      placementId: BannerAd.testPlacementId,
      bannerSize: BannerSize.STANDARD,
      listener: BannerAdListener(
        onError: (code, message) =>
            print('banner ad error\ncode: $code\nmessage: $message'),
        onLoaded: () => print('banner ad loaded'),
      ),
    );
    notifyListeners();
  }

  void showNativeBannerAd() {
    _currentAd = NativeAd(
      placementId: NativeAd.testPlacementId,
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: NativeAdListener(
        onError: (code, message) =>
            print('native banner ad error\ncode: $code\nmessage: $message'),
        onLoaded: () => print('native banner ad loaded'),
        onMediaDownloaded: () => print('native banner ad media downloaded'),
      ),
    );
    notifyListeners();
  }

  void showNativeAd() {
    _currentAd = NativeAd(
      placementId: NativeAd.testPlacementId,
      adType: NativeAdType.NATIVE_AD_VERTICAL,
      width: double.infinity,
      height: 300,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: NativeAdListener(
        onError: (code, message) =>
            print('native ad error\ncode: $code\nmessage: $message'),
        onLoaded: () => print('native ad loaded'),
        onMediaDownloaded: () => print('native ad media downloaded'),
      ),
      keepExpandedWhileLoading: true,
      expandAnimationDuraion: 1000,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _interstitialAd?.destroy();
    _rewardedAd?.destroy();
    super.dispose();
  }
}
