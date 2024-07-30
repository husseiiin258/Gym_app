import 'package:flutter/material.dart';

import 'category_details.dart';
import 'category_item.dart';
import 'category_model.dart';

class AllCategories extends StatefulWidget {
  static const String routeName = 'home';

  AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategories();
}

class _AllCategories extends State<AllCategories> {
  List<CategoryModel> categories = [
    CategoryModel(
      CategoryId: "chest",
      CategoryTitle: "Chest",
      CategoryImage: "assets/images/exercising-2831679_640.webp",
      CategoryColor: Color(0xff7A78F8),
    ),
    CategoryModel(
      CategoryId: "back",
      CategoryTitle: "Back",
      CategoryImage: "assets/images/back.webp",
      CategoryColor: Color(0xff7A78F8),
    ),
    CategoryModel(
      CategoryId: "shoulder",
      CategoryTitle: "Shoulder",
      CategoryImage: "assets/images/shoulder2.webp",
      CategoryColor: Color(0xff7A78F8),
    ),
    CategoryModel(
      CategoryId: "arm",
      CategoryTitle: "Arm",
      CategoryImage: "assets/images/fitness-6995550_640.webp",
      CategoryColor: Color(0xff7A78F8),
    ),
    CategoryModel(
      CategoryId: "leg",
      CategoryTitle: "Leg",
      CategoryImage: "assets/images/leg2.webp",
      CategoryColor: Color(0xff7A78F8),
    ),

  ];

  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      height: mediaQuery.height,
      width: mediaQuery.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "ALL CATEGORIES",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 22,
              ),
            ),
            backgroundColor: Color(0xff7A78F8),
          ),
        ),
        body: selectedCategory == null
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 25, top: 30),
              child: const Text(
                "Pick your category \nof interest",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4F5A69),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 5 / 7),
                itemBuilder: (context, index) => CategoryItem(
                  onItemClick: onCategoryItemClick,
                  index: index,
                  categoryModel: categories[index],
                ),
                itemCount: categories.length,
              ),
            ),
          ],
        )
            : CategoryDetailsView(categoryModel: selectedCategory! , catId: selectedCategory!.CategoryId, )
        // Placeholder for when a category is selected
      ),
    );
  }

  void onCategoryItemClick(CategoryModel categoryModel) {
    print(categoryModel.CategoryId);
    selectedCategory= categoryModel;

    setState(() {});
  }

  void onDrawerCategoryClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

