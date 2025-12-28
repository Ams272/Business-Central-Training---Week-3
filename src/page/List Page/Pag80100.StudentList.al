Page 80100 "Student List"
{
    ApplicationArea = All;
    Caption = 'Bowen University Student List';
    PageType = List;
    SourceTable = Student;
    UsageCategory = Lists;


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Matric No."; Rec."Matric No.")
                {

                }
                field("Student Name"; Rec."Student Name")
                {

                }
                field("Student Address"; Rec."Student Address")
                {

                }
                field("Student Email"; Rec."Student Email")
                {

                }
            }
        }

    }
}