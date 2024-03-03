import 'package:flutter/material.dart';

class AppConstants {
  static const String countryCode = '+966';
  static const otpTimerDuration = 60;

  static const profilePlaceholder =
      'https://images.unsplash.com/photo-1575936123452-b67c3203c357?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  static const imagePlaceholder = 'https://via.placeholder.com/150';

  static const String textPlaceHolder =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  static const String textPlaceHolderAr =
      'النص البديل هو نص تجريبي يستخدم في الصناعات التجارية والصناعية لتجربة الخطوط والتصاميم. وقد استخدم النص البديل بشكل قياسي منذ القرن الخامس عشر، عندما قامت طابعة مجهولة برص الأحرف بشكل مختلط لجعل كتاب من نوعه. وقد نجا ليس فقط خمسة قرون، ولكن أيضا القفزة إلى النص الإلكتروني، والبقاء في جوهره دون تغيير. وقد شاع استخدام النص البديل في الستينيات من القرن الماضي مع إصدار أوراق Letraset تحتوي على مقاطع من النص البديل، ومؤخرا مع برامج النشر المكتبي مثل Aldus PageMaker بما في ذلك إصدارات من النص البديل.';
}

class HeroTags {
  static const String mainLogo = 'mainLogo';
  static const String mainButton = 'mainButton';
  static const String linearProgressBar = 'linearProgressBar';

  static const String mainAvatar = 'mainAvatar';
  static const String profileName = 'profileName';
  static const String profileEmail = 'profileEmail';
}

class AppStrings {
  static const String appName = '';
}

class LocalizationConstants {
  static const String localeFolderPath = 'assets/lang';

  static const Locale favoriteLang = Locale("ar");
  static const List<Locale> supportedLocales = [Locale("ar"), Locale("en")];

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String initialSelection = 'IQ'; //SA
  static const String initialCountryCode = '+964'; //+966
  static const List<String> favCountry = ['+964', '+966'];
}
