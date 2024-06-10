pageextension 50304 "User Setup Ext WIN" extends "User Setup"
{
    actions
    {
        addfirst(Processing)
        {
            action("Exclude Report Permission List WIN")
            {
                ApplicationArea = All;
                RunObject = page "Exclude Report Permission WIN";
                RunPageLink = "User ID" = field("User ID");
                Image = Process;
                ToolTip = 'Executes the Exclude Report Permission List action.';
                Caption = 'Exclude Report Permission List';
            }

        }
        addfirst(Promoted)
        {
            actionref("WIN Report Permission Exclude List_Promoted"; "Exclude Report Permission List WIN")
            {
            }
        }

    }
}