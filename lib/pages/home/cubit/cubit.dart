import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_responsive/pages/home/cubit/states.dart';
import '../model/carousal_model.dart';
import '../model/items_model.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(InitialState());

    List infoList = [
      ItemsModel(image:'assets/images/man.png',title: 'ولي الأمر'),
      ItemsModel(image: 'assets/images/note.png',title: 'طلب مقابلة'),
      ItemsModel(image: 'assets/images/curriculum.png',title: 'طلب توظيف'),
      ItemsModel(image: 'assets/images/profiles.png',title: 'نماذج'),
      ItemsModel(image: 'assets/images/internet.png',title: 'روابط عامة'),
      ItemsModel(image: 'assets/images/schedule.png',title: 'رزنامة العام'),
      ItemsModel(image: 'assets/images/customer-service.png',title: 'تواصل معنا'),
    ];

    List<CarousalModel> imgList =[
      CarousalModel(image: 'assets/images/third.jpg'),
      CarousalModel(image: 'assets/images/first.jpg'),
      CarousalModel(image: 'assets/images/second.jpg'),
      CarousalModel(image: 'assets/images/fourth.jpg'),
      CarousalModel(image: 'assets/images/fifth.jpg'),

    ];





}