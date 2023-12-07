void main() {
  final mylist = ["java", "C++", "C", "Dart", "Python", "Flutter", 23];
  print(mylist[0]);
  print(mylist[2 + 1]);
  int i = 0;
  print(mylist[++i]);

  print("Length of my list is: ${mylist.length}");
  mylist.add(12);
  print(mylist);
  mylist.remove(12);
  print(mylist);

  print("Index of C Language is: ${mylist.indexOf("C")}");

  print("\n\tPrint all data using for loop");
  for (var i = 0; i < mylist.length; i++) print(mylist[i]);

  print("\n\tPrint all data in a list using Object Iterate");
  mylist.forEach((i) {
    print(i);
  });
}
