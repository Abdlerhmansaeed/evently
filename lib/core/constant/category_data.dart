 class CategoryData {
  String name;
  String id;
  String image;
  CategoryData({required this.id, required this.name, required this.image});
  static List<CategoryData> categories = [
    CategoryData(
        id: "ALL", name: "All", image: ""),
    CategoryData(
        id: "birthday", name: "birthday", image: "assets/images/birthday.png"),
    CategoryData(
        id: "bookClub", name: "bookClub", image: "assets/images/bookclub.png"),
    CategoryData(
        id: "holiday", name: "holiday", image: "assets/images/holiday.png"),
    CategoryData(
        id: "eating", name: "eating", image: "assets/images/eating.png"),
    CategoryData(
        id: "gaming", name: "gaming", image: "assets/images/gaming.png"),
    CategoryData(
        id: "meeting", name: "meeting", image: "assets/images/meeting.png"),
    CategoryData(
        id: "exhibition",
        name: "exhibition",
        image: "assets/images/exhibition.png"),
    CategoryData(
        id: "sprots", name: "sprots", image: "assets/images/sprots.png"),
  ];
  static List<CategoryData> createEventCategories = [
    CategoryData(
        id: "birthday", name: "birthday", image: "assets/images/birthday.png"),
    CategoryData(
        id: "bookClub", name: "bookClub", image: "assets/images/bookclub.png"),
    CategoryData(
        id: "holiday", name: "holiday", image: "assets/images/holiday.png"),
    CategoryData(
        id: "eating", name: "eating", image: "assets/images/eating.png"),
    CategoryData(
        id: "gaming", name: "gaming", image: "assets/images/gaming.png"),
    CategoryData(
        id: "meeting", name: "meeting", image: "assets/images/meeting.png"),
    CategoryData(
        id: "exhibition",
        name: "exhibition",
        image: "assets/images/exhibition.png"),
    CategoryData(
        id: "sprots", name: "sprots", image: "assets/images/sprots.png"),
  ];
}
