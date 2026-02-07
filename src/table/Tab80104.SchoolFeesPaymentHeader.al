table 80104 "School Fees Payment Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Document No."; code[20])
        {
            DataClassification = CustomerContent;

        }

        field(20; "Student Matric No."; code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Student."Matric No.";
            trigger onValidate()
            var
                Student: Record Student;
            begin
                if Student.Get("Student Matric No.") then begin
                    "Student Name" := Student."Student Name";
                    "Student Email" := Student."Student Email";
                    "Student Phone No." := Student."Student Phone no";
                end;
            end;
        }
        field(30; "Student Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(40; "Student Email"; Text[50])
        {
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(50; "Student Phone No."; Text[50])
        {
            DataClassification = CustomerContent;
            Editable = false;

        }
        field(60; "Payment Receipt"; Text[20])
        {
            DataClassification = CustomerContent;

        }
        field(70; "Guardian Phone No."; Text[40])
        {
            DataClassification = CustomerContent;

        }
        field(80; "Total Line Amount"; Decimal)
        {
            Editable = false;
            fieldClass = Flowfield;
            Calcformula = Sum("School Fees Payment Lines"."Payment Ammount" where("Document No." = field("Document No.")));
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;


}