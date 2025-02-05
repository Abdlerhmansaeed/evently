import 'package:evently/core/constant/app_assets.dart';

class OnBoradingdata {
  String image;
  String title;
  String discreption;
  OnBoradingdata(
      {required this.image, required this.discreption, required this.title});
  static List<OnBoradingdata> onboradingdata = [
    OnBoradingdata(
        image: AppAssets.onborading1,
        discreption:
            "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
        title: "Personalize Your Experience"),
    OnBoradingdata(
        image: AppAssets.onborading2,
        discreption:
            "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
        title: "Find Events That Inspire You"),
    OnBoradingdata(
        image: AppAssets.onborading3,
        discreption:
            "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
        title: "Effortless Event Planning"),
    OnBoradingdata(
        image: AppAssets.onborading4,
        discreption:
            "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
        title: "Connect with Friends & Share Moments")
  ];
}
