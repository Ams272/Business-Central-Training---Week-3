report 80100 StudentReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = Word;
    WordLayout = './src/ssrs/StudentRecord.docx';

    dataset
    {
        dataitem(StudentRecord; Student)
        {
            column(Matric_No_; "Matric No.")
            {

            }
            column(Student_Name; "Student Name")
            {

            }
            column(Student_Email; "Student Email")
            {

            }
            column(Student_Phone_no; "Student Phone no")
            {

            }
            column(Student_Address; "Student Address")
            {

            }
        }

        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }
        }

        dataitem("School Fees Payment Header"; "School Fees Payment Header")
        {

            column(DocumentNo_SchoolFeesPaymentHeader; "Document No.")
            {
            }
            column(StudentMatricNo_SchoolFeesPaymentHeader; "Student Matric No.")
            {
            }
            column(StudentName_SchoolFeesPaymentHeader; "Student Name")
            {
            }
            column(StudentEmail_SchoolFeesPaymentHeader; "Student Email")
            {
            }

            dataitem("School Fees Payment Lines"; "School Fees Payment Lines")
            {
                DataItemLink = "Document No." = field("Document No.");



                column(DescriptionofPayment_SchoolFeesPaymentLines; "Description of Payment")
                {
                }
                column(PaymentAmmount_SchoolFeesPaymentLines; "Payment Ammount")
                {
                }
                column(BankCode_SchoolFeesPaymentLines; "Bank Code")
                {
                }
            }
        }


    }

    // requestpage
    // {
    //     AboutTitle = 'Teaching tip title';
    //     AboutText = 'Teaching tip content';
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(LayoutName)
    //             {

    //             }
    //         }
    //     }
    // }



    var
        myInt: Integer;
}