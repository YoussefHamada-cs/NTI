class Task2Dart {
  final List<String> _nameStudents = ['Youssef', 'Ahmed', 'Amgad', 'Ali', 'Mohamed'];

  void problem1() {
  for (String studentName in _nameStudents) {
      print(studentName);
    }
  }
 void problem2(String name ) {
    
    for (String studentName in _nameStudents) {
      if (studentName == name) {
        print(studentName);
      }
    }
  }
 void problem3() {
    for (String studentName in _nameStudents) {
      if (studentName.startsWith('A')) {
        print(studentName);
      }
    }
  }
  void problem4() {
    for (int i = 0; i < 5; i++) {
      print(i);
    }
  }
void  problem5() {
    for (int i = 0; i < 5; i++) {
      if (i == 2) {
        continue;
      }
      print(i);
    }
  }
  void problem6() {
    for (int i = 0; i < 5; i++) {
      if (i % 2 != 0) {
        print('Odd: $i');
      }
    }
  }
  void problem7() {
    for (int i = 0; i < 5; i++) {
      if (i % 2 == 0) {
        print('Even: $i');
      } 
    }
  }
  void problem8() {
    int i = 0;
   while (i < 5) {
      print(i);
      i++;
    }
  }
  void problem9() {
    int i = 0;
   do {
      print(i);
      i++;
    } while (i < 5);
  }
  void problem10() {
    for (int i = 0; i < 5; i++) {
      if (i == 3) {
        break;
      }
      print(i);
    }
  }
}