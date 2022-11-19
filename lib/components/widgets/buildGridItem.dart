import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_responsive/app/app_colors.dart';
import 'package:flutter_task_responsive/pages/home/cubit/cubit.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class BuildGridWidget extends StatelessWidget {
   BuildGridWidget({Key? key}) : super(key: key);

  int? currentIndex;
  final appBar = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final controller = BlocProvider.of<HomeCubit>(context);
    bool isOdd = controller.infoList.length % 2 != 0;
    return SizedBox(
      height: isPortrait
          ? (mQ.height - appBar - statusBarHeight ) * 0.625
          : (mQ.height - appBar - statusBarHeight) * 0.4,
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.only(top: isPortrait ? 5 : 10),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        crossAxisCount: isPortrait ? 2 : 4,
        mainAxisSpacing: 30,
        itemCount: controller.infoList.length,
        itemBuilder: (context, index) {
          currentIndex = index;
          return buildListItem(context);
        },
        staggeredTileBuilder: (index) {
          bool isLast = index == controller.infoList.last;
          return StaggeredTile.count(
            (isLast && isPortrait && isOdd) ? 2 :
            (controller.infoList.length - 1 == index) ? 2 : 1,
            0.72,
          );
        },
      ),
    );
  }

  Widget buildListItem(context) {
    final controller = BlocProvider.of<HomeCubit>(context);
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryBabyBlue, width: 3.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 6, top: 3),
              child: Image.asset(
                controller.infoList[currentIndex!].image,
                height: 65,
                width: 55,
                color: AppColors.primaryBabyBlue,
              )),
          Text(
            controller.infoList[currentIndex!].title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

}

