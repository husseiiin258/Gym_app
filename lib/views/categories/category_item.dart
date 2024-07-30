import 'package:flutter/material.dart';


import 'category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel ;
  final int index;
  final Function onItemClick;
  const CategoryItem({required this.categoryModel , required this.index , required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onItemClick(categoryModel);

      },
      child: Container(
        padding: EdgeInsets.all(10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomRight: index %2 ==0 ? Radius.circular(0) : Radius.circular(25),
            bottomLeft: index %2 ==0 ? Radius.circular(25) : Radius.circular(0),
          ),
          color: categoryModel.CategoryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(categoryModel.CategoryImage),



            Text(categoryModel.CategoryTitle , style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ],),
      ),
    );
  }
}
