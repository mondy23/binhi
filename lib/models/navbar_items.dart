
class NavbarItem {
  final String icon;
  final String title;
  final String route;

  const NavbarItem({
    required this.icon,
    required this.title,
    required this.route,
  });

  factory NavbarItem.fromJson(Map<String, dynamic> json) {
    return NavbarItem(
      icon: json['icon'],
      title: json['title'],
      route: json['route'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'title': title,
      'route': route,
    };
  }
}
