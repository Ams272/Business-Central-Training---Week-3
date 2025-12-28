Page 80101 Datatype
{
    ApplicationArea = All;
    Caption = 'Datatype Example Page';
    PageType = List;
    SourceTable = datatype;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field(SerialNo; Rec.SerialNo)
                {
                    ToolTip = 'This field is used to specify the serial number of this record';

                }

                field(CostofItem; Rec.CostofItem)
                {
                    ToolTip = 'Specifies the value of the CostofItem field.', Comment = '%';
                }
                field("Date and time of graduation"; Rec."Date and time of graduation")
                {
                    ToolTip = 'Specifies the value of the Date and time of graduation field.', Comment = '%';
                }
                field("Date of resumption"; Rec."Date of resumption")
                {
                    ToolTip = 'Specifies the value of the Date of resumption field.', Comment = '%';
                }
                field("DateFormula"; Rec."DateFormula")
                {
                    ToolTip = 'Specifies the value of the DateFormula field.', Comment = '%';
                    Visible = false;
                }
                field("Graduation Category"; Rec."Graduation Category")
                {
                    ToolTip = 'Specifies the value of the Graduation Category field.', Comment = '%';
                }
                field("Graduation Status"; Rec."Graduation Status")
                {
                    ToolTip = 'Specifies the value of the Graduation Status field.', Comment = '%';
                }
                field("Is Graduated"; Rec."Is Graduated")
                {
                    ToolTip = 'Specifies the value of the Is Graduated field.', Comment = '%';
                }
                field(MatricNo; Rec.MatricNo)
                {
                    ToolTip = 'Specifies the value of the MatricNo field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                    // MaskType = Concealed;
                    // come back here to write another code
                    ExtendedDatatype = Masked;
                }

                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
                field("Time of Lecture"; Rec."Time of Lecture")
                {
                    ToolTip = 'Specifies the value of the Time of Lecture field.', Comment = '%';
                }
                field(blobField; Rec.blobField)
                {
                    ToolTip = 'Specifies the value of the blobField field.', Comment = '%';
                }
            }
        }
    }
}