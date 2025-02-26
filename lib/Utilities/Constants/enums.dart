import 'package:rocklis/Utilities/extensions.dart';

enum ScreenRoutes {
  login,
  signup,
  createPassword,
  mainScreen,
  home,
  forgetPassword,
  resetPassword,
  codeVerification,
  order,
  orderDetails,
  products,
  productDetails,
  blogDetails,
  blogs,
  checkOut,
  productShippingCart,
  profile,
  contactUs,
  services,
  aboutUs,
  wishlist,
  bill,
  notifications,
  orderHistory,
  error,
  privacyPolicy
}

enum PasswordStrengthDegree { week, medium, strong }

enum PaymentType { cashOnHand, card }

enum CardType { master, visa, amex, discover, payPal, unKnown }

enum DiscountType {
  fixed("fixed"),
  percentage("percentage");

  final String name;
  const DiscountType(this.name);

  @override
  toString() => name.translate;
}

enum SnackBarType {
  info,
  warning,
  success,
  error,
}

enum Gender {
  Female("Female"),
  Male("Male");

  final String name;
  const Gender(this.name);

  @override
  toString() => name.translate;
}

enum Power {
  electricity("electricity"),
  battery_and_rechargeable("battery_and_rechargeable");

  final String name;
  const Power(this.name);

  @override
  toString() => name.translate;
}

enum MachineType {
  dry("dry"),
  wet_and_dry("wet_and_dry");

  final String name;
  const MachineType(this.name);

  @override
  toString() => name.translate;
}

enum OrderStatus {
  pending,
  confirmed,
  processing,
  on_the_way,
  delivered,
  cancelled,
}
