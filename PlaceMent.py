from pymongo import MongoClient
from datetime import datetime

# establish connection
client = MongoClient('mongodb://localhost:27017/')
db = client['gsss']
campus = db["campus"]

def newPlacement():
    comp_name = input("enter the company name: ")
    comp_role = input("enter the company role: ")
    comp_package = float(input("the company package: "))
    comp_visit = input("company visit date(YYYY-MM-DD): ")
    comp_count = int(input("number of students placed: "))
    #document construction
    company = {
        "company_name": comp_name,
        "company_role": comp_role,
        "company_package": comp_package,
        "company_visit_date": 
            datetime.strptime(comp_visit, "%Y-%m-%d") ,
        "number_of_students_placed": comp_count
    }
    campus.insert_one(company)
    print("Placement record added successfully!")
    
if __name__ == "__main__":
    newPlacement()
    

