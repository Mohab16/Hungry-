class ApiConstants {
  static const String baseUrl = "https://sonic-zdi0.onrender.com/api";
  static const String login= "/login";
  static const String register= "/register";
  static const String homeproducts= "/products";


}

class ApiErrors {
  static const String badRequestError = "The data you entered is invalid";
  static const String noContent = "No content available";
  static const String forbiddenError = "You are not allowed to perform this action";
  static const String unauthorizedError = "Email or password is incorrect";
  static const String notFoundError = "The requested resource was not found";
  static const String conflictError = "There is a conflict with the current data";
  static const String internalServerError = "Server error, please try again later";
  static const String unknownError = "An unknown error occurred";
  static const String timeoutError = "Connection timed out";
  static const String defaultError = "Something went wrong, please try again";
  static const String cacheError = "Cache error occurred";
  static const String noInternetError = "Please check your internet connection";
  static const String loadingMessage = "Loading...";
  static const String retryAgainMessage = "Please try again";
  static const String ok = "OK";
}
