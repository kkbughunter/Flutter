void main()
{	
	print("\t#\b...Welcome to Data Types Section...");
	int a = 10;
	print("This is the updated value of the A (int): ${a+10}");

	double b = 534.379; // 'float' isn't a type.
	print("This is the updated value of the B (float): ${b+10}");

	String c = "My name is ${"Karhtikeyan A"}, My Age is: ${a+9}"; // 'float' isn't a type.
	print("This is the value of the C (String): ${c}");

	bool status = true;
	print("My Marriage Status is: ${status}");

	List<int> myMark = [85,97,100,58,90]; 
	print("This is the updated value of the B (List): ${myMark}");

	Map<String,List<String>> otherAct = {"Skills": ["Dart", "Flutter", "Java"],"hobby":["Cooking","Learning"]};
	print("This is my Other info (Map): ${otherAct}");

	// ``dynamic`` Data Type:
	print("\n\t Dynamic Data Type");
	dynamic myVariable = 42; // Assign an integer to a dynamic variable
	print(myVariable); // Prints: 42
	
	myVariable = "Hello, Dart!"; // Change the type to a string
	print(myVariable); // Prints: Hello, Dart!
	
	myVariable = [1, 2, 3]; // Change the type to a list
	print(myVariable); // Prints: [1, 2, 3]

	// Using the `var` keyword for type inference
	print("\n\t Var Data Type");
	
	var myVariable2 = 42; // Dart infers that myVariable2 is of type int
	print(myVariable2); // Prints: 42
	
	// You cannot change the type of myVariable2 after inference
	// myVariable2 = "Hello, Dart!"; // This would cause a compile-time error
	
	// However, you can assign values of the same inferred type
	myVariable2 = 100; // Assigning another integer
	print(myVariable2); // Prints: 100
	

}




