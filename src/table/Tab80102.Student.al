table 80102 Student
{
    Caption = 'Student Table';
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Matric No."; Code[20])
        {
            Caption = 'Matric Numer';

        }
        field(20; "Student Name"; Text[100])
        {

        }
        field(30; "Student Address"; Text[100])
        {

        }
        field(40; "Student Email"; Text[100])
        {

        }
        field(50; "Class Teacher"; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(60; "Student Phone no"; Text[100])
        {

        }
        field(70; "Age"; Text[100])
        {

        }
        field(80; "Date of birth"; date)
        {

        }
        field(90; "Value 1"; integer)
        {

        }
        field(100; "Value 2"; integer)
        {

        }
        field(110; "Result"; integer)
        {

        }

        field(120; "Filter 1"; Text[30])
        {

        }
        field(130; "Filter 2"; Text[30])
        {

        }
        field(140; "Filter 3"; Text[30])
        {

        }
    }

    keys
    {
        key(PK; "Matric No.")
        {
            Clustered = true;

        }


    }

    fieldgroups
    {
        // Add changes to field groups here
        fieldgroup(DropDown; "Matric No.", "Student Name", "Student Email")
        {

        }
    }

}