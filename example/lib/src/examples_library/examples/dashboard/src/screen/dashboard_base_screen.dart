import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/examples_library/examples/dashboard/src/screen/dashboard_store_coupon_screen.dart';
import 'package:impaktfull_ui_example/src/examples_library/examples/dashboard/src/screen/dashboard_store_home_screen.dart';
import 'package:impaktfull_ui_example/src/examples_library/examples/dashboard/src/screen/dashboard_store_orders_screen.dart';
import 'package:impaktfull_ui_example/src/examples_library/examples/dashboard/src/screen/dashboard_store_products_screen.dart';
import 'package:impaktfull_ui_example/src/examples_library/widgets/coming_soon.dart';
import 'package:impaktfull_ui_example/src/navigator/navigator.dart';
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
      drawer: ImpaktfullUiSidebarNavigation(
        width: 500,
        asset: theme.assets.images.logo,
        items: [
          ImpaktfullUiSidebarNavigationItem(
            leading: ImpaktfullUiAsset.icon(PhosphorIcons.house()),
            title: 'Home',
            isSelected: _activeScreen == DashboardScreen.home,
            onTap: () => setState(() => _activeScreen = DashboardScreen.home),
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
                onTap: () =>
                    setState(() => _activeScreen = DashboardScreen.storeOrders),
              ),
              ImpaktfullUiSidebarNavigationItem(
                leading: ImpaktfullUiAsset.icon(PhosphorIcons.sealPercent()),
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
            onTap: () => ImpaktfullUiNavigator.instance.goBack(),
          ),
        ),
      ),
      child: Builder(builder: (context) {
        switch (_activeScreen) {
          case DashboardScreen.home:
            return const DashboardStoreHomeScreen();
          case DashboardScreen.storeProducts:
            return const DashboardStoreProductsScreen();
          case DashboardScreen.storeOrders:
            return const DashboardStoreOrdersScreen();
          case DashboardScreen.storeCoupons:
            return const DashboardStoreCouponScreen();
          case DashboardScreen.storeSettings:
          case DashboardScreen.settings:
            return const ExampleComingSoon();
        }
      }),
    );
  }
}

enum DashboardScreen {
  home,
  storeProducts,
  storeOrders,
  storeCoupons,
  storeSettings,
  settings,
}
