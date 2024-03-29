import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1,
                autoPlay: true,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            '$index',
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
