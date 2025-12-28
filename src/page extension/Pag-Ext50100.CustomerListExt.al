// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace DefaultPublisher.MyFirstProject;

using Microsoft.Sales.Customer;

pageextension 80100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('Abu Bakar is learning BC Development');
    end;
}