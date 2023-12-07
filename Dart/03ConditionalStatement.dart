// Conditional and 
import 'dart:io';
void main()
{


	stdout.write("Enter the integer value: ");
	int a = int.parse(stdin.readLineSync()!);

	// else
	if(a%2 == 0){
		print("\t${a}...Even...");
	}
	else{
		print("\t${a}...Odd...");
	}

	// else-if
	if(a < 0){
		print("\t${a} is Negative");
	}
	else if(a > 0){
		print("\t${a} is Positive");
	}
	else{
		print("\t${a} is Zero");
	}
	
}




