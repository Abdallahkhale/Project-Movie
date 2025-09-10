import 'package:movies/Core/assets/images/imagesPath.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String? desc;

  OnboardingItem({required this.image, required this.title, this.desc});
}

final List<OnboardingItem> onboardingData = [
  OnboardingItem(
    image: ImagesPath.onboarding1,
    title: "Find Your Next Favorite Movie Here",
    desc:
        "Get access to a huge library of movies to suit all tastes. You will surely like it",
  ),
  OnboardingItem(
    image: ImagesPath.onboarding2,
    title: "Discover Movies",
    desc:
        "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
  ),
  OnboardingItem(
    image: ImagesPath.onboarding3,
    title: "Explore All Genres",
    desc:
        "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
  ),
  OnboardingItem(
    image: ImagesPath.onboarding4,
    title: "Create Watchlists",
    desc:
        "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
  ),
  OnboardingItem(
    image: ImagesPath.onboarding5,
    title: "Rate, Review, and Learn",
    desc:
        "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
  ),
  OnboardingItem(
    image: ImagesPath.onboarding6,
    title: "Start Watching Now",
  ),
];
