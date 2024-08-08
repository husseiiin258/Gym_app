import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerPlaceholder() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Row(
            children: [
              Container(
                color: Colors.grey[200],
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100, 
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.grey[400],
                        height: 20, 
                        width: 100,  
                      ),
                      const SizedBox(height: 10),
                      Container(
                        color: Colors.grey[400],
                        height: 16,  
                        width: 150, 
                      ),
                      const SizedBox(height: 10),
                      Container(
                        color: Colors.grey[400],
                        height: 16, 
                        width: 150,  
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Colors.grey[400],
                        height: 24, 
                        width: 80,  
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
