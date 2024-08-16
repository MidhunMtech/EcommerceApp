<cfscript>
    // Set the month and year in MM/YY format
    inputMonth = 12;
    inputYear = 2024;

    // Create a date object for the input date (set the day as 1)
    inputDate = createDate(inputYear, inputMonth, 1);
    writeDump(inputDate);
    abort;

    // Get today's date
    today = now();

    // Compare the dates
    if (inputDate > today) {
        result = "The date 12/24 is greater than today.";
    } else if (inputDate < today) {
        result = "The date 12/24 is less than today.";
    } else {
        result = "The date 12/24 is equal to today.";
    }

    // Output the result
    writeOutput(result);
</cfscript>
