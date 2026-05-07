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

def viewPlacements():
    placements = campus.find()
    for placement in placements:
        print(placement)

def filterByDate():
    date_str = input("filter placements (YYYY-MM-DD): ")
    filter_date = datetime.strptime(date_str, "%Y-%m-%d")
    placements = campus.find({"company_visit_date": 
        {"$gte": filter_date}})
    for placement in placements:
        print(placement)

if __name__ == "__main__":
    while True:
        print("\n1. Add New Placement")
        print("2. View All Placements")
        print("3. Filter Placements by Date")
        print("4. Exit")
        choice = input("Enter your choice: ")
        if choice == '1': newPlacement()
        elif choice == '2': viewPlacements()
        elif choice == '3': filterByDate()
        elif choice == '4': break
        else:print("Invalid choice, please try again.")
    
