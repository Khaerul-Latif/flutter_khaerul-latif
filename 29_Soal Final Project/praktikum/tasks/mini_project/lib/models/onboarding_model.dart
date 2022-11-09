// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnBoarding {
  String image;
  String title;
  String description;
  OnBoarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoarding> onBoards = [
    OnBoarding(
      image: "assets/images/onboarding_1.png",
      title: "So that you remember your activities",
      description:
          "Keep in mind, that the ability to remember in each person is different. Maybe when you are focused on doing something, you forget about other activities that are no less important. This of course will be very detrimental to you.",
    ),
    OnBoarding(
      image: "assets/images/onboarding_2.png",
      title: "You can be more productive",
      description:
          "By making a to do list you can do some more productive activities. You can customize which activities are important for you to do and which will just be a waste of time. So you only have productive activities every day",
    ),
    OnBoarding(
      image: "assets/images/onboarding_3.png",
      title: "Schedule becomes more regular",
      description:
          "To do lists can make your schedule more regular, starting from the morning after waking up, until the evening when you are going to rest. That way, you can more easily carry out various activities",
    ),
  ];