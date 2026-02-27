
String logIn(String username , String password,bool isAccountActive ){
  
 
if (username=='student'&&password=='iti123'&&isAccountActive) {

  return "Login successful!";
}else{

  return "Access Denied!";
}

}
num calculateFinalPrice(num productPrice,bool  isPremium,bool hasCoupon){
 
  if (isPremium || hasCoupon) {
    productPrice *=0.85 ; 
  }
  
  return productPrice;
 
}
String examResult(int examScore, double attendancePercentage){
  if (examScore>=50&&attendancePercentage>=75) {
    return "Passed";
  } else {
    return "Failed";
  }

}
String loans(int salary,int age,bool hasExistingLoan){
  if (salary>=5000&&age>=21&&age<=60&&!hasExistingLoan) {
    return "Loan approved";
  } else {
    return "Loan rejected";
  }
}
int deliveryCost(int orderAmount,int distance){
  if (orderAmount>=300) {
    return orderAmount;
  } else {
    return orderAmount+distance*5;
  }
}

String bonus({required int yearsOfExperience, int rate=0}){
  if (yearsOfExperience>=3&&(rate==4||rate==5)) {
    return "Bonus Granted";
  } else {
    return "No Bonus";
  }
}
String openDoor({required bool hasAccessCard,required bool knowsPassword})=>
  (hasAccessCard&&knowsPassword)? 'Door opened':'Access Restricted';

String electricityUsage({required int electricityUsage }) {
  if (electricityUsage < 200) {
    return "Low Consumption";
  } else if ( electricityUsage <=500) {
    return "Medium Consumption";
  } else {
    return "High Consumption";
  }
}

String checkLevel(int completedLessons,int quizScore)=>
  (completedLessons>=10&&quizScore>=70)? 'Level Unlocked':'Complete Requirements';

String driver(bool driverAvailability,int userBalance,int rideCost){
  if (driverAvailability&&userBalance>=rideCost) {
    return 'Ride Confirmed';
  } else {
    return 'Insufficient Conditions';
  }
}
