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
    }

    keys
    {
        key(PK; "Matric No.")
        {
            Clustered = true;
        }


    }

}