class NetworkConfig {
  static const String BASE_URL = "http://192.168.1.13:8000";
  static const String API_LOGIN = BASE_URL + "/api/auth/login";
  static const String API_REGISTER = BASE_URL + "/api/auth/register";
  static const String API_SHOP = BASE_URL + "/api/shops/getAllShops";
  static const String API_ALL_PRODUCT =
      BASE_URL + "/api/products/getAllProducts";
  static const String API_ONE_PRODUCT =
      BASE_URL + "/api/products/getOneProduct";
  static const String API_PRODUCT_BY_SHOP =
      BASE_URL + "/api/products/getByShop";
  static const String API_PRODUCT_BY_CATE =
      BASE_URL + "/api/products/getByCategory";
  static const String API_SEARCH_FOOD = BASE_URL + "/api/products/searchfood";
  static const String API_USER_PROFILE = BASE_URL + "/api/auth/user-profile";
}
