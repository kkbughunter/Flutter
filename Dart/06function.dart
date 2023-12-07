main() {
  print("This is for function.");
  myfunction();
  const firstname = "karthikeyan";
  const lasttname = "A";
  final fullname = getmyfullname(firstname, lasttname);

  print("This is my full name: $fullname");
  print("This is my age: ${getmyage(2000, 2023)}");

  myinformation();
}

void myfunction() {
  var value = "my value inside the my function";
  print(value);
}

String getmyfullname(String firstname, String lastname) {
  return firstname + " " + lastname;
}

int getmyage(int year, int current_year) {
  if (current_year > year)
    return current_year - year;
  else
    return -1;
}

void myinformation() {
  print("This is my full name: ${getmyfullname("karthikeyan", "A")}");
  print("This is my age: ${getmyage(2000, 2023)}");
}
