codeunit 80100 "Student Management"
{


    procedure CalculateGPA(Grades: List of [Decimal]): Decimal
    begin

    end;

    procedure CreateStudentRecord(var Name: Text[100]; var Age: Integer; var ClassTeacher: Text[100])
    begin

        // pass by value
        // pass by reference

    end;

    procedure passByValueExample(var StudentName: Text[100])
    begin
        StudentName := 'Pass By Value Changed Name';

        passByReferenceExample(StudentName);

    end;

    procedure passByReferenceExample(StudentName: Text[100])
    begin
        StudentName := 'Pass By Reference Changed Name';
    end;


    procedure UpdateStudentEmail(MatricNo: Text[20]; NewEmail: Text[100]): Boolean
    var
        anotherInteger: Integer;
        StudentRec: Record Student;
    begin

        StudentRec.Get(MatricNo);
        StudentRec."Student Email" := NewEmail;


        if StudentRec.Modify() then
            exit(true)
        else
            exit(false);
    end;

    procedure DeleteStudentRecord(MatricNo: Text[20])
    begin

    end;

    procedure GetStudentDetails(MatricNo: Text[20]): Record "Student"
    var
        StudentRec: Record Student;
    begin

        StudentRec.Get(MatricNo);
        // Message('Name: %1, Email: %2, Phone No: %3, Date of Birth: %4', StudentRec."Student Name", StudentRec."Student Email", StudentRec."Student Phone no", StudentRec."Date of birth");
        StudentRec."Student Name" := 'Practicing Funtions and Procedures ';
        StudentRec.Modify();
    end;

    procedure setFilterForStudentRecord()
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

    procedure setRangeForStudentRecord()
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



    // Array, List and Dictionary
    /* Another way of writing comment */


    // Array
    procedure learnArray()
    var
        myfirstArray: array[6] of Integer;
        myint1, myint2, myint3 : integer;

        matricNoArray: array[40] of Code[20];
        studentNameArray: array[40] of Text;
        Student: Record Student;
        index: Integer;
        forLoopIndex: Integer;
    begin
        // Clear(myfirstArray);

        // myfirstArray[1] := 2;
        // myfirstArray[2] := 4;
        // myfirstArray[3] := 3;
        // myfirstArray[4] := 9;
        // myfirstArray[5] := 1;
        // myfirstArray[6] := 7;


        // // myfirstArray[4] := 17;

        // message('Display the 2nd value (Index 2) in "MY FIRST ARRAY":  %1',  myfirstArray[2])


        Clear(matricNoArray);
        Clear(studentNameArray);
        index := 0;

        Student.Reset();
        if Student.FindSet() then
            repeat
                index := index + 1;
                matricNoArray[index] := Student."Matric No.";
                studentNameArray[index] := Student."Student Name";
            until Student.Next() = 0;


        for forLoopIndex := 1 to index do begin

            Message('Student (%3) Matric No. is  %1, and Student Name is : %2', matricNoArray[forLoopIndex], studentNameArray[forLoopIndex], forLoopIndex);

        end;
    end;


    // LIST

    procedure learnList()
    var
        myFirstList: List of [Text];
        mynewListw: List of [Text];
        index1Variable: Text;
        index2Variable: Text;
        index3Variable: Text;
        index4Variable: Text;
        index5Variable: Text;

        booleanReturnValue: Boolean;

        testFruit: Text;
        indexOfVariable: Integer;
    begin
        // myFirstList.Add('Apple');   // Index 1
        // myFirstList.Add('Banana');  // Index 2
        // myFirstList.Add('Orange');  // Index 3


        // myFirstList.Get(1, index1Variable);
        // myFirstList.Get(2, index2Variable);
        // myFirstList.Get(3, index3Variable);

        myFirstList.AddRange('Apple', 'Banana', 'Orange', 'Pineapple', 'Orange', 'Guava');

        myFirstList.Remove('Mango');
        myFirstList.RemoveAt(3);
        myFirstList.RemoveRange(2, 3);


        testFruit := 'Orange';
        booleanReturnValue := myFirstList.Contains(testFruit);

        indexOfVariable := myFirstList.IndexOf(testFruit); // Index of Orange here is 3

        Message('Index of %1 Before is : %2', testFruit, indexOfVariable); // Index of Orange Before is 3

        myFirstList.Insert(indexOfVariable, 'Mango');

        indexOfVariable := myFirstList.IndexOf(testFruit); // Index of Orange here is 4

        Message('Index of %1 After is : %2', testFruit, indexOfVariable); // Index of Orange After is 4

        myFirstList.Get(3, index1Variable);

        Message('Value in index 3 is now : %1', index1Variable); //Value in index 3 is now Mango

        // indexOfVariable := myFirstList.LastIndexOf(testFruit);

        // myFirstList.LastIndexOf()


        // Message('Before Guava is added, the count of the list is : %1', myFirstList.Count);

        // if booleanReturnValue = true then
        //     Message('The fruit already exist!')
        // else begin
        //     myFirstList.Add(testFruit);
        //     Message('Fruit successfully added');

        //     Message('After Guava is added, the count of the list is : %1', myFirstList.Count);


        //     myFirstList.Get(myFirstList.Count, index5Variable);
        //     Message('Latest added fruit is : %1', index5Variable);


        // end;

        // mynewListw := myFirstList.GetRange(1, 2);


        // mynewListw.Get(1, index1Variable);
        // mynewListw.Get(2, index2Variable);
        // // mynewListw.Get(3, index3Variable);
        // // mynewListw.Get(4, index4Variable);

        // Message('Index 1 Value: %1, Index 2 Value: %2, Index 3 Value: %3, index 4 value: %4', index1Variable, index2Variable, index3Variable, index4Variable);
    end;


}