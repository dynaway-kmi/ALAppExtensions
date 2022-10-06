pageextension 31063 "Vendor List CZZ" extends "Vendor List"
{
    actions
    {
        modify("Prepa&yment Percentages")
        {
            Visible = false;
        }
        addlast(creation)
        {
            action(NewPurchAdvanceLetterCZZ)
            {
                Caption = 'Advance Letter';
                ToolTip = 'Create purchase advance letter.';
                ApplicationArea = Basic, Suite;
                Image = NewDocument;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    AdvanceLetterTemplateCZZ: Record "Advance Letter Template CZZ";
                    PurchAdvLetterHeaderCZZ: Record "Purch. Adv. Letter Header CZZ";
                begin
                    AdvanceLetterTemplateCZZ.SetRange("Sales/Purchase", AdvanceLetterTemplateCZZ."Sales/Purchase"::Purchase);
                    if Page.RunModal(0, AdvanceLetterTemplateCZZ) <> Action::LookupOK then
                        Error('');

                    AdvanceLetterTemplateCZZ.TestField("Advance Letter Document Nos.");
                    PurchAdvLetterHeaderCZZ.Init();
                    PurchAdvLetterHeaderCZZ."Advance Letter Code" := AdvanceLetterTemplateCZZ.Code;
                    PurchAdvLetterHeaderCZZ."No. Series" := AdvanceLetterTemplateCZZ."Advance Letter Document Nos.";
                    PurchAdvLetterHeaderCZZ.Insert(true);
                    PurchAdvLetterHeaderCZZ.Validate("Pay-to Vendor No.", Rec."No.");
                    PurchAdvLetterHeaderCZZ.Modify(true);

                    Page.Run(Page::"Purch. Advance Letter CZZ", PurchAdvLetterHeaderCZZ);
                end;
            }
        }
    }
}
