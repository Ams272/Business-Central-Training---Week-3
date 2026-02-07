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
            FieldClass = FlowFilter;
        }
        field(145; "Customer ID"; Code[50])
        {

            // DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
        field(150; "Customer Name"; Text[100])
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer ID")));
        }
        field(155; "Sales Document No."; Code[50])
        {
            // DataClassification = CustomerContent;
            TableRelation = "Sales Header"."No.";
        }
        field(160; "Total Amount"; Decimal)
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("Sales Line"."Line Amount" where("Document No." = field("Sales Document No."), "Document Type" = const(Order)));
        }
        field(170; "Average Amount"; Decimal)
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = average("Sales Line"."Line Amount" where("Document No." = field("Sales Document No."), "Document Type" = const(Order)));
        }

        field(180; "Mininum"; Decimal)
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = min("Sales Line"."Line Amount" where("Document No." = field("Sales Document No."), "Document Type" = const(Order)));
        }
        field(190; "Maximum"; Decimal)
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = max("Sales Line"."Line Amount" where("Document No." = field("Sales Document No."), "Document Type" = const(Order)));
        }
        field(200; "Count"; Integer)
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = count("Sales Line" where("Document No." = field("Sales Document No."), "Document Type" = const(Order)));
        }
        field(210; "Exist"; Boolean)
        {
            // DataClassification = CustomerContent;
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = exist("Sales Header" where("No." = field("Sales Document No."), "Document Type" = const(Order)));
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