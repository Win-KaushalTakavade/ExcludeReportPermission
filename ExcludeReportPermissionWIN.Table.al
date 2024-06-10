table 50301 "Exclude Report Permission WIN"
{
    Caption = 'Exclude Report Permission';
    DataClassification = CustomerContent;
    LookupPageId = "Exclude Report Permission WIN";
    Description = 'WIN316_030823';

    fields
    {
        field(10; "User ID"; Code[50])
        {
            Caption = 'User ID';
            NotBlank = true;
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            Editable = False;
        }
        field(20; "Report ID"; Integer)
        {
            Caption = 'Report ID';
            DataClassification = CustomerContent;
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = const(Report));
            BlankZero = true;
            NotBlank = True;
            trigger OnLookup()
            var
                NewObjectID: Integer;
            begin
                if LookupObjectID(NewObjectID) then
                    Validate("Report ID", NewObjectID);
            end;

            trigger OnValidate()
            var
                AllObjWithCaption: Record AllObjWithCaption;
                ObjNotFoundErr: Label 'There is no Object with ID %1.', Comment = '%1=Object Id.';
            begin
                if "Report ID" = 0 then begin
                    "Report Name" := '';
                    exit;
                end;
                if not AllObjWithCaption.Get(AllObjWithCaption."Object Type"::Report, "Report ID") then
                    Error(ObjNotFoundErr, "Report ID");

                if "Report Name" = '' then
                    "Report Name" := AllObjWithCaption."Object Caption";

            end;
        }
        field(30; "Report Name"; Text[249])
        {
            DataClassification = CustomerContent;
            Editable = False;
        }

    }
    keys
    {
        key(PK; "User ID", "Report ID")
        {
            Clustered = true;
        }
    }

    procedure LookupObjectID(var NewObjectID: Integer): Boolean
    var
        AllObjWithCaption: Record AllObjWithCaption;
        Objects: Page Objects;
    begin
        "Report Name" := '';
        if AllObjWithCaption.Get(AllObjWithCaption."Object Type"::Report, "Report ID") then;
        AllObjWithCaption.FilterGroup(2);
        AllObjWithCaption.SetRange("Object Type", AllObjWithCaption."Object Type"::Report);
        AllObjWithCaption.FilterGroup(0);
        Objects.SetRecord(AllObjWithCaption);
        Objects.SetTableView(AllObjWithCaption);
        Objects.LookupMode := true;
        if Objects.RunModal() = ACTION::LookupOK then begin
            Objects.GetRecord(AllObjWithCaption);
            NewObjectID := AllObjWithCaption."Object ID";
            "Report Name" := AllObjWithCaption."Object Caption";
            exit(true);
        end;
        exit(false);
    end;
}
