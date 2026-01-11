namespace MyFirstProject.MyFirstProject;

using Microsoft.Finance.GeneralLedger.Account;

page 80102 "G/L Account List Ext"
{
    ApplicationArea = All;
    Caption = 'G/L Account List Ext';
    PageType = List;
    SourceTable = "G/L Account";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Select; Rec.Select)
                {
                    ToolTip = 'Specifies the value of the Select field.', Comment = '%';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the name of the general ledger account.';
                    Editable = false;

                }
                field("Account Category"; Rec."Account Category")
                {
                    ToolTip = 'Specifies the category of the G/L account.';
                    Editable = false;

                }
                field("Income/Balance"; Rec."Income/Balance")
                {
                    Editable = false;

                    ToolTip = 'Specifies whether a general ledger account is an income statement account or a balance sheet account.';
                }
                field("Direct Posting"; Rec."Direct Posting")
                {
                    Editable = false;

                    ToolTip = 'Specifies whether you will be able to post directly or only indirectly to this general ledger account.';
                }
                field(Blocked; Rec.Blocked)
                {
                    Editable = false;

                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                field("Net Change"; Rec."Net Change")
                {
                    Editable = false;

                    ToolTip = 'Specifies the net change in the account balance during the time period in the Date Filter field.';
                }
                field(Balance; Rec.Balance)
                {
                    Editable = false;

                    ToolTip = 'Specifies the balance on this account.';
                }
                field("Balance at Date"; Rec."Balance at Date")
                {
                    Editable = false;

                    ToolTip = 'Specifies the G/L account balance on the last date included in the Date Filter field.';
                }
            }
        }
    }


    trigger OnOpenPage()
    var
        GLAcct: Record "G/L Account";
    begin
        GLAcct.Reset();
        GLAcct.SetRange(Select, true);
        GLAcct.ModifyAll(Select, false, false);
    end;

    // trigger OnAfterGetRecord()
    // var
    //     GLAcct: Record "G/L Account";
    // begin
    //     GLAcct.Reset();
    //     GLAcct.SetRange(Select, true);
    //     GLAcct.ModifyAll(Select, false, false);
    // end;
}
