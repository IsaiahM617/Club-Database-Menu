#include <stdlib.h>
#include <iostream>
/*
 Include directly the different
 headers from cppconn/ and mysql_driver.h + mysql_util.h
 (and mysql_connection.h). This will reduce your build time!
*/
#include "mysql_connection.h"
#include <cppconn/driver.h>
#include <cppconn/exception.h>
#include <cppconn/resultset.h>
#include <cppconn/statement.h>
#include <cppconn/prepared_statement.h>
using namespace std;
// This program retrieves all of the musicians
// Compile:
// g++ -I/usr/include clubdatabase.cpp -o clubdatabase -I /usr/local/lib -lmysqlcppconn
//
// Execute:
// ./clubdatabase
//
 sql::Driver *driver;
 sql::Connection *con;
 sql::Statement *stmt;
 sql::ResultSet *res;
 sql::PreparedStatement  *prep_stmt;
void findallguests();
void findbyid();
void findsection();
void findguestAppearance();
void viewbottles();
void cancelbooking();
void booknow();
void changeName();
void totalPrice();
void totalAttendance();
int main(void)
{
try {
 /* Create a connection */
 driver = get_driver_instance();
con = driver->connect("tcp://127.0.0.1:3306", "root", "");
/* Connect to the MySQL Club database */
   
 con->setSchema("club");
 //stmt = con->createStatement();
   
 int option = 12;
 
 while (option != 11) {
     
     cout << endl;
     cout << "1. View Guest List" << endl;
     cout << "2. Find your ticket" << endl;
     cout << "3. Your Section Booking" << endl;
     cout << "4. View Our Celebrity List " << endl;
     cout << "5. Bottles, Chasers, and Pricing " << endl;
     cout << "6. Interested in buying a section? View our Price Range " << endl;
     cout << "7. Cancel your booking " << endl;
     cout << "8. Share your ticket " << endl;
     cout << "9. Book Now! " << endl;
     cout << "10. View Total in Attendance "<< endl;
     cout << "11. Exit" << endl << endl;
     
     cout << "Choice : ";
     cin >> option;
     cout << endl;
     
     switch(option) {
         case 1: findallguests();
                  break;
       
         case 2: findbyid();
                 break;
                 
         case 3: findsection();
                  break;
             
         case 4: findguestAppearance();
                  break;
         
         case 5: viewbottles();
                  break;
         case 6: totalPrice();
                  break;
         case 7: cancelbooking();
                  break;
                 
         case 8:changeName();
                  break;
         case 9: booknow();
                  break;
         
         case 10: totalAttendance();
                  break;
           
     }
 }
 
 delete res;
 delete stmt;
 delete con;
} catch (sql::SQLException &e) {
 cout << "# ERR: SQLException in " << __FILE__;
 cout << "(" << __FUNCTION__ << ") on line " << __LINE__ << endl;
 cout << "# ERR: " << e.what();
 cout << " (MySQL error code: " << e.getErrorCode();
 cout << ", SQLState: " << e.getSQLState() << " )" << endl;
}
cout << endl;
return EXIT_SUCCESS;
}
 void findallguests() {  
 stmt = con->createStatement();
 res = stmt->executeQuery("SELECT * from list");
   
 while (res->next()) {
     
     cout << "Name: " << res->getString("GuestName") << endl;
     cout << "Ticket Status: " << res->getString("Ticket_Status") << endl;
     cout << "Promo Team: " << res->getString("Promo_Team") << endl;
     cout << "Extra Guests: " << res->getString("Additional_Guests") << endl << endl;
 }    
}
void findbyid() {
 int ConfirmationId;
   
 cout << "Enter the confirmation ID : ";
 cin >> ConfirmationId;
   
prep_stmt = con->prepareStatement("SELECT * FROM admission WHERE ConfirmationId = ?");
prep_stmt->setInt(1, ConfirmationId);
res = prep_stmt->executeQuery();
 while (res->next()) {  
     cout << res->getString("ConfirmationID") << " ";
     cout << res->getString("GuestName") << " ";
     cout << res->getString("Ticket_Status") << " ";
     cout << endl;
 }     
}
void findsection() {
 int ConfirmationId;
   
 cout << "Enter the confirmation ID : ";
 cin >> ConfirmationId;
   
prep_stmt = con->prepareStatement("SELECT * FROM section WHERE ConfirmationId = ?");
prep_stmt->setInt(1, ConfirmationId);
res = prep_stmt->executeQuery();
 while (res->next()) {
     
     cout << "ConfirmationID: " << res->getString("ConfirmationId") << endl;
     cout << "Section_Price: $" << res->getString("Section_Price") << " ";
     cout << "Section_Size: " << res->getString("Section_Size") << " people" << endl;
     cout << "Num_Bottles: " << res->getString("Num_Bottles") << endl;
 }
}
void findguestAppearance() {
 stmt = con->createStatement();
 res = stmt->executeQuery("SELECT * from guestAppearance where Appearance_Date > 241212 AND Additional_Guests > 2");
   
 while (res->next()) {
     
     cout << res->getString("Celebrity_Name") << " "<< endl;
     cout <<"Appearing on: " <<res->getString("Appearance_Date") << " " << endl;
     cout <<"Additional Guests: " << res->getString("Additional_Guests") << " " << endl;
     cout << endl;
 }
}
void viewbottles() {
    prep_stmt = con->prepareStatement(
        "SELECT bottles.BottleId, bottles.Bottle_Name, bottles.Bottle_Price, bottles.Bottle_Size, chasers.ChaserId, chasers.Chaser_Type " \
        "FROM bottles " \
        "JOIN chasers ON bottles.BottleId = chasers.BottleId"
    );
    res = prep_stmt->executeQuery();
    while (res->next()) {
        cout << "Bottle Name: " << res->getString("Bottle_Name") << endl;
        cout << "Price: " << res->getString("Bottle_Price") << endl;
        cout << "Size in Oz: " << res->getString("Bottle_Size") << endl;
        cout << "Chaser Name: " << res->getString("Chaser_Type") << endl << endl;
    }
}
void cancelbooking(){
    int ConfirmationId;
    cout << "Enter Your ConfirmationId:" <<" ";
    cin >> ConfirmationId;
    cout << endl;
    prep_stmt = con->prepareStatement("DELETE FROM admission WHERE ConfirmationId = ?");
    prep_stmt->setInt(1, ConfirmationId);
    res = prep_stmt->executeQuery();
    cout << "Your Booking has been deleted! " << endl;
}
void booknow (){
    string GuestName, Ticket_Status;
    int Ad_Date;
    double gTicket_Price = 9.95;
    double eTicket_Price = 19.95;
    double Ticket_Price;
    cout << "General or Express: ";
    cin >> Ticket_Status;
    if (Ticket_Status == "General") {
        Ticket_Price = gTicket_Price;  
        cout << "Your total is $9.95." << endl;
    } 
    else if (Ticket_Status == "Express") {
        Ticket_Price = eTicket_Price;  
        cout << "Your total is $19.95" << endl;  
    }
    else {
        cout << "Invalid ticket type. Please enter 'General' or 'Express'." << endl;
        return;  
    }
    cout << "First name and Last name: ";
    cin.ignore(); 
    getline(cin, GuestName);
    cout << endl;
    cout << "Today's Date(YYMMDD): ";
    cin >> Ad_Date;
 
    prep_stmt = con->prepareStatement("INSERT INTO admission (GuestName, Ad_Date, Ticket_Price, Ticket_Status) " \
                                      "VALUES(?,?,?,?) ");
                                                                                    
    prep_stmt->setString(1, GuestName);          
    prep_stmt->setInt(2, Ad_Date);              
    prep_stmt->setDouble(3, Ticket_Price);      
    prep_stmt->setString(4, Ticket_Status);     
    prep_stmt->execute();
    
    prep_stmt = con->prepareStatement("SELECT ConfirmationId FROM admission WHERE GuestName = ?");
    prep_stmt->setString(1, GuestName);
    res = prep_stmt->executeQuery();
    if (res->next()) {  
        int ConfirmationId = res->getInt("ConfirmationId"); 
        cout << "Your Booking is Confirmed!" << endl;
        cout << "Here is your confirmation ID: " << ConfirmationId << endl;
    }
}
    void changeName(){
    int ConfirmationId;
    string GuestName;
   
    cout << "Your Confirmation ID: ";
    cin >> ConfirmationId;
    cout << "New name for ticket: ";
    cin.ignore();
    getline(cin, GuestName);
    prep_stmt = con->prepareStatement("UPDATE admission SET GuestName = ? WHERE ConfirmationId = ?");
    prep_stmt->setString(1, GuestName);
    prep_stmt->setInt(2, ConfirmationId);
    prep_stmt->execute();
    cout << "Name succesfully changed. Check below:" << endl;
/*This shows the changed name with the orginal ticket info*/
    prep_stmt = con->prepareStatement("SELECT * FROM admission WHERE ConfirmationId = ?");
    prep_stmt->setInt(1, ConfirmationId);
    res = prep_stmt->executeQuery();
    while (res->next()) {
           
    cout << res->getString("ConfirmationID") << " ";
    cout << res->getString("GuestName") << " ";
    cout << res->getString("Ticket_Status") <<" ";
    cout << res->getString("Ad_Date") << endl;
    }
}
void totalPrice() {
    float MaxPrice, MinPrice;
    prep_stmt = con->prepareStatement("SELECT MIN(Section_Price) AS MinPrice, MAX(Section_Price) AS MaxPrice FROM section");
    res = prep_stmt->executeQuery();
    while (res->next()) {
         cout << "Minimum Price: " << res->getString("MinPrice") << endl;
         cout << "Maximum Price: " << res->getString("MaxPrice") << endl;
    }
}
void totalAttendance() {
    int TotalGuests = 0;
    prep_stmt = con->prepareStatement("SELECT" "(SELECT COUNT(GuestName) FROM admission) + "
                                      "(SELECT COUNT(GuestName) FROM list) AS TotalGuests");
    res = prep_stmt->executeQuery();
    if (res->next()) {
        TotalGuests = res->getInt("TotalGuests");
    }
    cout << "Total Guests: " << TotalGuests << endl;
}



