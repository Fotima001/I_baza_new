import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibaza_second/core/routes/catalog_route.dart';
import '../../core/routes/cart_route.dart';
import '../../core/routes/main_route.dart';
import '../../core/routes/orders_route.dart';
import '../../core/routes/profile_route.dart';
import 'destination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(index: _selectedIndex, children: const [
              DestinationPage(onGenerateRoute: MainRoute.onGenerateRoute),
              DestinationPage(onGenerateRoute: CatalogRoute.onGenerateRoute),
              DestinationPage(onGenerateRoute: OrdersRoute.onGenerateRoute),
              DestinationPage(onGenerateRoute: CartRoute.onGenerateRoute),
              DestinationPage(onGenerateRoute: ProfileRoute.onGenerateRoute),
            ]),
          ),
          BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6), // Add padding around icons
                  child: SvgPicture.asset('assets/icons/navbar/home.svg',
                      width: 24),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6), // Add padding around icons
                  child: SvgPicture.asset('assets/icons/navbar/catalog.svg',
                      width: 24),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6), // Add padding around icons
                  child: SvgPicture.asset('assets/icons/navbar/buyurtma.svg',
                      width: 24),
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20), // Add padding around icons
                  child: SvgPicture.asset('assets/icons/navbar/savat.svg',
                      width: 24),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6), // Add padding around icons
                  child: SvgPicture.asset('assets/icons/navbar/profile.svg',
                      width: 24),
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
          ),
          /* Container(
            width: double.maxFinite,
            height: 70 + MediaQuery.of(context).padding.bottom,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Row(
              children: List.generate(
                5,
                    (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      this.index = index;
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ), */
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
