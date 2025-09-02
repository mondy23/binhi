import 'package:binhi/core/constants.dart';
import 'package:binhi/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavBar extends ConsumerStatefulWidget {
  const NavBar({super.key});
  @override
  ConsumerState<NavBar> createState() => _NavBarState();
}

class _NavBarState extends ConsumerState<NavBar> {
  @override
  Widget build(BuildContext context) {
    final isOpen = ref.watch(isNavBarOpenProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isOpen ? 264 : 68,
        child: Drawer(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 56, bottom: 48),
                color: drawer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedScale(
                      scale: isOpen ? 1.0 : 0.7,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Image.asset(
                        'assets/icons/logo.png',
                        width: 37.48,
                        height: 47,
                        fit: BoxFit.contain,
                      ),
                    ),
          
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: isOpen
                          ? Padding(
                              padding: const EdgeInsets.only(
                                top: 16.0,
                                left: 8,
                              ),
                              child: Text(
                                'Binhi',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              Expanded(child: NavBarItems(isOpen: isOpen)),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarItems extends ConsumerWidget {
  final bool isOpen;
  const NavBarItems({super.key, required this.isOpen});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarItems = ref.watch(navbarItemsProvider);
    final router = GoRouter.of(context);
    final routeMatches = router.routerDelegate.currentConfiguration;
    final currentRoute = routeMatches.isNotEmpty
        ? routeMatches.last.route.path
        : '';

    return navbarItems.when(
      data: (items) {
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
             final bool isSelected = currentRoute == items[index].route;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  context.go(items[index].route);
                },
                child: AnimatedContainer(
                  duration: Duration(microseconds: 300),
              
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: isSelected ? Color(0xffefefef) : Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      // Fixed icon
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: Image.asset(
                          items[index].icon,
                          color: isSelected ? Colors.black : Color(0xff707070),
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Smooth spacing
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isOpen ? 12 : 0,
                      ),

                      // Fade-in/out text with fixed space
                      Flexible(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          switchInCurve: Curves.easeInOut,
                          switchOutCurve: Curves.easeInOut,
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: isOpen
                              ? SizedBox(
                                  key: ValueKey(items[index].title),
                                  width: 120,
                                  child: Text(
                                    items[index].title,
                                    style: TextStyle( color: isSelected ? Colors.black : Color(0xff707070),),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("Error: $err")),
    );
  }
}
