# mvvm_project_template

This repository provides a set of bricks to streamline Flutter project setup and feature integration. Whether you're starting a new project or adding features to an existing one, this boilerplate generator can save you time and maintain consistency in your codebase.

## Project Structure

The project follows a modular structure to enhance organization and maintainability:
```shell
|-- assets
|-- |-- icons
|-- |-- images
|-- |-- lang
|-- |-- |-- ar.json
|-- |-- |-- en.json
|-- lib
|-- |-- core
|-- |-- |-- configs
|-- |-- |-- |-- extensions
|-- |-- |-- |-- locale
|-- |-- |-- |-- router
|-- |-- |-- |-- theme
|-- |-- |-- data
|-- |-- |-- |-- dio
|-- |-- |-- |-- error
|-- |-- |-- |-- local
|-- |-- |-- |-- remote
|-- |-- |-- models
|-- |-- |-- resources
|-- |-- |-- utils
|-- |-- features
|-- |-- |-- feature_1
|-- |-- |-- |-- models
|-- |-- |-- |-- repository
|-- |-- |-- |-- view
|-- |-- |-- |-- |-- screens
|-- |-- |-- |-- |-- widgets
|-- |-- |-- |-- view_models
|-- README.md
```

## Bricks

### MVVM Flutter Project Template

This brick generates a Flutter project template following the MVVM architecture, promoting a clean and scalable code structure.

### Add New Feature

Use this brick to add a new feature to your project. It ensures proper integration and follows established coding patterns.

### Generate Assets

This brick creates the necessary assets folder with icons, images, and language files, promoting a standardized resource management approach.

### Generate README

Automatically generate a README file for your project, ensuring consistent and informative documentation.


## Usage 

### install maosn cli 
```shell
dart pub global activate mason_cli
```

### add mason to your project 
```shell
mkdir mason
cd mason
mason init
```

### add bricks to mason.yaml file 
- replace paths with the bricks path on your pc 
```yaml
bricks:
  readme:
    path: ./bricks/readme
  assets:
    path: ./bricks/assets
  core:
    path: ./bricks/core
  feature:
    path: ./bricks/feature
```

### get bricks 
```shell
mason get
```
### clear mason cache 
```shell
mason cache clear
```

### Add default dependencies in pubspec.yaml file
```shell
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
  infinite_scroll_pagination: ^4.0.0
  readmore: ^3.0.0
  carousel_slider: ^4.2.1  sticky_headers: ^0.3.0+2
  animated_flip_counter: ^0.3.4
  flutter_widget_from_html: ^0.14.11
  rename: ^3.0.2
  flutter_local_notifications: ^17.1.2
  firebase_core: ^2.32.0
  firebase_messaging: ^14.9.4
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
flutter pub run easy_localization:generate -S "assets/lang" -O "lib/core/resources/gen" -o "locale_keys.g.dart" -f keys
```

## ignore mason files 

```shell
git update-index --skip-worktree mason/.mason/bricks.json

git update-index --skip-worktree mason/mason-lock.json

git update-index --skip-worktree mason/mason.yaml
```