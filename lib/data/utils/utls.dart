// class Urls {
//   Urls._();

// static const String _baseUrl =  "https://newsapi.org/v2/";

//   static const String _allNewsUrl =  "everything?q=keyword&pageSize=";
//   static const String _breakingNewsUrl = "top-headlines?country=us&pageSize=";
//   static const String _apiKey = "&apiKey=99cc9f61895d40108898ab3fa6cfbe82";



//   static String allNewsApiUrl(String pageSize) => "$_baseUrl$_allNewsUrl$pageSize$_apiKey";
//   static String breakingNewsUrl(String pageSize) => "$_baseUrl$_breakingNewsUrl$pageSize$_apiKey";
// }
class Urls {
  Urls._();

static const String _baseUrl =  "https://newsapi.org/v2/";

  static const String _allNewsUrl =  "everything?q=keyword";
  static const String _breakingNewsUrl ="top-headlines?country=us" ;
  static const String _apiKey = "&apiKey=99cc9f61895d40108898ab3fa6cfbe82";

//top-headlines?country=us    // "top-headlines?country=us"
  static String allNewsApiUrl = "$_baseUrl$_allNewsUrl$_apiKey";
  static String breakingNewsUrl = "$_baseUrl$_breakingNewsUrl$_apiKey";
}
