
import 'package:doctor_app/core/const/image_asset.dart';

class OnBoardingModel
{
  final String? title;
  final String? image;
  final String? body;
  OnBoardingModel({ this.title, this.image, this.body});
}

List<OnBoardingModel> onBoardingList =
[
  OnBoardingModel(
      title: "Notifications and choose your date",
      body:
      "You can book your appropriate appointment in an easy way without getting tired of your mobile phone from anywhere and receive a notification to confirm your appointment and remind you while you are outside the application at any time in the utmost privacy",
  ),
  OnBoardingModel(
      title: "Dr. Maher's Achievements",
      body:
      "Member of the Egyptian Society of Dermatology, Member of the European Academy of Dermatology and Venereology, Member of the British Medical Laser Society, Member of the Afro-Asian Society of Aesthetic Dermatology ",
  ),
  OnBoardingModel(
      title: "Completion of achievements",
      body:
      "Specialized in treating burns, fillers, botox and skin tightening threads And treating acne scars, Hair loss treatment and eczema treatment, Rejuvenation, lightening and mesotherapy injections",
  ),
];