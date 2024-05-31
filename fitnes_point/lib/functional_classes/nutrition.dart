import 'package:fitnes_point/functional_classes/user.dart';

class Nutrition {
  final Person user;

  Nutrition({
    required this.user,
  });

  Map<String, double> calculateNutrition() {
    double bmr;

    // Calculate BMR
    if (user.gender == 'male') {
      bmr = double.parse((88.362 + (13.397 * user.weight) + (4.799 * user.height) - (5.677 * user.age)).toStringAsFixed(1));
    } else {
      bmr = double.parse((447.593 + (9.247 * user.weight) + (3.098 * user.height) - (4.330 * user.age)).toStringAsFixed(1));
    }

    // Adjust BMR for activity level
    double calories;
    switch (user.activityLevel) {
      case 'low':
        calories = double.parse((bmr * 1.2).toStringAsFixed(1));
        break;
      case 'moderate':
        calories = double.parse((bmr * 1.375).toStringAsFixed(1));
        break;
      case 'medium':
        calories = double.parse((bmr * 1.55).toStringAsFixed(1));
        break;
      case 'high':
        calories = double.parse((bmr * 1.725).toStringAsFixed(1));
        break;
      case 'very high':
        calories = double.parse((bmr * 1.9).toStringAsFixed(1));
        break;
      default:
        calories = double.parse((bmr * 1.2).toStringAsFixed(1));
    }

    // Adjust calories for goal
    if (user.goal == 'weight loss') {
      calories -= 500; // Subtract 500 kcal for weight loss
    } else if (user.goal == 'weight gain') {
      calories += 500; // Add 500 kcal for weight gain
    }

    // Calculate macronutrients
    double protein = double.parse((1.6 * user.weight).toStringAsFixed(1));
    double fat = double.parse((0.9 * user.weight).toStringAsFixed(1));
    double caloriesFromProtein = protein * 4;
    double caloriesFromFat = fat * 9;
    double remainingCalories = calories - (caloriesFromProtein + caloriesFromFat);
    double carbohydrates = double.parse((remainingCalories / 4).toStringAsFixed(1));

    // Calculate fiber, sugar, and salt
    double fiber = double.parse(((14 * calories) / 1000).toStringAsFixed(1));
    double sugar = double.parse((0.1 * calories / 4).toStringAsFixed(1));
    double salt = 6;

    return {
      'calories': calories,
      'protein': protein,
      'fat': fat,
      'carbohydrates': carbohydrates,
      'fiber': fiber,
      'sugar': sugar,
      'salt': salt,
    };
  }
}