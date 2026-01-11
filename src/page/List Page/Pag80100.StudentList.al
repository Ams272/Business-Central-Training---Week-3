Page 80100 "Student List"
{
    ApplicationArea = All;
    Caption = 'Bowen University Student List';
    PageType = List;
    SourceTable = Student;
    UsageCategory = Lists;
    CardPageId = StudentCard;
    Editable = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    InsertAllowed = false;


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

    actions
    {

        area(Processing)
        {

            action(FilterRecordSetRange)
            {
                ApplicationArea = All;
                Caption = 'Filter Record Set Range';
                Image = Filter;
                trigger OnAction()
                var
                    studentRecord: Record Student;
                    CustomerRec: Record Customer;
                begin
                    studentRecord.Reset();
                    studentRecord.SetRange("Matric No.", '10000', '10012');
                    if studentRecord.FindSet() then begin
                        repeat
                            studentRecord."Student Name" := studentRecord."Student Name" + ' - Filtered';
                            studentRecord.Modify();

                        until studentRecord.Next() = 0;
                    end;
                end;
            }

            action(FilterRecordSetFilter)
            {
                ApplicationArea = All;
                Caption = 'Filter Record Set Filter';
                Image = FilterLines;
                trigger OnAction()
                var
                    studentRecord: Record Student;
                    studentRecord2: Record Student;

                    CustomerRec: Record Customer;
                begin
                    studentRecord2.Get('10012');


                    studentRecord.Reset();
                    studentRecord.SetFilter("Matric No.", '%1..%2|%3', studentRecord2."Filter 1", studentRecord2."Filter 2", studentRecord2."Filter 3");

                    if studentRecord.FindSet() then begin
                        repeat
                            studentRecord."Student Name" := studentRecord."Student Name" + ' - Filtered';
                            studentRecord.Modify();

                        until studentRecord.Next() = 0;
                    end;
                end;
            }
        }

        area(Navigation)
        {
            action(ViewStudentCard)
            {
                ApplicationArea = All;
                Caption = 'View Student Card';
                Image = View;

                trigger OnAction()
                begin

                end;
            }
        }

        area(Reporting)
        {
            action(GenerateReport)
            {
                ApplicationArea = All;
                Caption = 'Generate Report';
                Image = PrintReport;

                trigger OnAction()
                begin

                end;
            }
        }
    }


}