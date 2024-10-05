import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/sidebar_navigation/sidebar_navigation_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';

class SidebarNavigationLibraryVariant extends ComponentLibraryVariant<SidebarNavigationLibraryPrimaryInputs> {
  const SidebarNavigationLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(BuildContext context, SidebarNavigationLibraryPrimaryInputs inputs) {
    return [
      SizedBox(
        height: 500,
        width: 300,
        child: ImpaktfullUiSidebarNavigation(
          asset: theme.assets.images.logo,
          items: [
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.home,
              title: 'Home',
            ),
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.search,
              title: 'Search',
            ),
          ],
          footerItems: [
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.settings,
              title: 'Settings',
            ),
          ],
          footer: Stack(
            children: [
              ImpaktfullUiSimpleListItem(
                leadingWidgetBuilder: (context) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colors.border,
                      width: 1,
                    ),
                  ),
                  width: 40,
                  height: 40,
                  child: const ClipOval(
                    child: ImpaktfullUiNetworkImage(
                      url: NetworkImages.profilePicture,
                    ),
                  ),
                ),
                trailingWidgetBuilder: (context) => const SizedBox(width: 40),
                borderRadius: ImpaktfullUiSidebarNavigationItemTheme.of(context).dimens.borderRadius,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                title: 'impaktfull admin',
                subtitle: 'admin@impaktfull.com',
                onTap: () => ImpaktfullUiNotification.show(
                  title: 'On Settings tapped',
                ),
              ),
              Positioned.directional(
                end: 0,
                textDirection: Directionality.of(context),
                child: ImpaktfullUiIconButton(
                  asset: theme.assets.icons.logout,
                  onTap: () => ImpaktfullUiNotification.show(title: 'Logout tapped'),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  SidebarNavigationLibraryPrimaryInputs inputs() => SidebarNavigationLibraryPrimaryInputs();
}

class SidebarNavigationLibraryPrimaryInputs extends SidebarNavigationLibraryInputs {}
