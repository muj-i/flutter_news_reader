class Urls {
  Urls._();

static const String _baseUrl =  "https://newsapi.org/v2/";

  static const String _allNewsUrl =  "everything?q=keyword&pageSize=";
  static const String _breakingNewsUrl = "top-headlines?country=us&pageSize=";
  static const String _apiKey = "&apiKey=99cc9f61895d40108898ab3fa6cfbe82";



  static String allNewsApiUrl(String pageSize) => "$_baseUrl$_allNewsUrl$pageSize$_apiKey";
  static String breakingNewsUrl(String pageSize) => "$_baseUrl$_breakingNewsUrl$pageSize$_apiKey";
}
