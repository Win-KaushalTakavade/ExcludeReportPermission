page 50301 "WIN Exclude Report Permission"
{
    Caption = 'Exclude Report Permission';
    PageType = List;
    SourceTable = "WIN Exclude Report Permission";
    UsageCategory = None;
    Description = 'WIN316_030823';
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Report ID"; Rec."Report ID")
                {
                    ApplicationArea = all;
                    ShowMandatory = True;
                    ToolTip = 'Specifies the value of the Report ID field.';
                }
                field("Report Name"; Rec."Report Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Report Name field.';
                }
            }
        }
    }
}
