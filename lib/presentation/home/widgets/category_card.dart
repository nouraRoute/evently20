import 'package:evently/common/app_text_styles.dart';
import 'package:evently/common/enums/categories_enum.dart';
import 'package:evently/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.isSelected,
    required this.categoriesEnum,
    this.isAllCategories = false,
    required this.onSelect,
  });
  final CategoriesEnum? categoriesEnum;
  final bool isSelected;
  final bool isAllCategories;
  final Function(CategoriesEnum?) onSelect;
  // final String? label;
  // final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        onSelected: (value) {
          onSelect(categoriesEnum);
        },
        label: Row(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isAllCategories ? Icons.explore_outlined : categoriesEnum?.getIcon,
              color: isSelected ? theme.cardColor : AppColors.lightBgColor,
            ),
            Text(
              isAllCategories ? "All" : categoriesEnum?.title ?? "",
              style: AppTextStyles.styleS16W500(
                color: isSelected ? theme.cardColor : AppColors.lightBgColor,
              ),
            ),
          ],
        ),
        selected: isSelected,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: theme.shadowColor),
          borderRadius: BorderRadius.circular(46),
        ),
        selectedColor: theme.shadowColor,
        backgroundColor: theme.cardColor,
        showCheckmark: false,
      ),
    );
  }
}
