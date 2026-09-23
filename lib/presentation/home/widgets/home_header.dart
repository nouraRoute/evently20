import 'package:evently/common/app_text_styles.dart';
import 'package:evently/common/enums/categories_enum.dart';
import 'package:evently/presentation/home/widgets/category_card.dart';
import 'package:evently/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();

  @override
  Size get preferredSize => Size(AppBar().preferredSize.width, 174);
}

class _HomeHeaderState extends State<HomeHeader> {
  CategoriesEnum? selectedCategory;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Welcome Back ✨",
                      style: theme.textTheme.labelSmall!.copyWith(color: AppColors.lightBgColor),
                    ),
                    Text(
                      "name",
                      style: theme.textTheme.displayLarge!.copyWith(
                        color: AppColors.lightBgColor,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.location_on_outlined, color: AppColors.lightBgColor, size: 20),
                        Text(
                          "address",
                          style: theme.textTheme.titleMedium!.copyWith(
                            color: AppColors.lightBgColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.wb_sunny_outlined, color: AppColors.lightBgColor),
                  ),
                ),
                SizedBox(width: 5),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.lightBgColor,
                      padding: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      "EN",
                      style: AppTextStyles.styleS14W700(color: AppColors.mainColors),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              // height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    isSelected: selectedCategory == null,
                    categoriesEnum: null,
                    isAllCategories: true,
                    onSelect: (p0) {
                      selectedCategory = null;
                      setState(() {});
                    },
                  ),
                  ...CategoriesEnum.values.map(
                    (e) => CategoryCard(
                      categoriesEnum: e,
                      isSelected: selectedCategory == e,
                      onSelect: (p0) {
                        selectedCategory = p0;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//