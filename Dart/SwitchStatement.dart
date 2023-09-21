// Switch Statement
import 'dart:io';

void main()
{
	stdout.write("Enter the Week day number(1 to 7):");
	int day = int.parse(stdin.readLineSync()!);
	
	switch(day){
	case 1:
		print("Happy Saturday...");
		break;
	case 2:
		print("Enjoy your Monday...");
		break;
	case 3:
		print("Sweet Tuesday...");
		break;
	case 4:
		print("Funny Wednesday...");
		break;
	case 5:
		print("Interesting Thursdays...");
		break;
	case 6:
		print("End Friday...");
		break;
	case 7:
		print("Rest Saturday...");
		break;
	default:
		print("Enter the valid option");
	
	}
}