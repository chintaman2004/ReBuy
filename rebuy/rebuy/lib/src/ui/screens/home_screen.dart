// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../routes/app_routes.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track selected bottom nav

  void _onNavTap(int index) {
    setState(() => _selectedIndex = index);

    // Navigation handling
    switch (index) {
      case 0:
        Get.offAllNamed(Routes.home); // Home
        break;
      case 1:
        Get.toNamed(Routes.cart ?? '/cart'); // Example shopping/cart route
        break;
      case 2:
        Get.toNamed(Routes.favorites ?? '/favorites'); // Example favorites
        break;
      case 3:
        Get.toNamed(Routes.profile ?? '/profile'); // Example profile
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 420),
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                      backgroundColor: Color(0xFFEFEFEF),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hey Alice',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black87)),
                          SizedBox(height: 2),
                          Text('Welcome back!',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFFFF5F6D))),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Get.toNamed(Routes.sidebar),
                      icon: const Icon(Icons.menu_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // SEARCH
                const _SearchField(),
                const SizedBox(height: 14),

                // NEW ARRIVALS
                const _SectionHeader(title: 'New arrivals'),
                const SizedBox(height: 8),
                SizedBox(
                  height: 220,
                  child: Obx(() {
                    if (c.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final items = c.products;
                    if (items.isEmpty) {
                      return const Center(child: Text('No products'));
                    }
                    // limit to 10
                    final newArrivals = items.take(10).toList();
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 4),
                      itemCount: newArrivals.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) {
                        final p = newArrivals[i];
                        return _ProductCard(
                          title: p.title,
                          meta: '2018 | FunSkool',
                          price: '₹ ${p.price.toStringAsFixed(0)}',
                          onTap: () =>
                              Get.toNamed(Routes.product, arguments: p.id),
                        );
                      },
                    );
                  }),
                ),
                const SizedBox(height: 14),

                // RECENTLY VIEWED
                const _SectionHeader(title: 'Recently viewed'),
                const SizedBox(height: 8),
                Expanded(
                  child: Obx(() {
                    if (c.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final items = c.products;
                    // limit to 25
                    final recentlyViewed = items.take(25).toList();
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: recentlyViewed.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, i) {
                        final p = recentlyViewed[i];
                        return CardTile(
                          child: Row(
                            children: [
                              Container(
                                width: 96,
                                height: 72,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF2F2F2),
                                  borderRadius: G.r16,
                                ),
                                child: const Icon(Icons.image_rounded),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(p.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 4),
                                    Text(p.description,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: AppColors.subtext)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),

      // BOTTOM DOCK
      bottomNavigationBar: _BottomDock(
        selectedIndex: _selectedIndex,
        onTap: _onNavTap,
      ),
    );
  }
}

// --- Widgets ---------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search products...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFF2F2F2),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
    );
  }
}

class _BottomDock extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const _BottomDock({required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF2E2E2E),
                borderRadius: BorderRadius.circular(28),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _DockIcon(
                      icon: Icons.home_filled,
                      selected: selectedIndex == 0,
                      onTap: () => onTap(0)),
                  _DockIcon(
                      icon: Icons.shopping_bag_outlined,
                      selected: selectedIndex == 1,
                      onTap: () => onTap(1)),
                  const SizedBox(width: 56),
                  _DockIcon(
                      icon: Icons.favorite_border,
                      selected: selectedIndex == 2,
                      onTap: () => onTap(2)),
                  _DockIcon(
                      icon: Icons.person_outline,
                      selected: selectedIndex == 3,
                      onTap: () => onTap(3)),
                ],
              ),
            ),
            Positioned(
              bottom: 28 - 24,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.camera_alt_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DockIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _DockIcon(
      {required this.icon, this.selected = false, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected ? Colors.blue : Colors.white70, // Blue when selected
      ),
    );
  }
}

// Product card widget for horizontal product list
class _ProductCard extends StatelessWidget {
  final String title;
  final String meta;
  final String price;
  final VoidCallback onTap;

  const _ProductCard({
    required this.title,
    required this.meta,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image_rounded, size: 40),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                meta,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
