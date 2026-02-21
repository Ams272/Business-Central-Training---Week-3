page 80104 "School Fees Document"
{
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "School Fees Payment Header";

    layout
    {
        area(Content)
        {
            group(General)
            {

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("Student Matric No."; Rec."Student Matric No.")
                {
                    ToolTip = 'Specifies the value of the Student Matric No. field.', Comment = '%';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
                field("Student Email"; Rec."Student Email")
                {
                    ToolTip = 'Specifies the value of the Student Email field.', Comment = '%';
                }
                field("Student Phone No."; Rec."Student Phone No.")
                {
                    ToolTip = 'Specifies the value of the Student Phone No. field.', Comment = '%';
                }
                field("Guardian Phone No."; Rec."Guardian Phone No.")
                {
                    ToolTip = 'Specifies the value of the Guardian Phone No. field.', Comment = '%';
                }
                field("Payment Receipt"; Rec."Payment Receipt")
                {
                    ToolTip = 'Specifies the value of the Payment Receipt field.', Comment = '%';
                }
                field("Total Line Amount"; Rec."Total Line Amount")
                {
                    ToolTip = 'Specifies the value of the Total Line Amount field.', Comment = '%';
                }
            }

            part(Lines; "School Fees Payment Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("Document No.");
                UpdatePropagation = Both;
            }
        }

    }

    actions
    {
        area(Processing)
        {
            action("Date Functions")
            {
                ApplicationArea = All;
                Image = DueDate;

                trigger OnAction()
                var
                    DateVariable: Date;
                    CalculatedDate: Date;
                    Day, Month, Year, Week : Integer;
                    DateTimeVariable: DateTime;
                    DateFormulaText: Text;
                begin
                    DateVariable := Today();
                    DateTimeVariable := CurrentDateTime();
                    // Message('Day of the month is : %1', DateVariable.Day);
                    // Message('Day of the week is : %1', DateVariable.DayOfWeek);
                    // Message('Month is : %1', DateVariable.Month);
                    // Message('Text equivalent : %1', DateVariable.ToText());
                    // Message('Week Number in the year is : %1', DateVariable.WeekNo);
                    // Message('Year is : %1', DateVariable.Year);

                    Message('The current date is: %1', DateVariable);
                    Message('The current date and time is: %1', DateTimeVariable);

                    CalculatedDate := CalcDate(DateFormulaText, DateVariable);

                    // Message('My calculated date CW is : %1', CalcDate('CW', DateVariable));
                    // Message('My calculated date CM is : %1', CalcDate('CM', DateVariable));
                    // Message('My calculated date -CM is : %1', CalcDate('-CM', DateVariable));
                    // Message('My calculated date 10D is : %1', CalcDate('10D', DateVariable));
                    // Message('My calculated date 2W is : %1', CalcDate('2W', DateVariable));
                    // Message('My calculated date D10 is : %1', CalcDate('D10', DateVariable));
                    // Message('My calculated date WD4 is : %1', CalcDate('WD4', DateVariable));
                    // Message('My calculated date CM+10D is : %1', CalcDate('CM+10D', DateVariable));
                    // Message('My calculated date -1Y is : %1', CalcDate('-1Y', DateVariable));
                    // Message('My calculated date CY is : %1', CalcDate('CY', DateVariable));
                    // Message('My calculated date -CY is : %1', CalcDate('-CY', DateVariable));

                    // Message('My calculated date -CY-1D is : %1', CalcDate('-CY-1D', DateVariable));
                    // Message('My calculated date CY-1Y is : %1', CalcDate('CY-1Y', DateVariable));

                    // Day := Date2DMY(DateVariable, 1);
                    // Month := Date2DMY(DateVariable, 2);
                    // Year := Date2DMY(DateVariable, 3);

                    // Message('Day is: %1, Month is: %2, Year is: %3', Day, Month, Year);

                    // Day := Date2DWY(DateVariable, 1);
                    // Week := Date2DWY(DateVariable, 2);
                    // Year := Date2DWY(DateVariable, 3);

                    // Message('Day of the week is: %1, Week number is: %2, Year is: %3', Day, Week, Year);

                    // Message('The Date part of the DateTimeVariable %1 is %2', DateTimeVariable, DT2Date(DateTimeVariable));

                    Message('Convert Day (3), Month (May - 5) , Year(1999) to Date: %1 ', DMY2Date(3, 5, 1999));

                    Message('Convert Day of the Week (3), Week Number (15) , Year(2007) to Date: %1 ', DWY2Date(3, 15, 2007));

                    Message('Work Daate is %1', WorkDate());
                end;
            }
        }
    }

    var
        myInt: Integer;
}