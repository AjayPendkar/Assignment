class Constants {
  static String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=a0aeb7f7ba544497b55a4ec5464e221b";

  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=a0aeb7f7ba544497b55a4ec5464e221b";
  }
}
