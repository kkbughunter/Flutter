// Looping and Control Statements in Dart

void main()
{
	List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sundays"];

	print("\n\n\tDays in a week (using for loop)");

	for(int i=0; i<days.length; i++){
		print((i + 1).toString() +  "   " + days[i]);
	}

	print("\n\n\tDays in a week (using for While)");

	int i = days.length-1;
	while(i > 0){
		print((i + 1).toString() +  "   " + days[i]);
		i--;
	}
	
	print("\n\n\tDays in a week (using for Do-While)");

	i = days.length-1;
	do{
		print((i + 1).toString() +  "   " + days[i]);
		i--;
	}while(i >= 0);
	
}