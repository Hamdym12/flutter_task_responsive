part of'home_screen_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    final appBar = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return BlocProvider<HomeCubit>(
      create: (BuildContext context)=>HomeCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: buildAppBarUI(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(height: (mQ.height -appBar -statusBarHeight) *0.025,),
                const BuildCarouselSlider(),
                SizedBox(height: (mQ.height -appBar -statusBarHeight) *0.025,),
                 BuildGridWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBarUI(){
    return AppBar(
      elevation: 0,
      leading:  const Icon(
        CupertinoIcons.book,
        color: AppColors.white,
        size: 30,
      ),
      centerTitle: true,
      title: const Text(
        "الرئيسية",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18
        ),
      ),
      backgroundColor: AppColors.primaryBabyBlue,

      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            Icons.logout_outlined,
            size: 30,
            color: AppColors.white,
          ),
        )
      ],
    );
  }


}
