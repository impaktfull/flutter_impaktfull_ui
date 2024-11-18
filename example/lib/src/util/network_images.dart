import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';

class NetworkImages {
  const NetworkImages._();
  static const String profilePicture =
      'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/profile_picture.png';

  /// Photo by Amir SeilSepour: https://www.pexels.com/photo/portrait-of-a-man-with-a-hat-smiling-6102841/
  static const avatar1 =
      'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/avatars/avatar_1.jpg';

  /// Photo by Amir SeilSepour: https://www.pexels.com/photo/portrait-of-a-man-with-a-hat-smiling-6102841/
  static const avatar2 =
      'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/avatars/avatar_2.jpg';

  /// Photo by Samad Ismayilov: https://www.pexels.com/photo/man-cross-legs-seating-on-white-wooden-chair-1270076/
  static const avatar3 =
      'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/avatars/avatar_2.jpg';

  /// Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/
  static const String image16x9 =
      'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/gallery/northern_light.jpg';

  static const String random = 'https://picsum.photos/300/300';

  static const gallery = [
    /// Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/gallery/northern_light.jpg',
      title: 'Northern Lights',
      description:
          'Photo by stein egil liland: https://www.pexels.com/photo/time-lapse-photo-of-northern-lights-1933316/',
    ),

    /// Photo by Line Knipst: https://www.pexels.com/photo/enchanting-fly-agaric-mushrooms-in-autumn-forest-28987435/
    ImpaktfullUiGalleryItem.image(
        imageUrl:
            'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/gallery/northern_light.jpg',
        title: 'Forest',
        description:
            'Photo by Line Knipst: https://www.pexels.com/photo/enchanting-fly-agaric-mushrooms-in-autumn-forest-28987435/'),

    /// Photo by Asad Photo Maldives: https://www.pexels.com/photo/brown-dock-near-coconut-trees-1591372/
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/gallery/northern_light.jpg',
      title: 'Beach',
      description:
          'Photo by Asad Photo Maldives: https://www.pexels.com/photo/brown-dock-near-coconut-trees-1591372/',
    ),

    /// Photo by Krivec Ales: https://www.pexels.com/photo/bird-s-eye-view-photography-of-mountains-552785/
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/gallery/mountains.jpg',
      title: 'Mountains',
      description:
          'Photo by Krivec Ales: https://www.pexels.com/photo/bird-s-eye-view-photography-of-mountains-552785/',
    ),

    /// Photo by Alex Qian: https://www.pexels.com/photo/bird-s-eye-view-photography-of-high-rise-buildings-2304917/
    ImpaktfullUiGalleryItem.image(
      imageUrl:
          'https://example.impaktfull-ui.opensource.impaktfull.com/assets/assets/images/supporting/gallery/city.jpg',
      imageFit: BoxFit.cover,
      title: 'City (Vertical)',
      description:
          'Photo by Alex Qian: https://www.pexels.com/photo/bird-s-eye-view-photography-of-high-rise-buildings-2304917/',
    ),
  ];
}
