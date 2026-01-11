namespace Opay.Opay;

using Microsoft.Finance.GeneralLedger.Ledger;

pageextension 80203 "General ledger entries ext" extends "General Ledger Entries"
{
    layout
    {
        addafter(Description)
        {

            // field("Description 2"; Rec."Description 2")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Description 2 field.', Comment = '%';
            // }
        }
    }

    actions
    {
        addafter(ReverseTransaction)
        {
            action("Open Filter page")
            {
                ApplicationArea = All;
                Caption = 'Open Filter Page';
                Image = Filter;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    FilterPage: Page "Filter Page";
                    EndDate: Date;
                    GLAcctFilter: Text[1024];
                    StartDate: Date;
                    GLEntry: Record "G/L Entry";
                begin
                    if FilterPage.RunModal() = Action::OK then begin
                        FilterPage.getFilterDetails(StartDate, EndDate, GLAcctFilter);

                        GLEntry.Setrange("G/L Account No.");
                        GLEntry.Reset();
                        GLEntry.SetFilter("G/L Account No.", GLAcctFilter);
                        if (StartDate <> 0D) and (EndDate <> 0D) then
                            GLEntry.SetRange("Posting Date", StartDate, EndDate);
                        CurrPage.SetTableView(GLEntry);
                    end;
                end;
            }

        }
    }

}
