import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:price_table/pages/favouritesPage.dart';
import 'package:price_table/pages/loginPage.dart';
import 'package:price_table/pages/mainPage.dart';
import 'package:price_table/pages/profilePage.dart';
import 'package:price_table/pages/settingPage.dart';
import 'package:price_table/pages/tncPage.dart';
import 'package:price_table/pages/updatePricePage.dart';
import 'package:price_table/pages/viewPricePage.dart';
import 'package:price_table/theme/colors.dart';

class rootApp extends StatefulWidget {
  const rootApp({Key? key}) : super(key: key);

  @override
  State<rootApp> createState() => _rootAppState();
}

class _rootAppState extends State<rootApp> {
  final _advancedDrawerController = AdvancedDrawerController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: advancedDrawerBG,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: true,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: getTitle(),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                }),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.search_outlined),
              ),
            ),
          ],
        ),
        body: getBody(),
        bottomNavigationBar: getFooter(),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: white,
            iconColor: white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.account_circle,
                      size: 120.0,
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const profilePage()),
                    );
                  },
                  leading: const Icon(Icons.account_circle_rounded),
                  title: const Text('Profile'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const favouritesPage()),
                    );
                  },
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favourites'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const settingPage()),
                    );
                  },
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const loginPage(),
                        ),
                        (route) => false);
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        const Text('Terms of Service | Privacy Policy'),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const tncPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    List<Widget> pages = [mainPage(), updatePricePage(), viewPricePage()];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List bottomItems = [
      pageIndex == 0 ? Icons.home_filled : Icons.home_outlined,
      pageIndex == 1 ? Icons.add_circle : Icons.add_circle_outline,
      pageIndex == 2 ? Icons.article : Icons.article_outlined
    ];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(color: themeColor),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
          top: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
              onTap: () {
                selectedTab(index);
              },
              child: Icon(bottomItems[index]),
            );
          }),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

  getTitle() {
    switch (pageIndex) {
      case 0:
        {
          return Text('Price Checkup');
        }
      case 1:
        {
          return Text('Update Price');
        }
      case 2:
        {
          return Text('View Price');
        }
      default:
        {
          return Text('Invalid Page');
        }
    }
  }
}
