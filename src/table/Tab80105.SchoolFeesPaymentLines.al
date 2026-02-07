table 80105 "School Fees Payment Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(10; "Document No."; code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "School Fees Payment Header"."Document No.";
        }
        field(20; "Line No."; integer)
        {
            DataClassification = CustomerContent;
            Editable = false;
            Autoincrement = true;
        }

        field(30; "Description of Payment"; Text[100])
        {
            DataClassification = customercontent;
        }
        field(40; "Payment Ammount"; Decimal)
        {
            DataClassification = customercontent;
        }
        field(50; "Bank Code"; Code[20])
        {
            DataClassification = customercontent;
        }
        field(60; "Bank Account Number"; Text[20])
        {
            DataClassification = customercontent;
        }
        field(70; "Bank Account Name"; text[50])
        {
            DataClassification = customercontent;
        }



    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

}