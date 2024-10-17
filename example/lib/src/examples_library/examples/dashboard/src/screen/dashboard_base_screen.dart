import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/examples_library/examples/dashboard/src/screen/dashboard_store_products_screen.dart';
import 'package:impaktfull_ui_example/src/examples_library/widgets/coming_soon.dart';
import 'package:impaktfull_ui_example/src/util/network_images.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DashboardBaseScreen extends StatefulWidget {
  const DashboardBaseScreen({
    super.key,
  });

  @override
  State<DashboardBaseScreen> createState() => _DashboardBaseScreenState();
}

class _DashboardBaseScreenState extends State<DashboardBaseScreen> {
  var _activeScreen = DashboardScreen.home;
  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiScreen(
      child: ImpaktfullUiAutoLayout.horizontal(
        children: [
          ImpaktfullUiSidebarNavigation(
            width: 300,
            asset: theme.assets.images.logo,
            items: [
              ImpaktfullUiSidebarNavigationItem(
                leading: ImpaktfullUiAsset.icon(PhosphorIcons.house()),
                title: 'Home',
                isSelected: _activeScreen == DashboardScreen.home,
                onTap: () =>
                    setState(() => _activeScreen = DashboardScreen.home),
              ),
              ImpaktfullUiSidebarNavigationItem(
                leading: ImpaktfullUiAsset.icon(PhosphorIcons.basket()),
                title: 'Store',
                items: [
                  ImpaktfullUiSidebarNavigationItem(
                    leading: ImpaktfullUiAsset.icon(PhosphorIcons.tShirt()),
                    title: 'Products',
                    isSelected: _activeScreen == DashboardScreen.storeProducts,
                    onTap: () => setState(
                        () => _activeScreen = DashboardScreen.storeProducts),
                  ),
                  ImpaktfullUiSidebarNavigationItem(
                    leading: ImpaktfullUiAsset.icon(PhosphorIcons.money()),
                    title: 'Orders',
                    isSelected: _activeScreen == DashboardScreen.storeOrders,
                    onTap: () => setState(
                        () => _activeScreen = DashboardScreen.storeOrders),
                  ),
                  ImpaktfullUiSidebarNavigationItem(
                    leading:
                        ImpaktfullUiAsset.icon(PhosphorIcons.sealPercent()),
                    title: 'Coupons',
                    isSelected: _activeScreen == DashboardScreen.storeCoupons,
                    onTap: () => setState(
                        () => _activeScreen = DashboardScreen.storeCoupons),
                  ),
                  ImpaktfullUiSidebarNavigationItem(
                    leading: ImpaktfullUiAsset.icon(PhosphorIcons.gearSix()),
                    title: 'Settings',
                    isSelected: _activeScreen == DashboardScreen.storeSettings,
                    onTap: () => setState(
                        () => _activeScreen = DashboardScreen.storeSettings),
                  ),
                ],
              ),
              ImpaktfullUiSidebarNavigationItem(
                leading: ImpaktfullUiAsset.icon(PhosphorIcons.envelopeSimple()),
                title: 'Emails',
                items: [
                  ImpaktfullUiSidebarNavigationItem(
                    leading: ImpaktfullUiAsset.icon(PhosphorIcons.tShirt()),
                    title: 'Campaigns',
                    isSelected:
                        _activeScreen == DashboardScreen.emailsCampaigns,
                    onTap: () => setState(
                        () => _activeScreen = DashboardScreen.emailsCampaigns),
                  ),
                  ImpaktfullUiSidebarNavigationItem(
                    leading: ImpaktfullUiAsset.icon(PhosphorIcons.money()),
                    title: 'API',
                    isSelected: _activeScreen == DashboardScreen.emailsApi,
                    onTap: () => setState(
                        () => _activeScreen = DashboardScreen.emailsApi),
                  ),
                  ImpaktfullUiSidebarNavigationItem(
                    leading: ImpaktfullUiAsset.icon(PhosphorIcons.gearSix()),
                    title: 'Settings',
                    isSelected: _activeScreen == DashboardScreen.emailsSettings,
                    onTap: () => setState(
                        () => _activeScreen = DashboardScreen.emailsSettings),
                  ),
                ],
              ),
            ],
            footerItems: [
              ImpaktfullUiSidebarNavigationItem(
                leading: ImpaktfullUiAsset.icon(PhosphorIcons.gearSix()),
                title: 'Settings',
                isSelected: _activeScreen == DashboardScreen.settings,
                onTap: () =>
                    setState(() => _activeScreen = DashboardScreen.settings),
              ),
            ],
            footer: ImpaktfullUiSimpleListItem(
              leadingWidgetBuilder: (context) => const ImpaktfullUiAvatar(
                url: NetworkImages.profilePicture,
              ),
              title: 'Koen Van Looveren',
              subtitle: 'koen@impaktfull.com',
              trailingWidgetBuilder: (context) => ImpaktfullUiIconButton(
                asset: ImpaktfullUiAsset.icon(PhosphorIcons.signOut()),
                onTap: () => Navigator.of(context, rootNavigator: true).pop(),
              ),
            ),
          ),
          Expanded(
            child: Builder(builder: (context) {
              switch (_activeScreen) {
                case DashboardScreen.home:
                  return const ExampleComingSoon();
                case DashboardScreen.storeProducts:
                  return const DashboardStoreProductsScreen();
                case DashboardScreen.storeOrders:
                case DashboardScreen.storeCoupons:
                case DashboardScreen.storeSettings:
                case DashboardScreen.emailsCampaigns:
                case DashboardScreen.emailsApi:
                case DashboardScreen.emailsSettings:
                case DashboardScreen.settings:
                  return const ExampleComingSoon();
              }
            }),
          ),
        ],
      ),
    );
  }
}

enum DashboardScreen {
  home,
  storeProducts,
  storeOrders,
  storeCoupons,
  storeSettings,
  emailsCampaigns,
  emailsApi,
  emailsSettings,
  settings,
}
