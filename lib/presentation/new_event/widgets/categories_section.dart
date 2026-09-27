import 'package:evently/common/enums/categories_enum.dart';
import 'package:evently/presentation/home/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  CategoriesEnum selectedCategory = CategoriesEnum.birthDays;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            selectedCategory.getImage,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: CategoriesEnum.values
                .map(
                  (e) => CategoryCard(
                    isSelected: e == selectedCategory,
                    categoriesEnum: e,
                    isWhite: false,
                    onSelect: (p0) {
                      setState(() {
                        if (p0 != null) {
                          selectedCategory = p0;
                        }
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
