page 80104 "School Fees Document"
{
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "School Fees Payment Header";

    layout
    {
        area(Content)
        {
            group(General)
            {

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Student Matric No."; Rec."Student Matric No.")
                {
                    ToolTip = 'Specifies the value of the Student Matric No. field.', Comment = '%';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
                field("Student Email"; Rec."Student Email")
                {
                    ToolTip = 'Specifies the value of the Student Email field.', Comment = '%';
                }
                field("Student Phone No."; Rec."Student Phone No.")
                {
                    ToolTip = 'Specifies the value of the Student Phone No. field.', Comment = '%';
                }
                field("Guardian Phone No."; Rec."Guardian Phone No.")
                {
                    ToolTip = 'Specifies the value of the Guardian Phone No. field.', Comment = '%';
                }
                field("Payment Receipt"; Rec."Payment Receipt")
                {
                    ToolTip = 'Specifies the value of the Payment Receipt field.', Comment = '%';
                }
                field("Total Line Amount"; Rec."Total Line Amount")
                {
                    ToolTip = 'Specifies the value of the Total Line Amount field.', Comment = '%';
                }
            }

            part(Lines; "School Fees Payment Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("Document No.");
                UpdatePropagation = Both;
            }
        }

    }

    actions
    {
        area(Processing)
        {

        }
    }

    var
        myInt: Integer;
}