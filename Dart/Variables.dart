// Variable's
import 'dart:io';

void main()
{
	var name = "Karthikeyan A";
	
	stdout.write("Please enter your age: "); // get the input in the same line.
	final int age = int.parse(stdin.readLineSync()!);

	dynamic myThings;
	myThings = ["Dart", "JAVA", "Flutter"];

	print("\n\n\tAbout me");
	print("My name is ${name}");
	print("My age is ${age}");
	const String interest = "Dart Programming and Flutter Dev.";
	print("my Interest is ${interest}");
	print("My Skills are ${myThings}");
	myThings = 2021;
	print("I started my Computer Science journey in ${myThings}");
	

	late String lateVariable; // Declare a late variable

	print("Before assignment");
  
  // Simulate some logic that assigns a value to lateVariable
	Future.delayed(Duration(seconds: 2), () {
		lateVariable = 'Initialized later';
		print("Value assigned to lateVariable");
  	});

  // Attempting to use lateVariable before it's assigned would result in a runtime error
  // Uncommenting this line would lead to a late initialization error:
  // print("Late variable value: $lateVariable");

  // Wait for the value to be assigned using a Future
  	Future.delayed(Duration(seconds: 3), () {
      		print("Late variable value: $lateVariable");
    	});

}