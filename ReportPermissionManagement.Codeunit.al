codeunit 50302 "Report Permission Management"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, OnAfterGetPrinterName, '', false, false)]
    local procedure OnAfterGetPrinterName_ReportManagement(ReportID: Integer; var PrinterName: Text[250]; PrinterSelection: Record "Printer Selection")
    var
        WinExcludeReportPermission: Record "WIN Exclude Report Permission";
    begin
        //WIN316_030823++
        If WinExcludeReportPermission.get(UserId, ReportID) then
            Error('You do not have permission to execute report %1', WinExcludeReportPermission."Report Name");
        //WIN316_030823-
    end;
}