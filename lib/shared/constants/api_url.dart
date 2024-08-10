class ApiUrl {
  // static const String domain = 'http://nina-digital.com';
  static const String domain = 'http://demo11.ninavietnam.com.vn/nina-digital';

  // Base Url API
  static const String baseUrl = '$domain/api-app/v1';

  // Authention
  static const String checkToken = '$baseUrl/token/check';
  static const String refreshToken = '$baseUrl/token/refresh';
  static const String signIn = '$baseUrl/account/sign-in';
  static const String signUp = '$baseUrl/account/sign-up';
  static const String forgotPassword = '$baseUrl/account/forgot-password';
  static const String changePassword = '$baseUrl/account/change-password';

  // Account
  static const String accountUpdate = '$baseUrl/account';
  static const String accountChangeAvatar = '$baseUrl/upload/change-avatar';

  // Address
  static const String address = '$baseUrl/address';

  // Product
  static const String productsCategories = '$baseUrl/product/categories';
  static const String products = '$baseUrl/product';
  static const String productsFavorite = '$baseUrl/product-favorite';

  // Promotion
  static const String promotion = '$baseUrl/promotion';

  // News
  static const String newsCategories = '$baseUrl/news/categories';
  static const String news = '$baseUrl/news';

  // Photo
  static const String photos = '$baseUrl/photos';

  // Place
  static const String placeCities = '$baseUrl/cities';
  static const String placeDistricts = '$baseUrl/districts';
  static const String placeWards = '$baseUrl/wards';

  // Order
  static const String orders = '$baseUrl/orders';
  static const String ordersCreate = '$baseUrl/orders/create-order';

  // Upload
  static const String _upload = '$baseUrl/upload';
  static const String uploadAvatar = '$_upload/change-avatar';
}
