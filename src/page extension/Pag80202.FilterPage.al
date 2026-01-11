namespace Opay.Opay;
using Microsoft.Finance.Analysis;
using Microsoft.Finance.GeneralLedger.Account;
using MyFirstProject.MyFirstProject;

page 80202 "Filter Page"
{
    ApplicationArea = All;
    Caption = 'Filter Page';
    PageType = StandardDialog;

    layout
    {
        area(Content)
        {
            group(Group)
            {
                Caption = 'Filters';

                field("G/L Account No."; GLAcctFilter)
                {
                    ApplicationArea = All;
                    Caption = 'G/L Account No.';

                    Lookup = true;
                    trigger OnAssistEdit()
                    var
                        GLAcctList: Page "G/L Account List Ext";
                        Glacct: Record "G/L Account";
                        GLAcctCodes: TextBuilder;
                        GLAcctCount: Integer;
                        // SelectedVendors: Record "Selected Vendor Line";
                        LineNumber: Integer;
                    begin
                        // LineNumber := 1000;
                        // Glacct.Reset();
                        // Glacct.SetCurrentKey("No.");
                        // GLAcctList.SetRecord(Glacct);
                        GLAcctList.LookupMode := true;
                        if GLAcctList.RunModal() = Action::LookupOK then begin
                            if Glacct.HasFilter then Glacct.Reset();
                            Glacct.SetRange(Select, true);
                            // GLAcctList.SetSelectionFilter(Glacct);
                            GLAcctCount := 0;
                            Clear(GLAcctCodes);

                            if Glacct.FindSet() then
                                repeat

                                    LineNumber += 10000;

                                    if ((GLAcctCount > 0) and (GLAcctCount <> GLAcct.Count)) then
                                        GLAcctCodes.Append('|');

                                    GLAcctCodes.Append(Glacct."No.");

                                    GLAcctCount += 1;
                                until Glacct.Next() = 0;

                            GLAcctFilter := GLAcctCodes.ToText();

                        end;

                    end;
                }

                // field("Description 2"; GenJnlLineExt."Description 2")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Description 2';
                // }
            }
            group(Date)
            {
                Caption = 'Date Filters';

                field("Start Date"; StartDate)
                {
                    ApplicationArea = All;
                    Caption = 'From Date';
                }

                field("End Date"; EndDate)
                {
                    ApplicationArea = All;
                    Caption = 'End Date';
                }
            }
        }
    }

    procedure getFilterDetails(var FromDate: Date; var ToDate: Date; var GLAcctNoFilter: Text[1024])
    // var-
    //     StartDate: Date;
    //     EndDate: Date;
    //     GLAcctFilter: Text[1024];
    begin

        FromDate := StartDate;
        ToDate := EndDate;
        GLAcctNoFilter := GLAcctFilter;
    end;


    var
        StartDate: Date;
        EndDate: Date;
        GLAcctFilter: Text[1024];
}
