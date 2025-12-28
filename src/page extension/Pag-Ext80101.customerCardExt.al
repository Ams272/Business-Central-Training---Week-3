pageextension 80101 customerCardExt extends "Customer Card"
{
    layout
    {
        addafter(Blocked)
        {
            field("TIN Number"; Rec."TIN Number")
            {
                ApplicationArea = All;
                Caption = 'TIN Number';
            }
        }
    }
}