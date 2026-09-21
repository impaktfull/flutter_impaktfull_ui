import 'package:impaktfull_ui/impaktfull_ui.dart';

/// Images used by the example app.
///
/// They are loaded from the network so they do not have to be bundled in the
/// repository and in the package that is published to pub.dev.
class NetworkImages {
  const NetworkImages._();

  static const String profilePicture =
      'https://raw.githubusercontent.com/impaktfull/flutter_impaktfull_ui/main/.github/assets/profile_picture.png';

  /// Photo by Amir SeilSepour: https://www.pexels.com/photo/portrait-of-a-man-with-a-hat-smiling-6102841/
  static const avatar1 =
      'https://images.pexels.com/photos/6102841/pexels-photo-6102841.jpeg?auto=compress&cs=tinysrgb&w=400';

  /// Photo by KOVAC .lay: https://www.pexels.com/photo/a-woman-in-white-shirt-wearing-an-eyeglasses-7009155/
  static const avatar2 =
      'https://images.pexels.com/photos/7009155/pexels-photo-7009155.jpeg?auto=compress&cs=tinysrgb&w=400';

  /// Photo by Samad Ismayilov: https://www.pexels.com/photo/man-cross-legs-seating-on-white-wooden-chair-1270076/
  static const avatar3 =
      'https://images.pexels.com/photos/1270076/pexels-photo-1270076.jpeg?auto=compress&cs=tinysrgb&w=400';

  /// Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/
  static const String image16x9 = _northernLights;

  static const String random = 'https://picsum.photos/300/300';

  /// Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/
  static const _northernLights =
      'https://images.pexels.com/photos/1933316/pexels-photo-1933316.jpeg?auto=compress&cs=tinysrgb&w=1920';

  static const gallery = [
    /// Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/
    ImpaktfullUiGalleryItem.image(
      imageUrl: _northernLights,
      title: 'Northern Lights',
      description:
          'Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/',
    ),

    /// Photo by Line Knipst: https://www.pexels.com/photo/enchanting-fly-agaric-mushrooms-in-autumn-forest-28987435/
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://images.pexels.com/photos/28987435/pexels-photo-28987435.jpeg?auto=compress&cs=tinysrgb&w=1920',
      title: 'Forest',
      description:
          'Photo by Line Knipst: https://www.pexels.com/photo/enchanting-fly-agaric-mushrooms-in-autumn-forest-28987435/',
    ),

    /// Photo by Asad Photo Maldives: https://www.pexels.com/photo/brown-dock-near-coconut-trees-1591372/
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://images.pexels.com/photos/1591372/pexels-photo-1591372.jpeg?auto=compress&cs=tinysrgb&w=1920',
      title: 'Beach',
      description:
          'Photo by Asad Photo Maldives: https://www.pexels.com/photo/brown-dock-near-coconut-trees-1591372/',
    ),

    /// Photo by Krivec Ales: https://www.pexels.com/photo/bird-s-eye-view-photography-of-mountains-552785/
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://images.pexels.com/photos/552785/pexels-photo-552785.jpeg?auto=compress&cs=tinysrgb&w=1920',
      title: 'Mountains',
      description:
          'Photo by Krivec Ales: https://www.pexels.com/photo/bird-s-eye-view-photography-of-mountains-552785/',
    ),

    /// Photo by Alex Qian: https://www.pexels.com/photo/bird-s-eye-view-photography-of-high-rise-buildings-2304917/
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://images.pexels.com/photos/2304917/pexels-photo-2304917.jpeg?auto=compress&cs=tinysrgb&h=1920',
      title: 'City (Vertical)',
      description:
          'Photo by Alex Qian: https://www.pexels.com/photo/bird-s-eye-view-photography-of-high-rise-buildings-2304917/',
    ),
  ];
}
