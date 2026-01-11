namespace Opay.Opay;

using Microsoft.Finance.GeneralLedger.Reports;
using Microsoft.Finance.GeneralLedger.Account;

reportextension 80100 "Detailed Trial Balance Ext" extends "Detail Trial Balance"
{
    RDLCLayout = 'DetailTrialBalanceExt.rdl';

    dataset
    {
        add("G/L Account")
        {
            column(OpeningBalance; OpeningBalance) { }
            column(ClosingBalance; ClosingBalance) { }
        }

        modify("G/L Account")
        {

            trigger OnBeforePreDataItem()
            var
                myInt: Integer;
            begin
                if (Format("Period Start Date") = '') and (Format("Period End Date") = '') then
                    setfilter("Date Filter", '..%1', Today)
                else if (Format("Period Start Date") = '') and (Format("Period End Date") <> '') then
                    SetFilter("Date filter", '..%1', "Period End Date")
                else if (Format("Period Start Date") <> '') and (Format("Period End Date") = '') then
                    SetFilter("Date filter", '%1..%2', "Period Start Date", Today)
                else if (Format("Period Start Date") <> '') and (Format("Period End Date") <> '') then
                    SetFilter("Date filter", '%1..%2', "Period Start Date", "Period End Date");
            end;

            trigger OnAfterAfterGetRecord()

            begin
                OpeningBalance := 0;
                ClosingBalance := 0;

                minPeriodFilter := "G/L Account".GetRangeMin("Date Filter");
                maxPeriodFilter := "G/L Account".GetRangeMax("Date Filter");

                GLAcct.Reset();
                GLAcct.SetRange("No.", "G/L Account"."No.");
                GLAcct.SetFilter("Date Filter", '..%1', CalcDate('-1D', minPeriodFilter));
                if GLAcct.Findfirst() then begin
                    GLAcct.CalcFields("Net Change");
                    OpeningBalance := GLAcct."Net Change";
                end;

                GLAcct.Reset();
                GLAcct.SetRange("No.", "G/L Account"."No.");
                GLAcct.SetFilter("Date Filter", '..%1', maxPeriodFilter);
                if GLAcct.Findfirst() then begin
                    GLAcct.CalcFields("Net Change");
                    ClosingBalance := GLAcct."Net Change";
                end;

            end;
        }
    }

    requestpage
    {
        layout
        {
            addlast(Options)
            {
                field("Period Start Date"; "Period Start Date")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Textfilter: Text;
                        DateFilter: Date;

                    begin
                        Textfilter := Format("Period Start Date") + '..' + Format("Period End date");
                        Evaluate(DateFilter, Textfilter);
                        "G/L Account".setfilter("Date Filter", Textfilter);
                        "G/L Account"."Date Filter" := DateFilter;

                        Update(true);

                    end;

                }
                field("Period End date"; "Period End date")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        Textfilter: Text;
                        DateFilter: Date;
                    begin
                        Textfilter := Format("Period Start Date") + '..' + Format("Period End date");
                        Evaluate(DateFilter, Textfilter);
                        "G/L Account".setfilter("Date Filter", Textfilter);
                        // "G/L Account"."Date Filter" := DateFilter;

                        // Report.
                        Update(true);

                    end;
                }
            }
        }
    }

    trigger OnPreRendering(var RenderingPayload: JsonObject)
    begin

    end;

    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        if (Format("Period Start Date") = '') and (Format("Period End Date") = '') then
            "G/L Account".setfilter("Date Filter", '..%1', Today)
        else if (Format("Period Start Date") = '') and (Format("Period End Date") <> '') then
            "G/L Account".SetFilter("Date filter", '..%1', "Period End Date")
        else if (Format("Period Start Date") <> '') and (Format("Period End Date") = '') then
            "G/L Account".SetFilter("Date filter", '%1..%2', "Period Start Date", Today)
        else if (Format("Period Start Date") <> '') and (Format("Period End Date") <> '') then
            "G/L Account".SetFilter("Date filter", '%1..%2', "Period Start Date", "Period End Date");

        // GLDateFilter := "G/L Account".GetFilter("Date Filter");
    end;

    var
        "Period Start Date", "Period End date" : Date;
        OpeningBalance, ClosingBalance : Decimal;
        GLAcct: Record "G/L Account";
        minPeriodFilter, maxPeriodFilter : Date;
}
