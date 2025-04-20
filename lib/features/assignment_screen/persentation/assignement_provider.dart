import 'package:flutter/cupertino.dart';

import '../../../utils/strings.dart';

class AssignmentProvider extends ChangeNotifier{

  List<String> listOfItem =[
    Strings.dPR,
    Strings.cashOutFlow,
    Strings.cashInFlow,
    Strings.materialIssues,
    Strings.mReconciliation,
    Strings.materialReceipt,
    Strings.goToDashboard,

  ];

  final PageController pageController = PageController(viewportFraction: 0.7);
  int currentPage = 1;

  final List<String> imageUrls = [
    "https://images.unsplash.com/photo-1568605114967-8130f3a36994",
    "https://images.unsplash.com/photo-1568605114967-8130f3a36994",
    "https://images.unsplash.com/photo-1568605114967-8130f3a36994",
  ];

  final List<String> imageNames = [
    "Project BedRock",
    "Crane Heights",
    "Steel Tower",
  ];
  setCurrentPage(int index){
   currentPage=index;
   notifyListeners();
  }
}