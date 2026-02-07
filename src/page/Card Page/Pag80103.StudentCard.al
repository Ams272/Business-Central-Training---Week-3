page 80103 StudentCard
{
    PageType = Card;
    ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = Student;

    layout
    {
        area(Content)
        {
            group(Details)
            {

                field("Matric No."; Rec."Matric No.")
                {
                    ToolTip = 'Specifies the value of the Matric Numer field.', Comment = '%';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
            }

            group("Other Details")
            {

                field("Student Address"; Rec."Student Address")
                {
                    ToolTip = 'Specifies the value of the Student Address field.', Comment = '%';
                }
                field("Student Email"; Rec."Student Email")
                {
                    ToolTip = 'Specifies the value of the Student Email field.', Comment = '%';
                }
                field(Age; Rec.Age)
                {
                    ToolTip = 'Specifies the value of the Age field.', Comment = '%';
                }
                field("Class Teacher"; Rec."Class Teacher")
                {
                    ToolTip = 'Specifies the value of the Class Teacher field.', Comment = '%';
                }
            }

            group(Calculation)
            {
                field("Value 1"; Rec."Value 1")
                {
                    ToolTip = 'Specifies the value of the Value 1 field.', Comment = '%';
                }
                field("Value 2"; Rec."Value 2")
                {
                    ToolTip = 'Specifies the value of the Value 2 field.', Comment = '%';
                }
                field("Result"; Rec."Result")
                {
                    ToolTip = 'Specifies the value of the Result field.', Comment = '%';
                }
            }

            group("Filter Group")
            {

                field("Filter 1"; Rec."Filter 1")
                {
                    ToolTip = 'Specifies the value of the Filter 1 field.', Comment = '%';
                }
                field("Filter 2"; Rec."Filter 2")
                {
                    ToolTip = 'Specifies the value of the Filter 2 field.', Comment = '%';
                }
                field("Filter 3"; Rec."Filter 3")
                {
                    ToolTip = 'Specifies the value of the Filter 3 field.', Comment = '%';
                }
            }

            group("Field Class Types")
            {

                field("Customer ID"; Rec."Customer ID")
                {
                    ToolTip = 'Specifies the value of the Customer ID field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Sales Document No."; Rec."Sales Document No.")
                {
                    ToolTip = 'Specifies the value of the Sales Document No. field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
                field("Average Amount"; Rec."Average Amount")
                {
                    ToolTip = 'Specifies the value of the Average Amount field.', Comment = '%';
                }
                field(Maximum; Rec.Maximum)
                {
                    ToolTip = 'Specifies the value of the Maximum field.', Comment = '%';
                }
                field(Mininum; Rec.Mininum)
                {
                    ToolTip = 'Specifies the value of the Mininum field.', Comment = '%';
                }
                field("Count"; Rec."Count")
                {
                    ToolTip = 'Specifies the value of the Count field.', Comment = '%';
                }
                field("Exist"; Rec."Exist")
                {
                    ToolTip = 'Specifies the value of the Exist field.', Comment = '%';
                }

            }

            grid(Grid1)
            {

                field("Student Phone no"; Rec."Student Phone no")
                {
                    ToolTip = 'Specifies the value of the Student Phone no field.', Comment = '%';
                }
                field("Date of birth"; Rec."Date of birth")
                {
                    ToolTip = 'Specifies the value of the Date of birth field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        GlobalDecimal := 0;
                    end;
                }
            }

            part(sales; "Sales Order Subform")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
                SubPageLink = "Sell-to Customer No." = field("Sales Document No.");
            }

        }

        area(FactBoxes)
        {
            part(customer; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Matric No.");
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
                // SubPageLink = "Matric No." = field("Matric No.");
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
                // SubPageLink = where = field("Matric No.");
            }


        }
    }

    actions
    {
        area(Processing)
        {
            action("Say Hello")
            {
                ApplicationArea = All;
                Caption = 'Greet Student';
                Image = AddAction;
                Enabled = true;

                trigger OnAction()
                var
                    myInt, myint2 : Integer;
                    myDate, dateofBirth : Date;

                    myCode: Code[30];
                    myText: Text[100];
                    myDecimal: Decimal;

                    studentTable: Record Student;
                    StudentPage: Page StudentCard;
                    reportSample: Report "Account Schedule";

                begin
                    GlobalDecimal := 100;
                    Rec.Result := Rec."Value 1" + Rec."Value 2";
                    Rec.Modify();
                end;
            }

            action(CalcField)
            {
                ApplicationArea = All;
                Image = Calculate;
                trigger OnAction()
                var
                    SchoolFeesPayment: Record "School Fees Payment Header";
                begin
                    if SchoolFeesPayment.Get('100') then begin

                        // SchoolFeesPayment.SetAutoCalcFields("Total Line Amount");
                        SchoolFeesPayment.CalcFields("Total Line Amount");
                        Message('The Total Line Amount of this Payment is : %1', SchoolFeesPayment."Total Line Amount");
                    end;
                end;
            }
            action(NormalSummation)
            {
                ApplicationArea = All;
                Image = CalculateBalanceAccount;
                trigger OnAction()
                var
                    SchoolFeesLine: Record "School Fees Payment Lines";
                    TotalLineAmount: Decimal;
                begin
                    TotalLineAmount := 0;

                    SchoolFeesLine.Reset();
                    SchoolFeesLine.SetRange("Document No.", '200');
                    if SchoolFeesLine.FindSet() then
                        repeat
                            TotalLineAmount := TotalLineAmount + SchoolFeesLine."Payment Ammount";
                        until SchoolFeesLine.Next() = 0;

                    Message('The Total Line Amount of this Payment using Normal Summation is : %1', TotalLineAmount);


                end;
            }
            action(CalcSums)
            {
                ApplicationArea = All;
                Image = CalculateBalanceAccount;
                trigger OnAction()
                var
                    SchoolFeesLine: Record "School Fees Payment Lines";
                    TotalLineAmount: Decimal;

                begin
                    SchoolFeesLine.Reset();
                    SchoolFeesLine.SetRange("Document No.", '200');
                    SchoolFeesLine.CalcSums("Payment Ammount");

                    Message('The Total Line Amount of this Payment using Calcsum Method is : %1', SchoolFeesLine."Payment Ammount");

                end;
            }
        }
    }




    var
        myInt: Integer;
        GlobalDecimal: Decimal;
}