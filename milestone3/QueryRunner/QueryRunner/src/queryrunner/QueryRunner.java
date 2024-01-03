/** Team 04
 *  @author Grace Li, Phubeth Mettaprasert, Michi Tsuji, Nicholas McNamara
 * CPSC 5021, Seattle University
 * This project is written to connect to mySQL and display queries on a
 * specified database. There are both a console version and a GUI version.
 */
package queryrunner;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * QueryRunner takes a list of Queries that are initialized in its constructor
 * and provides functions that will call the various functions in the QueryJDBC class
 * which will enable MYSQL queries to be executed. It also has functions to provide the
 * returned data from the Queries. Currently the eventHandlers in QueryFrame call these
 * functions in order to run the Queries.
 */
public class QueryRunner {

    
    public QueryRunner()
    {
        this.m_jdbcData = new QueryJDBC();
        m_updateAmount = 0;
        m_queryArray = new ArrayList<>();

        //Added a query descript array to store the description to be used in
        //the GUI implementation
        m_queryDescriptArray = new ArrayList<>();

        m_error="";
    
        
        // TODO - You will need to change the queries below to match your queries.
        
        // You will need to put your Project Application in the below variable
        
        this.m_projectTeamApplication="PetDB";    // THIS NEEDS TO CHANGE FOR
        // YOUR APPLICATION
        
        // Each row that is added to m_queryArray is a separate query. It does not work on Stored procedure calls.
        // The 'new' Java keyword is a way of initializing the data that will be added to QueryArray. Please do not change
        // Format for each row of m_queryArray is: (QueryText, ParamaterLabelArray[], LikeParameterArray[], IsItActionQuery, IsItParameterQuery)
        
        //    QueryText is a String that represents your query. It can be anything but Stored Procedure
        //    Parameter Label Array  (e.g. Put in null if there is no Parameters in your query, otherwise put in the Parameter Names)
        //    LikeParameter Array  is an array I regret having to add, but it is necessary to tell QueryRunner which parameter has a LIKE Clause. If you have no parameters, put in null. Otherwise put in false for parameters that don't use 'like' and true for ones that do.
        //    IsItActionQuery (e.g. Mark it true if it is, otherwise false)
        //    IsItParameterQuery (e.g.Mark it true if it is, otherwise false)
        //





        // Query 1: This query shows invoice information and its associated
        // owner information for invoice amounts greater than the average
        // invoice amount, ordered by invoice ID. (uses sub query, various joins)
        m_queryDescriptArray.add("Query 1: This query shows invoice information and its associated" +
                " owner information for invoice amounts greater than the average" +
                " invoice amount, ordered by invoice ID. (uses sub query, various joins)");
        m_queryArray.add(new QueryData(
                "SELECT DISTINCT I.INVOICE_ID, I.INVOICE_DESCRIPTION, I.INVOICE_COST, " +
                        "O.OWNER_ID, O.OWNER_LNAME, O.OWNER_FNAME " +
                        "FROM OWNER AS O RIGHT JOIN PET AS P ON O.OWNER_ID = P.OWNER_ID " +
                        "LEFT JOIN APPOINTMENT AS A ON P.PET_ID = A.PET_ID " +
                        "LEFT JOIN SERVICE AS S ON A.APPT_ID = S.APPT_ID " +
                        "LEFT JOIN INVOICE AS I ON S.INVOICE_ID = I.INVOICE_ID " +
                        "WHERE I.INVOICE_COST > (SELECT AVG(INVOICE_COST) FROM INVOICE) " +
                        "ORDER BY I.INVOICE_ID",
                null, null,  false, false));

//         Query 2: This query returns pet information for a specified pet category.
//         (uses like, parameter)
//         Sample input: dog.
        m_queryDescriptArray.add("Query 2: This query returns pet information for a specified pet category." +
                    " (uses like, parameter)" +
                    "\nSample input: dog.");
        m_queryArray.add(new QueryData(
                "SELECT * FROM PET AS P  " +
                        "WHERE P.PET_CATEGORY LIKE ?",
                new String [] {"PET CATEGORY"}, new boolean [] {true}, false, true));

        // Query 3: This query lists prescription information from all appointments
        // for a specified pet, ordered by appointment date. (uses like, parameter, various joins)
        // Sample input: Lidia
        m_queryDescriptArray.add("Query 3: This query lists prescription information from all appointments" +
                " for a specified pet, ordered by appointment date. (uses like, parameter, various joins)" +
                "\nSample input: Lidia");
        m_queryArray.add(new QueryData(
                "SELECT P.PET_ID, P.PET_NAME, A.APPT_DATE, " +
                        "PR.PRESCRIPTION_ID, PR.PRESCRIPTION_NAME, PR.PRESCRIPTION_DOSAGE, PR.PRESCRIPTION_DESCRIPTION " +
                        "FROM pet as P RIGHT JOIN APPOINTMENT AS A ON P.PET_ID = A.PET_ID  " +
                        "LEFT JOIN PRESCRIPTION AS PR ON A.APPT_ID = PR.APPT_ID " +
                        "WHERE P.PET_NAME LIKE ? " +
                        "ORDER BY A.APPT_DATE" ,
                new String [] {"PET NAME"} , new boolean [] {true}, false, true));

        // Query 4: This query shows the max and min invoice costs for each owner during a specified range of dates,
        // ordered by owner ID. Currently, the min and max amounts are the same because our database has one
        // invoice per owner, which isn't ideal to show the data we are trying to extract.
        // But this is a useful query as data becomes more abundant. (uses min, max, between, dates, group by, 2 parameters, various joins)
        // Sample input: 2022-01-01, 2022-12-31
        m_queryDescriptArray.add("Query 4: This query shows the max and min invoice costs for each owner during a specified range of dates," +
                " ordered by owner ID. Currently, the min and max amounts are the same because our database has one" +
                " invoice per owner, which isn't ideal to show the data we are trying to extract." +
                " But this is a useful query as data becomes more abundant. (uses min, max, between, dates, group by, 2 parameters, various joins)" +
                "\nSample input: 2022-01-01, 2022-12-31");
        m_queryArray.add(new QueryData(
                "SELECT O.OWNER_ID, O.OWNER_LNAME, O.OWNER_FNAME, " +
                        "MIN(I.INVOICE_COST) AS 'MININUM INVOICE AMOUNT', " +
                        "MAX(I.INVOICE_COST) AS 'MAXIMUM INVOICE AMOUNT' " +
                        "FROM OWNER AS O RIGHT JOIN PET AS P ON O.OWNER_ID = P.OWNER_ID " +
                        "LEFT JOIN APPOINTMENT AS A ON P.PET_ID = A.PET_ID " +
                        "LEFT JOIN SERVICE AS S ON A.APPT_ID = S.APPT_ID " +
                        "LEFT JOIN INVOICE AS I ON S.INVOICE_ID = I.INVOICE_ID " +
                        "WHERE I.INVOICE_DATE BETWEEN ? AND ? " +
                        "GROUP by O.OWNER_ID " +
                        "ORDER by O.OWNER_ID",
                new String [] {"START DATE (yyyy-mm-dd)", "END DATE (yyyy-mm-dd)"},
                new boolean [] {false, false}, false, true));

        // Query 5: This query lists a complete health record and owner information for a specified pet.
        // (uses like, parameter, joins)
        // Sample input: Barney
        m_queryDescriptArray.add("Query 5: This query lists a complete health record and owner information for a specified pet." +
                " (uses like, parameter, joins)" +
                "\nSample input: Barney");
        m_queryArray.add(new QueryData(
                "SELECT P.PET_ID, P.PET_NAME, P.PET_CATEGORY, P.PET_BREED, " +
                        "H.HEALTHRECORD_DATE, H.HEALTHRECORD_NOTE, P.OWNER_ID, O.OWNER_LNAME, O.OWNER_FNAME " +
                        "FROM PET P LEFT JOIN OWNER O ON O.OWNER_ID = P.OWNER_ID  " +
                        "LEFT JOIN HEALTHRECORD H ON P.PET_ID = H.PET_ID " +
                        "WHERE P.PET_NAME LIKE ?" +
                        "ORDER BY H.HEALTHRECORD_DATE",
                new String [] {"PET NAME"}, new boolean [] {true}, false, true));

        // Query 6: This query shows owner information, pet information, appointment date and service description
        // using specified service description, owner's last name, and/ or pet name. For example, this query can be
        // used to see a pet's vaccination history and determine whether the pet is up-to-date with their vaccination.
        // (uses like, 3 parameters, various joins)
        // Sample input: vaccine, Barbier, Mel
        m_queryDescriptArray.add("Query 6: This query shows owner information, pet information, appointment date and service description" +
                " using specified service description, owner's last name, and/ or pet name. For example, this query can be" +
                " used to see a pet's vaccination history and determine whether the pet is up-to-date with their vaccination." +
                " (uses like, 3 parameters, various joins)" +
                "\nSample input: vaccine, Barbier, Mel");
        m_queryArray.add(new QueryData(
                "SELECT O.OWNER_ID, O.OWNER_LNAME, O.OWNER_FNAME, " +
                        "P.PET_ID, P.PET_NAME, A.APPT_DATE, S.SERVICE_DESCRIPTION " +
                        "FROM OWNER AS O RIGHT JOIN PET AS P ON O.OWNER_ID = P.OWNER_ID " +
                        "LEFT JOIN APPOINTMENT AS A ON P.PET_ID = A.PET_ID " +
                        "LEFT JOIN SERVICE AS S ON A.APPT_ID = S.APPT_ID " +
                        "WHERE S.SERVICE_DESCRIPTION LIKE ? " +
                        "AND O.OWNER_LNAME LIKE ? " +
                        "AND P.PET_NAME LIKE ? " +
                        "ORDER BY A.APPT_DATE ",
                new String [] {"SERVICE DESCRIPTION", "OWNER'S LAST NAME", "PET NAME"},
                new boolean [] {true, true, true}, false, true));

        // Query 7: This query returns veterinarian and clinic information based on specified veterinarian specialty,
        // ordered by clinic name and veterinarian's last name. (uses like, parameter)
        // Sample input: orthopedic
        m_queryDescriptArray.add("Query 7: This query returns veterinarian and clinic information based on specified veterinarian specialty," +
                " ordered by clinic name and veterinarian's last name. (uses like, parameter)" +
                "\nSample input: orthopedic");
        m_queryArray.add(new QueryData(
                "SELECT C.CLINIC_ID, C.CLINIC_NAME, V.VET_ID, V.VET_LNAME, V.VET_FNAME, V.VET_SPECIALTY " +
                        "FROM CLINIC AS C JOIN VETERINARIAN AS V ON C.CLINIC_ID = V.CLINIC_ID " +
                        "WHERE V.VET_SPECIALTY LIKE ? " +
                        "ORDER BY C.CLINIC_NAME, V.VET_LNAME",
                new String [] {"DESIRED SPECIALTY"}, new boolean [] {true}, false, true));

        // Query 8: This query returns pet prescription information and the associated veterinarian and appointment IDs
        // for a specified clinic. (uses like, parameter, 2 subqueries)
        // Sample input: Vipe
        m_queryDescriptArray.add("Query 8: This query returns pet prescription information and the associated veterinarian and appointment IDs" +
                "  for a specified clinic. (uses like, parameter, 2 subqueries)" +
                "\nSample input: Vipe");
        m_queryArray.add(new QueryData(
                "SELECT P.PET_ID, P.PET_NAME, " +
                        "RX.PRESCRIPTION_ID, RX.PRESCRIPTION_NAME, RX.PRESCRIPTION_DOSAGE, RX.PRESCRIPTION_DESCRIPTION, " +
                        "A.VET_ID, RX.APPT_ID " +
                        "FROM PET P INNER JOIN APPOINTMENT A ON P.PET_ID " +
                        "INNER JOIN PRESCRIPTION RX ON RX.APPT_ID " +
                        "WHERE A.PET_ID = P.PET_ID and RX.APPT_ID = A.APPT_ID and A.VET_ID IN " +
                        "(SELECT V.VET_ID FROM VETERINARIAN AS V WHERE V.CLINIC_ID = " +
                        "(SELECT DISTINCT C.CLINIC_ID FROM CLINIC AS C WHERE C.CLINIC_NAME LIKE ?)) " +
                        "ORDER BY P.PET_ID, RX.PRESCRIPTION_ID ",
                new String [] {"CLINIC NAME"}, new boolean [] {true}, false, true));

        // Query 9: This query shows the service description and the average service cost for all services
        // provided by a specified clinic during a specified range of dates,
        // ordered by average invoiced amount in ascending order.
        // (uses like, between, round, average, group by, dates, 3 parameters)
        // Sample input: Vipe, 2021-01-01, 2021-12-31
        m_queryDescriptArray.add("Query 9: This query shows the service description and the average service cost for all services" +
                "  provided by a specified clinic during a specified range of dates," +
                "  ordered by average invoiced amount in ascending order." +
                " (uses like, between, round, average, group by, dates, 3 parameters)" +
                "\nSample input: Vipe, 2021-01-01, 2021-12-31");
        m_queryArray.add(new QueryData(
                "SELECT S.SERVICE_DESCRIPTION AS ServiceDescription, " +
                        "ROUND(AVG(I.INVOICE_COST), 2) AS AverageInvoicedAmount " +
                        "FROM SERVICE S, INVOICE I, PRESCRIPTION RX, APPOINTMENT A, VETERINARIAN V, CLINIC C " +
                        "WHERE S.INVOICE_ID = I.INVOICE_ID " +
                        "AND I.INVOICE_ID = RX.INVOICE_ID " +
                        "AND RX.APPT_ID = A.APPT_ID " +
                        "AND A.VET_ID = V.VET_ID " +
                        "AND V.CLINIC_ID = C.CLINIC_ID " +
                        "AND C.CLINIC_NAME LIKE ? " +
                        "AND I.INVOICE_DATE BETWEEN ? AND ? " +
                        "GROUP BY S.SERVICE_DESCRIPTION " +
                        "ORDER BY AverageInvoicedAmount ASC",
                new String [] {"CLINIC NAME", "START DATE (yyyy-mm-dd)", "END DATE (yyyy-mm-dd)"},
                new boolean [] {true, false, false}, false, true));

        // Query 10: This query allows the user to insert a new pet into the database, specifically into the pet table.
        // (insert query, 8 parameters)
        // Sample input: 71, Bobby, 5, 25, brown, dog, corgi, 2021-06-03
        m_queryDescriptArray.add("Query 10: This query allows the user to insert a new pet into the database, specifically into the pet table." +
                " (insert query, 8 parameters)" +
                "\nSample input: 71, Bobby, 5, 25, brown, dog, corgi, 2021-06-03");
        m_queryArray.add(new QueryData(
                "INSERT INTO PET (PET_ID, PET_NAME, OWNER_ID, PET_WEIGHT, PET_COLOR, PET_CATEGORY, PET_BREED, PET_DOB) " +
                        "VALUES (?,?,?,?,?,?,?,?)",
                new String [] {"PET_ID", "PET_NAME", "OWNER_ID",  "PET_WEIGHT", "PET_COLOR", "PET_CATEGORY", "PET_BREED", "PET_DOB"},
                new boolean [] {false, false, false, false, false, false, false, false, }, true, true));

        // Query 11: This query deletes a pet from the database, specifically from the pet table, using pet ID and pet name.
        // (delete query, 2 parameters)
        // sample input: 71, Bobby
        m_queryDescriptArray.add("Query 11: This query deletes a pet from the database, specifically from the pet table, using pet ID and pet name." +
                " (delete query, 2 parameters)" +
                "\nsample input: 71, Bobby");
        m_queryArray.add(new QueryData(
                "DELETE FROM PET " +
                        "WHERE PET_ID LIKE ? " +
                        "AND PET_NAME LIKE ?",
                new String [] {"PET_ID", "PET_NAME"},
                new boolean [] {true, true}, true, true));
    }
       

    public int GetTotalQueries()
    {
        return m_queryArray.size();
    }

    
    public int GetParameterAmtForQuery(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.GetParmAmount();
    }
              
    public String  GetParamText(int queryChoice, int parmnum )
    {
       QueryData e=m_queryArray.get(queryChoice);        
       return e.GetParamText(parmnum); 
    }   

    public String GetQueryText(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.GetQueryString();        
    }

    /**
     * Method called in QueryFrame to be called to return the description when
     * a query has been selected
     * @param queryChoice The query chosen
     * @return A string of the description of what the query does.
     */
    public String GetDescriptText(int queryChoice)
    {
        String e= m_queryDescriptArray.get(queryChoice);
        return e;
    }

    
    /**
     * Function will return how many rows were updated as a result
     * of the update query
     * @return Returns how many rows were updated
     */
    
    public int GetUpdateAmount()
    {
        return m_updateAmount;
    }
    
    /**
     * Function will return ALL of the Column Headers from the query
     * @return Returns array of column headers
     */
    public String [] GetQueryHeaders()
    {
        return m_jdbcData.GetHeaders();
    }
    
    /**
     * After the query has been run, all of the data has been captured into
     * a multi-dimensional string array which contains all the row's. For each
     * row it also has all the column data. It is in string format
     * @return multi-dimensional array of String data based on the resultset 
     * from the query
     */
    public String[][] GetQueryData()
    {
        return m_jdbcData.GetData();
    }

    public String GetProjectTeamApplication()
    {
        return m_projectTeamApplication;        
    }
    public boolean  isActionQuery (int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.IsQueryAction();
    }
    
    public boolean isParameterQuery(int queryChoice)
    {
        QueryData e=m_queryArray.get(queryChoice);
        return e.IsQueryParm();
    }
    
     
    public boolean ExecuteQuery(int queryChoice, String [] parms)
    {
        boolean bOK = true;
        QueryData e=m_queryArray.get(queryChoice);        
        bOK = m_jdbcData.ExecuteQuery(e.GetQueryString(), parms, e.GetAllLikeParams());
        return bOK;
    }
    
     public boolean ExecuteUpdate(int queryChoice, String [] parms)
    {
        boolean bOK = true;
        QueryData e=m_queryArray.get(queryChoice);        
        bOK = m_jdbcData.ExecuteUpdate(e.GetQueryString(), parms);
        m_updateAmount = m_jdbcData.GetUpdateCount();
        return bOK;
    }   
    
      
    public boolean Connect(String szHost, String szUser, String szPass, String szDatabase)
    {

        boolean bConnect = m_jdbcData.ConnectToDatabase(szHost, szUser, szPass, szDatabase);
        if (bConnect == false)
            m_error = m_jdbcData.GetError();        
        return bConnect;
    }
    
    public boolean Disconnect()
    {
        // Disconnect the JDBCData Object
        boolean bConnect = m_jdbcData.CloseDatabase();
        if (bConnect == false)
            m_error = m_jdbcData.GetError();
        return true;
    }
    
    public String GetError()
    {
        return m_error;
    }


    /**
     * A method that will retrieve the error message from the QueryJDBC to be
     * displayed in the QueryFrame in the textArea2
     * @return A string of the error message
     */
    public String getJDBCErrorMessageAsString() {
        return m_jdbcData.getOnlyErrorMessage();
    }
 
    private QueryJDBC m_jdbcData;
    private String m_error;
    private String m_projectTeamApplication;
    private ArrayList<QueryData> m_queryArray;

    //Created an ArrayList to store the array description
    private ArrayList<String> m_queryDescriptArray;
    private int m_updateAmount;
            
    /**
     * @param args the command line arguments
     */
    


    public static void main(String[] args) {

        final QueryRunner queryrunner = new QueryRunner();
        
        if (args.length == 0)
        {

            java.awt.EventQueue.invokeLater(new Runnable() {
                public void run() {

                    //This runs the QueryFrame which is the GUI
                    new QueryFrame(queryrunner).setVisible(true);
                }
            });
        } else {

            //Start of the console version
            if (args[0].equals("-console")) {
                String hostname, username, password, database; // Login credential
                int option; // Query menu option

                // Display a welcome message
                displayWelcomeMessage(queryrunner);

                // Create Scanner object for user input
                Scanner keyboard = new Scanner(System.in);

                // Get user login credential
                System.out.println("\nPlease enter your login information");
                System.out.print("Enter hostname: ");
                hostname = keyboard.nextLine();
                System.out.print("Enter username: ");
                username = keyboard.nextLine();
                System.out.print("Enter password: ");
                password = keyboard.nextLine();
                System.out.print("Enter database: ");
                database = keyboard.nextLine();
                System.out.println();

                // Connect to database with provided credential
                // Quit program if fail to connect to database
                if (!queryrunner.Connect(hostname, username, password, database)) {
                    System.out.println("Error: Invalid login credential. Goodbye.");
                    return;
                }

                // Run menu options
                do {
                    // Display menu and get user's selected option
                    option = displayQueryMenu(keyboard);

                    // Execute query 1 to 11
                    if (option >= 1 && option <= queryrunner.GetTotalQueries()) {

                        //Print out the description of the query
                        String descript = queryrunner.GetDescriptText(option -1);
                        System.out.println(descript + "\n");

                        //Execute the query
                        executeQuery(keyboard, option, queryrunner);
                        // Quit program if Option 12 is selected
                    } else {
                        displayGoodbyeMessage(queryrunner);
                    }
                } while (option != 12);

                // Close Scanner
                keyboard.close();

                // Disconnect from database

                boolean statusDisconnect = queryrunner.Disconnect();
                if(statusDisconnect == false) {
                    System.out.println(queryrunner.GetError());
                }
            }
        }

    }

    /**
     * Displays the query menu
     *
     * @param keyboard Scanner object to read user input
     * @return The user's selected option
     */
    public static int displayQueryMenu(Scanner keyboard) {
        int option; // User's selected option

        // Prompt menu
        System.out.println("\n------------------------------------------- QUERY MENU ------------------------------------------");
        System.out.println("Option  1. Get invoice and owner information for invoice amounts greater than the average amount.");
        System.out.println("Option  2. Get pet information for a specified pet category");
        System.out.println("Option  3. List prescription information from all appointments for a specified pet");
        System.out.println("Option  4. Get the max and min invoice costs for each owner during a specified range of dates");
        System.out.println("Option  5. List a complete health record and owner information for a specified pet");
        System.out.println("Option  6. Get owner information, pet information, appointment date and service description\n           for specified service description, owner's last name, and/ or pet name");
        System.out.println("Option  7. Get veterinarian and clinic information based on specified veterinarian specialty");
        System.out.println("Option  8. Get pet prescription information and the associated veterinarian and appointment IDs\n           for a specified clinic");
        System.out.println("Option  9. Get service description and average service cost for all services provided\n           by a specified clinic during a specified range of dates");
        System.out.println("Option 10. Insert a new pet into PetDB");
        System.out.println("Option 11. Delete a pet from PetDB");
        System.out.println("Option 12. Quit program");
        System.out.println("-------------------------------------------------------------------------------------------------");

        // Validate user input
        do {
            System.out.print("Enter option: ");
            option = keyboard.nextInt();
            keyboard.nextLine();
        } while (option < 1 || option > 12);
        System.out.println();

        return option;
    }

    /**
     * Executes query
     *
     * @param keyboard    Scanner object to read user input
     * @param option      User's selected menu option
     * @param queryrunner The query runner object
     */
    public static void executeQuery(Scanner keyboard, int option, QueryRunner queryrunner) {
        int queryChoice = option - 1; // Query index in array
        int parmnum;                  // Total number of parameters
        String[] parms;               // Array holding parameter values
        boolean check;                // True if no error
        String[] headers;             // Array storing column headers
        String[][] allData;           // Array storing table data

        // Get number of parameters and create an array for parameter values
        parmnum = queryrunner.GetParameterAmtForQuery(queryChoice);
        parms = new String[parmnum];

        // If parameter query, store parameter values
        if (queryrunner.isParameterQuery(queryChoice)) {
            // Store parameter values
            for (int i = 0; i < parmnum; i++) {
                System.out.print(queryrunner.GetParamText(queryChoice, i) + ": ");
                parms[i] = keyboard.nextLine();
            }
            System.out.println();
        }

        // If action query, execute and display rows affected
        if (queryrunner.isActionQuery(queryChoice)) {
            check = queryrunner.ExecuteUpdate(queryChoice, parms);

            if (check == true) {
                // Display rows affected
                System.out.println("Rows affected = " + queryrunner.GetUpdateAmount());
            } else {
                // Display error message
                System.out.println(queryrunner.GetError());
            }
            // If regular query, execute and print table
        } else {
            check = queryrunner.ExecuteQuery(queryChoice, parms);

            if (check == true) {
                // Retrieve and display column headers
                headers = queryrunner.GetQueryHeaders();
                for (String val : headers) {
                    System.out.printf("%-30s", val);
                }
                System.out.println();

                // Retrieve and display table data
                allData = queryrunner.GetQueryData();
                for (int i = 0; i < allData.length; i++) {
                    for (int j = 0; j < allData[i].length; j++) {
                        System.out.printf("%-30s", allData[i][j]);
                    }
                    System.out.println();
                }
            } else {
                // Display error message
                System.out.println(queryrunner.GetError());
            }
        }
    }

    /**
     * Displays a welcome message.
     */
    public static void displayWelcomeMessage(QueryRunner queryrunner) {
        System.out.print("\n                                         WELCOME TO " + queryrunner.GetProjectTeamApplication() + "\n");
        System.out.print("                          a centralized repository of pet medical records\n");
        System.out.print("=================================================================================================\n");
    }

    /**
     * Displays a goodbye message.
     */
    public static void displayGoodbyeMessage(QueryRunner queryrunner) {
        System.out.println("                              Thank you for choosing " + queryrunner.GetProjectTeamApplication() + ". Goodbye.\n");
    }

}
