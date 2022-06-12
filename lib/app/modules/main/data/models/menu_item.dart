import 'package:flutter_starter_template_with_bloc/app/modules/main/data/models/menu_code.dart';

class BottomNavItem {
  final String navTitle;
  final String iconSvgName;
  final MenuCode menuCode;

  const BottomNavItem(
      {required this.navTitle,
        required this.iconSvgName,
        required this.menuCode});
}
