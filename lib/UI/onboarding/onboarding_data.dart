class OnboardingItem {
  final String image;
  final String title;
  final String? desc;

  OnboardingItem({required this.image, required this.title, this.desc});
}

final List<OnboardingItem> onboardingData = [
  OnboardingItem(
    image: "assets/images/onboarding1.png",
    title: "Find Your Next Favorite Movie Here",
    desc:
        "Get access to a huge library of movies to suit all tastes. You will surely like it",
  ),
  OnboardingItem(
    image: "assets/images/onboarding2.png",
    title: "Discover Movies",
    desc:
        "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
  ),
  OnboardingItem(
    image: "assets/images/onboarding3.png",
    title: "Explore All Genres",
    desc:
        "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
  ),
  OnboardingItem(
    image: "assets/images/onboarding4.png",
    title: "Create Watchlists",
    desc:
        "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
  ),
  OnboardingItem(
    image: "assets/images/onboarding5.png",
    title: "Rate, Review, and Learn",
    desc:
        "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
  ),
  OnboardingItem(
    image: "assets/images/onboarding6.png",
    title: "Start Watching Now",
  ),
];
