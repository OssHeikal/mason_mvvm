# {{projectName}}

Short description or introduction of your project.

## Dependencies

Below is a list of default dependencies used in this project:
```yaml
dependencies:
  bot_toast:
  cached_network_image:
  connectivity_plus:
  country_code_picker:
  cupertino_icons:
  dio:
  dartz:
  easy_localization:
  equatable:
  flutter:
    sdk: flutter
  flutter_bloc:
  flutter_secure_storage: 9.0.0
  flutter_svg:
  flutter_screenutil:
  get_it:
  go_router:
  google_fonts:
  injectable:
  logger:
  rxdart:
  shared_preferences:
  shimmer:
  url_launcher:
  lottie: ^2.7.0
  pinput: ^3.0.1
  local_auth: ^2.1.8
  file_picker: ^6.1.1
  percent_indicator: ^4.2.3
  intl: ^0.18.1
  google_maps_flutter: ^2.5.3
  geolocator:
  permission_handler: ^11.2.0
  image_picker:
  image_cropper:
  device_info_plus: ^9.1.1
  pin_code_fields: ^8.0.1
  flutter_animate: ^4.5.0
  share_plus: ^7.2.2
```

## generate project template:
```shell
mason make project_template -o .././lib
```

## add new feature
- run this command and then enter feature name 
```shell
mason make feature -o .././lib/features
```

### generate assets folder
```shell
mason make assets -o ../assets
```
## Add assets paths in pubspec.yaml file
```yaml
  assets:
    - assets/images/
    - assets/icons/
    - assets/lang/
```

## generate file that contains assets variables and widgets and injectable: 

1. activate flutter gen 

```shell
dart pub global activate flutter_gen
```

2. add these dependencies to dev_dependencies  

```yaml
dev_dependencies:
  build_runner:
  flutter_gen_runner:
  injectable_generator:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1
```

3. add flutter gen configs to pubspec.yaml

```yaml
flutter_gen:
  output: lib/core/resources/gen/
  line_length: 120

  # Optional
  integrations:
    flutter_svg: true
    flare_flutter: true
    rive: true
    lottie: true
```

4. auto generate files like (injection.config.dart - assets.gen.dart)

```shell
dart run build_runner build
```

## generate file that contains localization keys:

```shell
flutter pub run easy_localization:generate -S "assets/lang" -O "lib/core/resources/gen" -o "locale_keys.g.dart" -f keys
```


