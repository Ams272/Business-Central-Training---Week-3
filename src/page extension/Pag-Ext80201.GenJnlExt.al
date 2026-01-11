namespace Opay.Opay;

using Microsoft.Finance.GeneralLedger.Journal;

pageextension 80201 "Gen, Jnl Ext" extends "General Journal"
{
    layout
    {
        addafter(CurrentJnlBatchName)
        {
            field("Journal Template Name"; Rec."Journal Template Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the journal template.';
                Editable = false;
            }

            field(GenJournalTemplateName; GenJournalTemplateName)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the name of the journal template.';
                trigger OnLookup(var Text: Text): Boolean
                var
                    JournalTemplatePage: Page "General Journal Template List";
                    JournalTemplateRec: Record "Gen. Journal Template";
                begin
                    CurrPage.SaveRecord();
                    JournalTemplateRec.Reset();
                    JournalTemplatePage.SetRecord(JournalTemplateRec);
                    if JournalTemplatePage.RunModal() = Action::LookupOK then begin
                        GenJournalTemplateName := JournalTemplateRec.Name;
                        Rec."Journal Template Name" := GenJournalTemplateName;
                        Rec.Modify();
                        Text := GenJournalTemplateName;
                        CurrentJnlBatchName := '';
                    end;

                END;
            }
        }
        modify("Account No.")
        {
            trigger OnAfterValidate()
            begin
                Rec.Description := '';
                // Rec."Description 2" := '';
            end;
        }
        addafter(Description)
        {

            // field("Description 2"; Rec."Description 2")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Description 2 field.', Comment = '%';
            // }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if (Rec."Account No." = '') OR (rEC."Document No." = '') then begin
            Clear(Rec."Posting Date");
            Clear(Rec."VAT Reporting Date");

        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if (Rec."Account No." = '') OR (rEC."Document No." = '') then begin
            Clear(Rec."Posting Date");
            Clear(Rec."VAT Reporting Date");

        end;
    end;

    var
        GenJournalTemplateName: Text[20];
}
