namespace MyFirstProject.MyFirstProject;

using Microsoft.Finance.GeneralLedger.Account;

tableextension 80102 "GL/Account Ext" extends "G/L Account"
{
    fields
    {
        field(80100; Select; Boolean)
        {
            Caption = 'Select';
            DataClassification = ToBeClassified;
        }
    }
}
