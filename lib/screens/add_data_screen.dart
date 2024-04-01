import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:previouslife/screens/animal_picture_screen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../design_elements/app_colors.dart';
import '../design_elements/my_gradient_button.dart';
import '../design_elements/my_text_field.dart';
import '../helpers/responsive.dart';
import '../design_elements/globals.dart' as globals;

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});
  @override
  createState() => AddDataScreenState();
}

class AddDataScreenState extends State<AddDataScreen> {
  InterstitialAd? _interstitialAd;
  bool showAd = false;
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();
  TextEditingController birthdayTextEditingController = TextEditingController();
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
                MaterialPageRoute(
                    builder: (context) => const AnimalPictureScreen()),
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
              padding: EdgeInsets.only(left: Responsive.width(5, context)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Responsive.width(15, context),
                      child: Text(
                        globals.language == 'English' ? 'Name' : '이름',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Responsive.width(15, context)),
                      child: MyTextField(
                          globals.language == 'English'
                              ? 'Enter Name'
                              : '이름을 입력하시오',
                          12,
                          AppColors.colorPrimary,
                          AppColors.colorPrimary,
                          "",
                          1.5,
                          1.5,
                          1.5,
                          60,
                          6,
                          false,
                          "Next",
                          nameTextEditingController),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Responsive.height(2, context),
                  left: Responsive.width(5, context)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Responsive.width(15, context),
                      child: Text(
                        globals.language == 'English' ? 'Country' : '국가',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Responsive.width(15, context)),
                      child: MyTextField(
                          globals.language == 'English'
                              ? 'Enter Country'
                              : '국가 입력',
                          12,
                          AppColors.colorPrimary,
                          AppColors.colorPrimary,
                          "",
                          1.5,
                          1.5,
                          1.5,
                          60,
                          6,
                          false,
                          "Next",
                          countryTextEditingController),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Responsive.height(2, context),
                  left: Responsive.width(5, context)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Responsive.width(15, context),
                      child: Text(
                        globals.language == 'English' ? 'Gender' : '성별',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Responsive.width(15, context)),
                      child: MyTextField(
                          globals.language == 'English'
                              ? 'Enter Gender'
                              : '성별을 입력하세요',
                          12,
                          AppColors.colorPrimary,
                          AppColors.colorPrimary,
                          "",
                          1.5,
                          1.5,
                          1.5,
                          60,
                          6,
                          false,
                          "Next",
                          genderTextEditingController),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Responsive.height(2, context),
                  left: Responsive.width(5, context)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Responsive.width(15, context),
                      child: Text(
                        globals.language == 'English' ? 'Date of Birth' : '생일',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: Responsive.width(15, context)),
                      child: MyTextField(
                          globals.language == 'English'
                              ? 'Enter Date of Birth'
                              : '생년월일을 입력하세요',
                          12,
                          AppColors.colorPrimary,
                          AppColors.colorPrimary,
                          "",
                          1.5,
                          1.5,
                          1.5,
                          60,
                          6,
                          false,
                          "Done",
                          birthdayTextEditingController),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Responsive.height(10, context)),
              child: Center(
                child: MyGradientButton(
                    globals.language == 'English' ? 'Result' : '결과보기',
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
