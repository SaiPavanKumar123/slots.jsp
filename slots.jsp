<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendar with Slots</title>
    <style>
        /* Add your CSS styling here */
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 0 auto;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        td.day {
            cursor: pointer;
            background-color: #e6e6e6;
        }
        .slots {
            display: none;
        }
        .date-even {
            background-color: #e2f4e6; /* Background color for even dates */
        }
        .date-odd {
            background-color: #f4e6e2; /* Background color for odd dates */
        }
    </style>
</head>
<body>
    <h1 style="font-style:times-roman;">Slots</h1>
    <table>
        <thead>
            <tr class="table-primary">
                <th>Sunday</th>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th>
                <th>Thursday</th>
                <th>Friday</th>
                <th>Saturday</th>
            </tr>
        </thead>
        <tbody>
            <!-- JSP code to generate the calendar -->
            <%
                java.util.Calendar calendar = java.util.Calendar.getInstance();
                for (int i = 0; i < 30; i++) {
                    // Create a new cell for each day
                    out.print("<td class='day ");
                    out.print(i % 2 == 0 ? "date-even" : "date-odd");
                    out.print("'>" + calendar.get(java.util.Calendar.DAY_OF_MONTH) + "</td>");

                    // Move to the next day
                    calendar.add(java.util.Calendar.DAY_OF_MONTH, 1);

                    // Start a new row if it's Sunday
                    if (calendar.get(java.util.Calendar.DAY_OF_WEEK) == java.util.Calendar.SUNDAY) {
                        out.println("</tr><tr>");
                    }
                }
            %>
        </tbody>
    </table>

    <div id="slots" class="slots">
        <!-- Slots and selected options will be displayed here -->
        <h2>Slots for <span id="selected-date"></span></h2>
        <select id="slot-options">
            <!-- Options will be dynamically populated using JSP or Java -->
            <%
                // Sample options (replace with your actual data)
                String[] sampleOptions = {"Option 1", "Option 2", "Option 3"};
                for (String option : sampleOptions) {
                    out.println("<option>" + option + "</option>");
                }
            %>
        </select>
    </div>
</body>
</html>
    
