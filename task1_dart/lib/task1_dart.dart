// Quiz1: Login System
String logIn(String username, String password, bool isAccountActive) {
  if (username == 'student' && password == 'iti123' && isAccountActive) {
    return "Login successful!";
  } else {
    return "Access Denied!";
  }
}

//` Quiz2: Discount Calculator
num calculateFinalPrice(num productPrice, bool isPremium, bool hasCoupon) {
  if (isPremium || hasCoupon) {
    productPrice *= 0.85;
  }

  return productPrice;
}

// Quiz3: Exam Result
String examResult(int examScore, double attendancePercentage) {
  if (examScore >= 50 && attendancePercentage >= 75) {
    return "Passed";
  } else {
    return "Failed";
  }
}

// Quiz4: Loan Eligibility
String loans(int salary, int age, bool hasExistingLoan) {
  if (salary >= 5000 && age >= 21 && age <= 60 && !hasExistingLoan) {
    return "Loan approved";
  } else {
    return "Loan rejected";
  }
}

// Quiz5: Delivery Cost Calculator
int deliveryCost(int orderAmount, int distance) {
  if (orderAmount >= 300) {
    return orderAmount;
  } else {
    return orderAmount + distance * 5;
  }
}

// Quiz6: Bonus Eligibility
String bonus({required int yearsOfExperience, int rate = 0}) {
  if (yearsOfExperience >= 3 && (rate == 4 || rate == 5)) {
    return "Bonus Granted";
  } else {
    return "No Bonus";
  }
}

// Quiz7: Access Control
String openDoor({required bool hasAccessCard, required bool knowsPassword}) =>
    (hasAccessCard && knowsPassword) ? 'Door opened' : 'Access Restricted';
// Quiz8: Electricity Usage
String electricityUsage({required int electricityUsage}) {
  if (electricityUsage < 200) {
    return "Low Consumption";
  } else if (electricityUsage <= 500) {
    return "Medium Consumption";
  } else {
    return "High Consumption";
  }
}

// Quiz9: Level Unlocking
String checkLevel(int completedLessons, int quizScore) =>
    (completedLessons >= 10 && quizScore >= 70)
    ? 'Level Unlocked'
    : 'Complete Requirements';
// Quiz10: Ride Sharing
String driver(bool driverAvailability, int userBalance, int rideCost) {
  if (driverAvailability && userBalance >= rideCost) {
    return 'Ride Confirmed';
  } else {
    return 'Insufficient Conditions';
  }
}
