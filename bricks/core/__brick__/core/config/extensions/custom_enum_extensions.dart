import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/resources.dart';
import 'package:image_picker/image_picker.dart';

extension ImageSourceExt on ImageSource {
  SvgGenImage get icon {
    switch (this) {
      case ImageSource.camera:
        return Assets.icons.cameraAddFill;
      case ImageSource.gallery:
        return Assets.icons.imageGallaryFill;
      default:
        return Assets.icons.imageGallaryFill;
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
