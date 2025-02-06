import 'package:flutter/material.dart';

import 'facebook_Ads_repo.dart';

class FacebookAdsProvider with ChangeNotifier {
  final FacebookAdsRepo _adsRepo = FacebookAdsRepo();
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isRewardedAdLoaded => _adsRepo.isRewardedAdLoaded;

  Future<void> initializeAds() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _adsRepo.initialize();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Widget showBannerAd() {
    return _adsRepo.nativeBannerAd();
  }

  Widget showNativeBannerAd() {
    return _adsRepo.nativeAd();
  }

  Future<void> loadRewardedAd() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _adsRepo.loadRewardedAd();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> showRewardedAd() async {
    try {
      return await _adsRepo.showRewardedAd();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }
}