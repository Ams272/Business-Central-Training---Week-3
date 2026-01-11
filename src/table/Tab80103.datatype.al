table 80103 datatype
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; SerialNo; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;


        }
        field(2; MatricNo; Code[20])
        {
            DataClassification = CustomerContent;
            Description = 'Matriculation Number of the Student';
            // Editable = false;
            TableRelation = Student."Matric No.";

            trigger OnValidate()
            begin
                Message('Hurray, you have entered  your matric number %1', Rec.MatricNo);
            end;
        }
        field(3; Name; Text[70])
        {
            DataClassification = CustomerContent;
            // MaskType = Concealed;
            // TableRelation

        }
        field(4; CostofItem; decimal)
        {
            DataClassification = CustomerContent;
            InitValue = 500000;
            MinValue = 0;
            MaxValue = 6;

        }
        field(5; "Date of resumption"; date)
        {
            DataClassification = CustomerContent;
        }
        field(6; "Date and time of graduation"; datetime)
        {
            DataClassification = CustomerContent;
        }
        field(7; "Time of Lecture"; time)
        {
            DataClassification = CustomerContent;
        }
        field(8; "Is Graduated"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(9; DateFormula; dateformula)
        {
            DataClassification = CustomerContent;
        }
        field(10; "Graduation Status"; Option)
        {
            DataClassification = CustomerContent;
            optionmembers = NotGraduated,Graduated,OnHold,pending;
            Caption = 'Graduation Status';

        }
        field(11; "Graduation Category"; Enum graduationCategory)
        {
            DataClassification = CustomerContent;
            Caption = 'Graduation Category';
        }
        field(13; blobField; Blob)
        {
            DataClassification = CustomerContent;

        }


    }

    keys
    {
        key(Key1; SerialNo)
        {
            Clustered = true;
        }
        // key(key2; MatricNo)
        // {
        //     // Unique = true;
        // }
    }

    fieldgroups
    {
        // Add changes to field groups here
        fieldgroup(DropDown; SerialNo, Name) { }
    }

    var
        firstVariable: Integer;

    trigger OnInsert()
    begin
        Message('A new record with Serial No %1 is being inserted', Rec.SerialNo);
    end;

    trigger OnModify()
    begin
        Message('A record with Serial No %1 is being modified', Rec.SerialNo);
    end;


    trigger OnDelete()
    begin
        Message('A record with Serial No %1 is being deleted', Rec.SerialNo);
    end;

    trigger OnRename()
    begin
        Message('A record with Serial No %1 is being renamed', Rec.SerialNo);
    end;

}