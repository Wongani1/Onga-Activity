import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';

final String tableUser = 'user';
final String columnId = '_id';
final String columnName = 'name';
final String columnPhone = 'phone';
final String columnEmail = 'email';
final String columnCategory = 'category';
final String columnDescription = 'description';
final String columnDate = 'date';
final String columnComment = 'comment';
final String columnRating = 'rating';
final String columnDone = 'done';
final String columnReview = 'review';
final String tableSleep = 'sleep';
final String tableStudy = 'study';
final String tableEating = 'eating';
final String tableMotivation = 'motivation';
final String tableDance = 'dance';
final String tableExercise = 'exercise';
final String tableHygiene = 'hygiene';
final String tableLanguage = 'language';
final String tableHealth = 'health';
final String tableRelax = 'relax';
final String tableMoney = 'money';
final String tablePriority = 'priority';
final String tableMusic = 'music';
final String tableDressing = 'dressing';
final String tableEquipment = 'equipment';

showProgress() {
  return ProgressHUD(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.black38,
    borderRadius: 5.0,
    text: 'Loading...',
  );
}
