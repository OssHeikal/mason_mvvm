import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';

import '../../resources/resources.dart';

extension ImageSourceExt on ImageSource {
  SvgGenImage get icon {
    switch (this) {
      case ImageSource.camera:
        return Assets.icons.cameraAdd;
      case ImageSource.gallery:
        return Assets.icons.imageGallary;
      default:
        return Assets.icons.imageGallary;
    }
  }

  String get title {
    switch (this) {
      case ImageSource.camera:
        return LocaleKeys.image_source_camera.tr();
      case ImageSource.gallery:
        return LocaleKeys.image_source_gallery.tr();
      default:
        return LocaleKeys.image_source_gallery.tr();
    }
  }
}
