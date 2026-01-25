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
                    trigger OnValidate()
                    begin
                        mynewfunctio();
                    end;
                }
            }


        }




    }

    actions
    {

        area(Processing)
        {

            action(PassByValue)
            {
                ApplicationArea = All;
                Image = Email;
                trigger OnAction()
                var
                    StudentMgmt: Codeunit "Student Management";
                    myReturnValue: Integer;
                    myBooleanValue: Boolean;
                    myText: Text[30];

                begin

                    myText := 'Aminu';
                    Message('Text before calling PassByValueExample: %1', myText);
                    StudentMgmt.passByValueExample(myText);
                    Message('Text after calling PassByValueExample: %1', myText);

                end;
            }

            action(PassByReference)
            {
                ApplicationArea = All;
                Image = Email;
                trigger OnAction()
                var
                    StudentMgmt: Codeunit "Student Management";
                    myReturnValue: Integer;
                    myBooleanValue: Boolean;
                    myText: Text[30];

                begin

                    myText := 'Aminu';
                    Message('Text before calling passbyreferenceexample: %1', myText);
                    StudentMgmt.passbyreferenceexample(myText);
                    Message('Text after calling passbyreferenceexample: %1', myText);

                end;
            }
            action(ModifyEmail)
            {
                ApplicationArea = All;
                Image = Email;
                trigger OnAction()
                var
                    StudentMgmt: Codeunit "Student Management";
                    myReturnValue: Integer;
                    myBooleanValue: Boolean;
                    myText: Text[30];

                begin

                    myBooleanValue := StudentMgmt.UpdateStudentEmail(Rec."Matric No.", 'mynewemail@yahoo.com');

                    Message('Return Value from UpdateStudentEmail procedure is %1', myBooleanValue);

                end;
            }

            action(FilterRecordSetRange)
            {
                ApplicationArea = All;
                Caption = 'Filter Record Set Range';
                Image = Filter;
                trigger OnAction()
                var

                    StudentMgmt: Codeunit "Student Management";
                begin
                    // StudentMgmt.setFilterForStudentRecord();

                    StudentMgmt.GetStudentDetails(Rec."Matric No.");

                end;
            }

            action(FilterRecordSetFilter)
            {
                ApplicationArea = All;
                Caption = 'Filter Record Set Filter';
                Image = FilterLines;
                trigger OnAction()
                var

                    StudentMgmt: Codeunit "Student Management";
                begin
                    // StudentMgmt.setRangeForStudentRecord();

                    StudentMgmt.GetStudentDetails('7501');

                end;
            }

            action(IsEmpty)
            {
                ApplicationArea = All;
                Caption = 'Check If Record Set is Empty';
                Image = CheckList;


                trigger OnAction()
                var
                    studentRecord, studentRecord2 : Record Student;
                begin
                    studentRecord.Reset();
                    studentRecord.SetRange("Matric No.", '7500', '8000');
                    if studentRecord.IsEmpty() then begin

                        studentRecord2.Init();
                        studentRecord2."Matric No." := '7501';
                        studentRecord2."Student Name" := 'Adekunle Gbadamosi';
                        studentRecord2."Student Address" := 'Ikoyi, Lagos State';
                        studentRecord2."Student Email" := 'adekunle.gbadamosi@gmail.com';
                        studentRecord2."Student Phone no" := '08012345678';
                        studentRecord2."Date of birth" := DMY2Date(15, 5, 2000);
                        studentRecord2.Insert();


                    end
                    else begin
                        Error('Record Set is not Empty');
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
                    mynewfunctio()
                end;
            }
        }
    }



    trigger OnOpenPage()
    var
        StudentMgt: Codeunit "Student Management";
    begin
        // StudentMgt.learnArray();

        StudentMgt.learnList();

    end;


    procedure mynewfunctio()
    begin

    end;

    var





}