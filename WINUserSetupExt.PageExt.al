pageextension 50302 "WIN User Setup Ext" extends "User Setup"
{
    actions
    {
        addfirst(Processing)
        {
            action("WIN Exclude Report Permission List")
            {
                ApplicationArea = All;
                RunObject = page "WIN Exclude Report Permission";
                RunPageLink = "User ID" = field("User ID");
                Image = Process;
                ToolTip = 'Executes the Exclude Report Permission List action.';
            }

        }
        addfirst(Promoted)
        {
            actionref("WIN Report Permission Exclude List_Promoted"; "WIN Exclude Report Permission List")
            {
            }
        }

    }
}