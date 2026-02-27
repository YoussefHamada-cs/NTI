import 'package:task1_dart/task1_dart.dart' ;

void main() {
  print(logIn('student', 'iti123', true));
  print(calculateFinalPrice(200, true, false));
  print(examResult(80, 80));
  print(loans(6000, 25, false));
  print(deliveryCost(250, 10));
  print(bonus(yearsOfExperience: 5, rate: 4));
  print(openDoor(hasAccessCard: true, knowsPassword: true));
  print(electricityUsage(electricityUsage: 50));
  print(checkLevel(10, 75));
  print(driver(true, 100, 50));
}
