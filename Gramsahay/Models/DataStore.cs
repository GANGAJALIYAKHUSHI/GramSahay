using System;
using System.Collections.Generic;
using System.Linq;

namespace Gramsahay.Models
{
    public class CitizenUser
    {
        public int Id { get; set; }
        public string Initials { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string State { get; set; }
        public string District { get; set; }
        public string Occupation { get; set; }
        public decimal AnnualIncome { get; set; }
        public string Caste { get; set; }
        public string RegisteredDate { get; set; }
        public int EligibleSchemesCount { get; set; }
        public string Status { get; set; } // Active, Pending, Inactive
        public string Password { get; set; }
        public string AvatarUrl { get; set; }
        public int ProfileCompletionPercent { get; set; }
    }

    public class Scheme
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Ministry { get; set; }
        public string Category { get; set; }
        public string CategoryCssClass { get; set; }
        public decimal MaxIncome { get; set; }
        public int MinAge { get; set; }
        public int MaxAge { get; set; }
        public string Benefit { get; set; }
        public string Description { get; set; }
        public string EligibleOccupations { get; set; }
        public List<string> RequiredDocuments { get; set; }
        public bool IsSaved { get; set; }
        public bool IsApplied { get; set; }
        public int AccessCount { get; set; }
        public string ImageUrl { get; set; }

        public Scheme()
        {
            RequiredDocuments = new List<string>();
        }
    }

    public class NotificationItem
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string TimeAgo { get; set; }
        public bool IsRead { get; set; }
        public string Type { get; set; } // check, installment, scheme, profile
    }

    public class StateStat
    {
        public string StateName { get; set; }
        public int UserCount { get; set; }
        public int Percent { get; set; }
    }

    public class MonthlyActivity
    {
        public string Month { get; set; }
        public int NewUsers { get; set; }
        public int EligibilityChecks { get; set; }
        public int SchemesApplied { get; set; }
        public string ApprovalRate { get; set; }
    }

    public static class DataStore
    {
        public static List<CitizenUser> Users { get; set; }
        public static List<Scheme> Schemes { get; set; }
        public static List<NotificationItem> Notifications { get; set; }
        public static List<StateStat> StateStats { get; set; }
        public static List<MonthlyActivity> MonthlyActivities { get; set; }

        public static CitizenUser CurrentUser { get; set; }

        static DataStore()
        {
            InitializeData();
        }

        public static void InitializeData()
        {
            // Seed Users
            Users = new List<CitizenUser>
            {
                new CitizenUser
                {
                    Id = 1,
                    Initials = "RK",
                    FullName = "Ramesh Kumar",
                    Email = "ramesh@example.com",
                    Mobile = "9876543210",
                    Age = 38,
                    Gender = "Male",
                    State = "Uttar Pradesh",
                    District = "Lucknow",
                    Occupation = "Farmer",
                    AnnualIncome = 120000,
                    Caste = "OBC",
                    RegisteredDate = "02 Aug 2024",
                    EligibleSchemesCount = 4,
                    Status = "Active",
                    Password = "password123",
                    AvatarUrl = "Images/avatars/ramesh.jpg",
                    ProfileCompletionPercent = 80
                },
                new CitizenUser
                {
                    Id = 2,
                    Initials = "SD",
                    FullName = "Sunita Devi",
                    Email = "sunita@example.com",
                    Mobile = "9812345678",
                    Age = 34,
                    Gender = "Female",
                    State = "Bihar",
                    District = "Patna",
                    Occupation = "Artisan",
                    AnnualIncome = 95000,
                    Caste = "OBC",
                    RegisteredDate = "01 Aug 2024",
                    EligibleSchemesCount = 3,
                    Status = "Active",
                    Password = "password123",
                    AvatarUrl = "Images/avatars/sunita.jpg",
                    ProfileCompletionPercent = 75
                },
                new CitizenUser
                {
                    Id = 3,
                    Initials = "ML",
                    FullName = "Mohan Lal",
                    Email = "mohan@example.com",
                    Mobile = "9723456789",
                    Age = 42,
                    Gender = "Male",
                    State = "MP",
                    District = "Bhopal",
                    Occupation = "Laborer",
                    AnnualIncome = 80000,
                    Caste = "SC",
                    RegisteredDate = "31 Jul 2024",
                    EligibleSchemesCount = 0,
                    Status = "Pending",
                    Password = "password123",
                    AvatarUrl = "Images/avatars/mohan.jpg",
                    ProfileCompletionPercent = 40
                },
                new CitizenUser
                {
                    Id = 4,
                    Initials = "PS",
                    FullName = "Priya Singh",
                    Email = "priya@example.com",
                    Mobile = "9634567890",
                    Age = 28,
                    Gender = "Female",
                    State = "Rajasthan",
                    District = "Jaipur",
                    Occupation = "Student",
                    AnnualIncome = 110000,
                    Caste = "General",
                    RegisteredDate = "30 Jul 2024",
                    EligibleSchemesCount = 5,
                    Status = "Active",
                    Password = "password123",
                    AvatarUrl = "Images/avatars/priya.jpg",
                    ProfileCompletionPercent = 90
                },
                new CitizenUser
                {
                    Id = 5,
                    Initials = "AY",
                    FullName = "Anil Yadav",
                    Email = "anil@example.com",
                    Mobile = "9545678901",
                    Age = 45,
                    Gender = "Male",
                    State = "Maharashtra",
                    District = "Pune",
                    Occupation = "Unemployed",
                    AnnualIncome = 70000,
                    Caste = "OBC",
                    RegisteredDate = "29 Jul 2024",
                    EligibleSchemesCount = 2,
                    Status = "Inactive",
                    Password = "password123",
                    ProfileCompletionPercent = 60
                },
                new CitizenUser
                {
                    Id = 6,
                    Initials = "KS",
                    FullName = "Kavita Sharma",
                    Email = "kavita@example.com",
                    Mobile = "9456789012",
                    Age = 31,
                    Gender = "Female",
                    State = "UP",
                    District = "Agra",
                    Occupation = "Teacher",
                    AnnualIncome = 180000,
                    Caste = "General",
                    RegisteredDate = "28 Jul 2024",
                    EligibleSchemesCount = 3,
                    Status = "Active",
                    Password = "password123",
                    ProfileCompletionPercent = 85
                },
                new CitizenUser
                {
                    Id = 7,
                    Initials = "DV",
                    FullName = "Deepak Verma",
                    Email = "deepak@example.com",
                    Mobile = "9367890123",
                    Age = 29,
                    Gender = "Male",
                    State = "Bihar",
                    District = "Muzaffarpur",
                    Occupation = "Street Vendor",
                    AnnualIncome = 130000,
                    Caste = "OBC",
                    RegisteredDate = "27 Jul 2024",
                    EligibleSchemesCount = 2,
                    Status = "Active",
                    Password = "password123",
                    ProfileCompletionPercent = 70
                },
                new CitizenUser
                {
                    Id = 8,
                    Initials = "RD",
                    FullName = "Rekha Devi",
                    Email = "rekha@example.com",
                    Mobile = "9278901234",
                    Age = 50,
                    Gender = "Female",
                    State = "WB",
                    District = "Kolkata",
                    Occupation = "Homemaker",
                    AnnualIncome = 60000,
                    Caste = "SC",
                    RegisteredDate = "26 Jul 2024",
                    EligibleSchemesCount = 0,
                    Status = "Pending",
                    Password = "password123",
                    ProfileCompletionPercent = 45
                }
            };

            CurrentUser = Users[0]; // Ramesh Kumar by default

            // Seed Schemes using standard HTML entities or clean ASCII
            Schemes = new List<Scheme>
            {
                new Scheme
                {
                    Id = 1,
                    Name = "PM Kisan Samman Nidhi",
                    Ministry = "Ministry of Agriculture",
                    Category = "Agriculture",
                    CategoryCssClass = "badge-agri",
                    MaxIncome = 200000,
                    MinAge = 18,
                    MaxAge = 65,
                    Benefit = "&#8377;6,000 per year",
                    Description = "Provides income support of &#8377;6,000 per year to all landholding farmer families across the country in three equal installments of &#8377;2,000 each directly to bank accounts.",
                    EligibleOccupations = "Farmer",
                    RequiredDocuments = new List<string> { "Aadhaar Card", "Land ownership documents", "Bank passbook", "Passport-size photograph" },
                    IsSaved = false,
                    IsApplied = false,
                    AccessCount = 3200,
                    ImageUrl = "Images/schemes/agriculture.jpg"
                },
                new Scheme
                {
                    Id = 2,
                    Name = "Pradhan Mantri Awas Yojana (Gramin)",
                    Ministry = "Ministry of Rural Development",
                    Category = "Housing",
                    CategoryCssClass = "badge-housing",
                    MaxIncome = 300000,
                    MinAge = 18,
                    MaxAge = 70,
                    Benefit = "&#8377;1.20 lakh (plain areas)",
                    Description = "Aims to provide housing for all in rural India by providing financial assistance for construction of pucca house to all houseless households and households living in dilapidated houses.",
                    EligibleOccupations = "All eligible rural citizens",
                    RequiredDocuments = new List<string> { "Aadhaar Card", "Bank passbook", "Ration card", "Income Certificate" },
                    IsSaved = true,
                    IsApplied = false,
                    AccessCount = 1540,
                    ImageUrl = "Images/schemes/housing.jpg"
                },
                new Scheme
                {
                    Id = 3,
                    Name = "Ayushman Bharat - PMJAY",
                    Ministry = "Ministry of Health",
                    Category = "Health",
                    CategoryCssClass = "badge-health",
                    MaxIncome = 250000,
                    MinAge = 0,
                    MaxAge = 100,
                    Benefit = "&#8377;5 lakh health cover per year",
                    Description = "World's largest health insurance scheme providing coverage of &#8377;5 lakh per family per year for secondary and tertiary care hospitalization to over 12 crore poor families.",
                    EligibleOccupations = "All eligible rural and urban low-income families",
                    RequiredDocuments = new List<string> { "Aadhaar Card", "Ration card", "Family ID" },
                    IsSaved = false,
                    IsApplied = false,
                    AccessCount = 2100,
                    ImageUrl = "Images/schemes/health.jpg"
                },
                new Scheme
                {
                    Id = 4,
                    Name = "Pradhan Mantri Ujjwala Yojana",
                    Ministry = "Ministry of Petroleum",
                    Category = "Energy",
                    CategoryCssClass = "badge-energy",
                    MaxIncome = 150000,
                    MinAge = 18,
                    MaxAge = 60,
                    Benefit = "Free LPG connection + &#8377;1,600",
                    Description = "Provides free LPG connections to women from Below Poverty Line households to protect their health by replacing polluting cooking fuels with clean LPG fuel.",
                    EligibleOccupations = "Women head of BPL households",
                    RequiredDocuments = new List<string> { "Aadhaar Card", "BPL Ration card", "Bank passbook" },
                    IsSaved = false,
                    IsApplied = false,
                    AccessCount = 980,
                    ImageUrl = "Images/schemes/energy.jpg"
                },
                new Scheme
                {
                    Id = 5,
                    Name = "National Scholarship Portal",
                    Ministry = "Ministry of Education",
                    Category = "Education",
                    CategoryCssClass = "badge-edu",
                    MaxIncome = 200000,
                    MinAge = 14,
                    MaxAge = 35,
                    Benefit = "&#8377;500 - &#8377;20,000 per year",
                    Description = "One-stop platform for all scholarships including pre-matric, post-matric, and merit-cum-means for minority and underprivileged students.",
                    EligibleOccupations = "Students",
                    RequiredDocuments = new List<string> { "Aadhaar Card", "Income Certificate", "Caste Certificate", "Bank passbook" },
                    IsSaved = false,
                    IsApplied = false,
                    AccessCount = 760,
                    ImageUrl = "Images/schemes/education.jpg"
                },
                new Scheme
                {
                    Id = 6,
                    Name = "PM SVANidhi - Street Vendor Loan",
                    Ministry = "Ministry of Housing & Urban Affairs",
                    Category = "Employment",
                    CategoryCssClass = "badge-emp",
                    MaxIncome = 180000,
                    MinAge = 18,
                    MaxAge = 65,
                    Benefit = "Collateral-free loan up to &#8377;50,000",
                    Description = "Micro-credit scheme to help street vendors access affordable working capital loans up to &#8377;50,000 on a progressive basis to resume their livelihoods.",
                    EligibleOccupations = "Street Vendor / Hawkers",
                    RequiredDocuments = new List<string> { "Aadhaar Card", "Voter ID", "Bank passbook", "Vending Certificate" },
                    IsSaved = false,
                    IsApplied = false,
                    AccessCount = 650,
                    ImageUrl = "Images/schemes/employment.jpg"
                }
            };

            // Seed Notifications
            Notifications = new List<NotificationItem>
            {
                new NotificationItem
                {
                    Id = 1,
                    Title = "Your eligibility check is complete. 4 schemes found.",
                    TimeAgo = "2 hours ago",
                    IsRead = false,
                    Type = "check"
                },
                new NotificationItem
                {
                    Id = 2,
                    Title = "PM Kisan next installment due in 15 days.",
                    TimeAgo = "1 day ago",
                    IsRead = false,
                    Type = "installment"
                },
                new NotificationItem
                {
                    Id = 3,
                    Title = "New scheme added: PM SVANidhi. Check eligibility.",
                    TimeAgo = "3 days ago",
                    IsRead = true,
                    Type = "scheme"
                },
                new NotificationItem
                {
                    Id = 4,
                    Title = "Profile updated successfully.",
                    TimeAgo = "1 week ago",
                    IsRead = true,
                    Type = "profile"
                }
            };

            // State Analytics Stats
            StateStats = new List<StateStat>
            {
                new StateStat { StateName = "Uttar Pradesh", UserCount = 842, Percent = 85 },
                new StateStat { StateName = "Bihar", UserCount = 620, Percent = 62 },
                new StateStat { StateName = "Madhya Pradesh", UserCount = 415, Percent = 42 },
                new StateStat { StateName = "Rajasthan", UserCount = 310, Percent = 31 },
                new StateStat { StateName = "Maharashtra", UserCount = 264, Percent = 26 }
            };

            // Monthly Activities
            MonthlyActivities = new List<MonthlyActivity>
            {
                new MonthlyActivity { Month = "August 2024", NewUsers = 412, EligibilityChecks = 1820, SchemesApplied = 230, ApprovalRate = "94%" },
                new MonthlyActivity { Month = "July 2024", NewUsers = 388, EligibilityChecks = 1640, SchemesApplied = 198, ApprovalRate = "92%" },
                new MonthlyActivity { Month = "June 2024", NewUsers = 305, EligibilityChecks = 1310, SchemesApplied = 162, ApprovalRate = "89%" },
                new MonthlyActivity { Month = "May 2024", NewUsers = 271, EligibilityChecks = 1120, SchemesApplied = 140, ApprovalRate = "91%" },
                new MonthlyActivity { Month = "April 2024", NewUsers = 224, EligibilityChecks = 930, SchemesApplied = 115, ApprovalRate = "88%" }
            };
        }
    }
}
