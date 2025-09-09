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
  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED), // outer grey like mock
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
                // HEADER (avatar + greeting + menu)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                          'assets/images/placeholder.txt'), // replace with real avatar
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

                // SEARCH (pill)
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
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(right: 4),
                      itemCount: items.length.clamp(0, 10),
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) {
                        final p = items[i];
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
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, i) {
                        final p = items[i];
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

      // BOTTOM DOCK (rounded, with center camera)
      bottomNavigationBar: const _BottomDock(),
    );
  }
}

// --- Widgets ---------------------------------------------------------------

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for books, guitar and more…',
        hintStyle: const TextStyle(color: Color(0xFF9AA0A6)),
        prefixIcon: const Icon(Icons.search_rounded),
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.black87)),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'View more',
            style: TextStyle(fontSize: 12, color: AppColors.subtext),
          ),
        ),
      ],
    );
  }
}

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
    return SizedBox(
      width: 220,
      child: CardTile(
        padding: const EdgeInsets.all(0),
        child: InkWell(
          borderRadius: G.r20,
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image area
              Container(
                height: 130,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFFFFF0B3), // warm yellow like mock
                ),
                child: const Center(child: Icon(Icons.image_rounded, size: 48)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700)),
                          const SizedBox(height: 2),
                          Text(meta,
                              style: const TextStyle(
                                  fontSize: 11, color: AppColors.subtext)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(price,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14)),
                        const SizedBox(height: 6),
                        Container(
                          height: 28,
                          width: 28,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.favorite_border, size: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomDock extends StatelessWidget {
  const _BottomDock();

  @override
  Widget build(BuildContext context) {
    // fake nav items to match mock
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // rounded bar
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFF2E2E2E),
                borderRadius: BorderRadius.circular(28),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _DockIcon(icon: Icons.home_filled, selected: true),
                  _DockIcon(icon: Icons.shopping_bag_outlined),
                  SizedBox(width: 56), // space for camera
                  _DockIcon(icon: Icons.favorite_border),
                  _DockIcon(icon: Icons.person_outline),
                ],
              ),
            ),
            // center camera button
            Positioned(
              bottom: 28 - 24, // make it overlap nicely
              child: GestureDetector(
                onTap: () {}, // hook if needed
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
  const _DockIcon({required this.icon, this.selected = false});
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: selected ? Colors.white : Colors.white70,
    );
    // You can wrap with GestureDetector and route via Get.toNamed(...) if needed
  }
}
