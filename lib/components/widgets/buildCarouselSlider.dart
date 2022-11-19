import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../pages/home/cubit/cubit.dart';

class BuildCarouselSlider extends StatelessWidget {
  BuildCarouselSlider({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    final appBar = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final controller = BlocProvider.of<HomeCubit>(context);
    return SizedBox(
        height: !isLandScape
            ? (mQ.height - appBar - statusBarHeight)  * 0.325
            : (mQ.height - appBar - statusBarHeight) * 0.55,
        child: CarouselSlider(
          items: controller.imgList
              .map((value) => Image(
                    image: AssetImage(value.image),
                    width: double.infinity,
                    fit: !isLandScape ? BoxFit.fitHeight : BoxFit.contain,
                  ))
              .toList(),
          options: CarouselOptions(
              reverse: false,
              initialPage: 0,
              autoPlay: true,
              height: 200,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal),
        ));
  }
}
