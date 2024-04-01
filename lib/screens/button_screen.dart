import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:previouslife/screens/add_data_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../design_elements/app_colors.dart';
import '../design_elements/my_gradient_button.dart';
import '../helpers/responsive.dart';
import '../design_elements/globals.dart' as globals;

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});
  @override
  createState() => ButtonScreenState();
}

class ButtonScreenState extends State<ButtonScreen> {
  InterstitialAd? _interstitialAd;
  bool showAd = false;
  @override
  initState() {
    //loadAd();
    super.initState();
  }

  void loadAd() {
    InterstitialAd.load(
        adUnitId: globals.adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            EasyLoading.dismiss(animation: true);
            _interstitialAd = ad;
            if (showAd) {
              _interstitialAd!.show();
            }
            ad.fullScreenContentCallback =
                FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AddDataScreen()),
              );
            });
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
            EasyLoading.dismiss(animation: true);
            EasyLoading.showToast('Unable to load ad');
          },
        ));
  }

  showFullScreenVideoAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
    } else {
      showAd = true;
      EasyLoading.show(
          status:
              globals.language == 'English' ? 'Loading Ad...' : '광고 로드 중...');
      loadAd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        Responsive.totalWidth = constraints.maxWidth;
        Responsive.totalHeight = constraints.maxHeight;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: Responsive.height(3, context)),
              child: Center(
                child: MyGradientButton(
                    globals.language == 'English'
                        ? 'My Past Life Experience'
                        : '나의 전생 체험',
                    AppColors.colorPrimary,
                    Colors.white,
                    75.0,
                    6.0, () {
                  showFullScreenVideoAd();
                }),
              ),
            ),
          ],
        );
      }),
    );
  }
}
