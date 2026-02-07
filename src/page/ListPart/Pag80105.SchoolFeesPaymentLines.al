page 80105 "School Fees Payment Lines"
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "School Fees Payment Lines";
    AutoSplitKey = true;


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Description of Payment"; Rec."Description of Payment")
                {
                    ToolTip = 'Specifies the value of the Description of Payment field.', Comment = '%';
                }
                field("Payment Ammount"; Rec."Payment Ammount")
                {
                    ToolTip = 'Specifies the value of the Payment Ammount field.', Comment = '%';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ToolTip = 'Specifies the value of the Bank Code field.', Comment = '%';
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ToolTip = 'Specifies the value of the Bank Account Name field.', Comment = '%';
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ToolTip = 'Specifies the value of the Bank Account Number field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}