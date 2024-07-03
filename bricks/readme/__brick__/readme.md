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
  firebase_core: ^2.32.0
  firebase_messaging: ^14.9.4
  flutter:
    sdk: flutter
  flutter_bloc:
  flutter_local_notifications: ^17.1.2
  flutter_screenutil:
  flutter_secure_storage: 9.0.0
  flutter_svg:
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
  intl: 
  google_maps_flutter: ^2.5.3
  geolocator:
  permission_handler: ^11.2.0
  image_picker:
  image_cropper:
  device_info_plus: ^9.1.1
  pin_code_fields: ^8.0.1
  flutter_animate: ^4.5.0
  share_plus: ^7.2.2
  infinite_scroll_pagination: ^4.0.0
  readmore: ^3.0.0
  carousel_slider: ^4.2.1  
  sticky_headers: ^0.3.0+2
  animated_flip_counter: ^0.3.4
  flutter_widget_from_html: ^0.14.11
  rename: ^3.0.2

```

### generate project template:
```shell
mason make core -o .././lib
```

### add new feature (enter feature name)
```shell
mason make feature -o .././lib/features 
```

### generate assets folder
```shell
mason make assets -o ../assets
```

### generate readme file (enter project name)
```shell
mason make readme -o ../
```

### Add assets and fonts paths in pubspec.yaml file
```yaml
  assets:
    - assets/images/
    - assets/icons/
    - assets/lang/

  fonts:
    - family: fontName 
      fonts:
        - asset: assets/fonts/teshrin/fontName-Light.ttf
          weight: 300
        - asset: assets/fonts/teshrin/fontName-Regular.ttf
          weight: 400
        - asset: assets/fonts/teshrin/fontName-Medium.ttf
          weight: 500
        - asset: assets/fonts/teshrin/fontName-Bold.ttf
          weight: 600

```

### generate file that contains assets variables and widgets and injectable: 

1. activate flutter gen 

```shell
dart pub global activate flutter_gen
```

2. add these dependencies to dev_dependencies  

```yaml
dev_dependencies:
  flutter_launcher_icons: "^0.13.1"
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

###  Launcher Icon 

```yaml
flutter_launcher_icons:
  android: "ic_launcher"
  ios: true
  remove_alpha_ios: true
  image_path: "assets/images/logo.png"
  adaptive_icon_background: "#FFFFFF"
```

### auto generate files like (injection.config.dart - assets.gen.dart)

```shell
dart run build_runner build
```

## generate icon launcher 
```shell
flutter pub run flutter_launcher_icons
```

### generate file that contains localization keys:

```shell
dart run easy_localization:generate -S "assets/lang" -O "lib/core/resources/gen" -o "locale_keys.g.dart" -f keys
```

## ignore mason files 

```shell
git update-index --skip-worktree mason/.mason/bricks.json

git update-index --skip-worktree mason/mason-lock.json

git update-index --skip-worktree mason/mason.yaml
```