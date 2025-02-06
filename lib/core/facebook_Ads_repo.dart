import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:easy_audience_network/easy_audience_network.dart';

class FacebookAdsRepo {
  RewardedAd? _rewardedAd;
  bool _isRewardedAdLoaded = false;
  final Completer<bool> _adLoadCompleter = Completer<bool>();
  bool _isInterstitialAdLoaded = false;
  InterstitialAd? _interstitialAd;

  Future<void> initialize() async {
    await EasyAudienceNetwork.init(
      testingId: "a6bd515b-aaa4-a3c-a213-10ca1ad1abe1", // Remove in production
      testMode: true, // Set to false in production
    ).then((_) {
      debugPrint("ads initialized");
      loadRewardedAd();
    });
  }

  Future<void> loadRewardedAd() async {
    if (_isRewardedAdLoaded) return;

    final rewardedAd = RewardedAd(RewardedAd.testPlacementId);
    rewardedAd.listener = RewardedAdListener(
      onLoaded: () {
        _isRewardedAdLoaded = true;
        _rewardedAd = rewardedAd;
        if (!_adLoadCompleter.isCompleted) {
          _adLoadCompleter.complete(true);
        }
        print('Rewarded ad loaded successfully');
      },
      onError: (code, message) {
        print('Rewarded ad error\ncode = $code\nmessage = $message');
        if (!_adLoadCompleter.isCompleted) {
          _adLoadCompleter.complete(false);
        }
      },
      onVideoClosed: () {
        _rewardedAd?.destroy();
        _rewardedAd = null;
        _isRewardedAdLoaded = false;
        loadRewardedAd(); // Preload next ad
      },
    );

    try {
      await rewardedAd.load();
    } catch (e) {
      print('Error loading rewarded ad: $e');
      if (!_adLoadCompleter.isCompleted) {
        _adLoadCompleter.complete(false);
      }
    }
  }

  Widget nativeAd() {
    return NativeAd(
      placementId: NativeAd.testPlacementId,
      adType: NativeAdType.NATIVE_AD,
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
            print('native ad error\ncode: $code\nmessage:$message'),
        onLoaded: () => print('native ad loaded'),
        onMediaDownloaded: () => 'native ad media downloaded',
      ),
      keepExpandedWhileLoading: true,
      expandAnimationDuraion: 1000,
    );
  }

  Widget nativeBannerAd() {
    return NativeAd(
      placementId: NativeAd.testPlacementId,
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_120,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: NativeAdListener(
        onError: (code, message) =>
            print('native banner ad error\ncode: $code\nmessage:$message'),
        onLoaded: () => print('native banner ad loaded'),
        onMediaDownloaded: () => 'native banner ad media downloaded',
      ),
    );
  }

  Future<bool> showRewardedAd() async {
    if (!_isRewardedAdLoaded) {
      try {
        final bool loaded = await _adLoadCompleter.future
            .timeout(const Duration(seconds: 10));
        if (!loaded) return false;
      } catch (e) {
        print('Timeout waiting for ad to load');
        return false;
      }
    }

    final rewardedAd = _rewardedAd;
    if (rewardedAd != null && _isRewardedAdLoaded) {
      try {
        rewardedAd.show();
        return true;
      } catch (e) {
        print('Error showing rewarded ad: $e');
        return false;
      }
    }
    return false;
  }

  bool get isRewardedAdLoaded => _isRewardedAdLoaded;
}