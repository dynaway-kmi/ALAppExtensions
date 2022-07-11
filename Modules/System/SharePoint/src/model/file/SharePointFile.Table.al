// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

/// <summary>
/// Holds information about file entity.
/// </summary>
table 9100 "SharePoint File"
{
    Access = Public;
    DataClassification = SystemMetadata;
    Caption = 'SharePoint File';
    TableType = Temporary;
    Extensible = false;

    fields
    {
        field(1; "Unique Id"; Guid)
        {
            DataClassification = SystemMetadata;
            Caption = 'Unique Id';
        }

        field(2; Name; Text[250])
        {
            DataClassification = SystemMetadata;
            Caption = 'Title';
        }

        field(3; Created; DateTime)
        {
            DataClassification = SystemMetadata;
            Caption = 'Created';
        }

        field(4; Length; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Length';
        }

        field(5; Exists; Boolean)
        {
            DataClassification = SystemMetadata;
            Caption = 'Exists';
        }

        field(6; "Server Relative Url"; Text[2024])
        {
            DataClassification = SystemMetadata;
            Caption = 'Server Relative Url';
        }

        field(7; Title; Text[250])
        {
            DataClassification = SystemMetadata;
            Caption = 'Title';
        }

        field(101; OdataId; Text[2048])
        {
            DataClassification = SystemMetadata;
            Caption = 'Odata.Id';
        }

        field(102; OdataType; Text[2048])
        {
            DataClassification = SystemMetadata;
            Caption = 'Odata.Type';
        }

        field(103; OdataEditLink; Text[2048])
        {
            DataClassification = SystemMetadata;
            Caption = 'Odata.EditLink';
        }
    }

    keys
    {
        key(PK; "Unique Id")
        {
            Clustered = true;
        }
    }

}