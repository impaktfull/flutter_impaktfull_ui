import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/component_library/components/sidebar_navigation/sidebar_navigation_library_item.dart';
import 'package:impaktfull_ui_example/src/component_library/config/component_library_item.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';
import 'package:impaktfull_ui_example/src/widget/components/components_library_variant_descriptor.dart';

class SidebarNavigationLibraryVariant
    extends ComponentLibraryVariant<SidebarNavigationLibraryPrimaryInputs> {
  const SidebarNavigationLibraryVariant();

  @override
  String get title => 'Default';

  @override
  List<Widget> build(
      BuildContext context, SidebarNavigationLibraryPrimaryInputs inputs) {
    return [
      ComponentsLibraryVariantDescriptor(
        height: 250,
        child: ImpaktfullUiSidebarNavigation(
          width: 200,
          header: ImpaktfullUiAssetWidget(
            asset: theme.assets.images.logo,
            width: 150,
          ),
          items: [
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.home,
              title: 'Home',
              items: [
                ImpaktfullUiSidebarNavigationItem(
                  leading: theme.assets.icons.confetti,
                  title: 'Projects',
                ),
                ImpaktfullUiSidebarNavigationItem(
                  leading: theme.assets.icons.confetti,
                  title: 'Apps',
                ),
              ],
            ),
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.search,
              title: 'Search',
            ),
          ],
        ),
      ),
      ComponentsLibraryVariantDescriptor(
        height: 500,
        child: ImpaktfullUiSidebarNavigation(
          asset: theme.assets.images.logo,
          items: [
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.home,
              title: 'Home',
              items: [
                ImpaktfullUiSidebarNavigationItem(
                  leading: theme.assets.icons.confetti,
                  title: 'Projects',
                ),
                ImpaktfullUiSidebarNavigationItem(
                  leading: theme.assets.icons.confetti,
                  title: 'Apps',
                ),
              ],
            ),
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.search,
              title: 'Search',
            ),
          ],
          secondaryItems: List.generate(
                  inputs.amountOfSecondaryItems.value ?? 0, (index) => index)
              .map(
                (index) => ImpaktfullUiSidebarNavigationItem(
                  leading: theme.assets.icons.confetti,
                  title: 'Submenu $index',
                ),
              )
              .toList(),
          footerItems: [
            ImpaktfullUiSidebarNavigationItem(
              leading: theme.assets.icons.settings,
              title: 'Settings',
            ),
          ],
          footer: Stack(
            children: [
              ImpaktfullUiSimpleListItem(
                leadingWidgetBuilder: (context) => const ImpaktfullUiAvatar(
                  url: NetworkImages.profilePicture,
                ),
                trailingWidgetBuilder: (context) => const SizedBox(width: 40),
                borderRadius: ImpaktfullUiSidebarNavigationItemTheme.of(context)
                    .dimens
                    .borderRadius,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
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
                  color: theme.colors.text,
                  onTap: () =>
                      ImpaktfullUiNotification.show(title: 'Logout tapped'),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  @override
  SidebarNavigationLibraryPrimaryInputs inputs() =>
      SidebarNavigationLibraryPrimaryInputs();
}

class SidebarNavigationLibraryPrimaryInputs
    extends SidebarNavigationLibraryInputs {}
