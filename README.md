# Mark_Management_System

To manage student examination marks, including adding, updating, deleting, and displaying student marks, along with generating reports such as students with marks above a certain threshold, students
scoring in a specific subject, and top scorers.

___

🚀 Features Complete CRUD Operations: Add, Update, Delete, and Display Student Details                    
Advanced Search: Search student records by ID                             
Comprehensive Reports: Generate various reports including:                                                 
    *. Students with marks above a specified value                         
    *. Students who scored in a specific subject                                             
    *. Top N students based on marks                                                                                                 
Input Validation: Client-side and server-side validation                                                              
Professional UI: Bootstrap-based responsive design                                                                 
MVC Architecture: Clean separation of concerns                                                                       
Database Integration: MySQL with JDBC connectivity                                                            

_____

📋 Prerequisites

Before running this application, make sure you have the following installed:                               
*. Java Development Kit (JDK) 8 or higher                                  
*. Apache Tomcat 9.0 or higher                               
*. MySQL Server 5.7 or XAMP Server                                                  
*. MySQL JDBC Driver (mysql-connector-java)                                              
*. IDE: Eclipse (J2EE), IntelliJ IDEA, or any Java IDE                                                       
*. Web Browser: Chrome, Firefox, or Edge                                                                 

______

Modules & Functionalities:                                
MarkAdd: Add new student marks                               
MarkUpdate: Update existing marks                      
MarkDelete: Remove student records                              
MarkDisplay: Show all records or search by StudentID                                                           

_____

Database Structure:                             
CREATE TABLE StudentMarks (                            
StudentID INT PRIMARY KEY,                                 
StudentName VARCHAR(100),                                 
Subject VARCHAR(50),                                 
Marks INT,                                            
ExamDate DATE                                
);                                                  


______


🛠️Project Structure:

MarkWebApp/                           
├── WebContent/                         
│ ├── index.jsp                          
│ ├── markadd.jsp                                     
│ ├── markupdate.jsp                                    
│ ├── markdelete.jsp                                  
│ ├── markdisplay.jsp                                    
│ ├── reports.jsp                                               
│ ├── report_form.jsp                                   
│ └── report_result.jsp                                          
├── src/                                       
│ ├── com/                              
│ ├── dao/                                      
│ │ └── MarkDAO.java                                 
│ ├── model/                                         
│ │ └── StudentMark.java                                            
│ └── servlet/                                                                             
│ ├── AddMarkServlet.java                                                        
│ ├── UpdateMarkServlet.java                                     
│ ├── DeleteMarkServlet.java                                               
│ ├── DisplayMarksServlet.java                                                           
│ ├── ReportServlet.java                                                             
│ └── ReportCriteriaServlet.java                                                              
└── WEB-INF/web.xml                                                                                 

_______

🖼️ Screenshots

![image alt](https://github.com/Soundarya1921/Mark_Management_System/blob/main/output_Screenshots/mark_management.png)

![image alt](https://github.com/Soundarya1921/Mark_Management_System/blob/main/output_Screenshots/add.png)

![image alt](https://github.com/Soundarya1921/Mark_Management_System/blob/main/output_Screenshots/update.png)

![image alt](https://github.com/Soundarya1921/Mark_Management_System/blob/main/output_Screenshots/delete.png)

![image alt](https://github.com/Soundarya1921/Mark_Management_System/blob/main/output_Screenshots/display.png)

![image alt](https://github.com/Soundarya1921/Mark_Management_System/blob/main/output_Screenshots/report.png)

_____
