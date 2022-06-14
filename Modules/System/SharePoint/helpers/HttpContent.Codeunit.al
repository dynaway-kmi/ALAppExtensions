codeunit 9107 "SP Http Content"
{
    Access = Internal;

    var
        HttpContent: HttpContent;
        ContentLength: Integer;
        ContentType: Text;
        RequestDigest: Text;

    procedure FromFileInStream(var FileInStream: Instream)
    begin
        HttpContent.WriteFrom(FileInStream);
        ContentLength := GetContentLength(FileInStream);
    end;

    procedure FromJson(Object: JsonObject)
    var
        RequestText: Text;
    begin
        Object.WriteTo(RequestText);
        HttpContent.WriteFrom(RequestText);

        ContentLength := StrLen(RequestText);
        ContentType := 'application/json;odata=verbose';
    end;

    procedure GetContent(): HttpContent
    begin
        exit(HttpContent);
    end;

    procedure GetContentLength(): Integer
    begin
        exit(ContentLength);
    end;

    procedure GetContentType(): Text
    begin
        exit(ContentType);
    end;


    procedure SetRequestDigest(RequestDigestValue: Text)
    begin
        RequestDigest := RequestDigestValue;
    end;

    procedure GetRequestDigest(): Text;
    begin
        exit(RequestDigest);
    end;

    local procedure GetContentLength(var SourceInStream: InStream) Length: Integer
    var
        MemoryStream: DotNet MemoryStream;
    begin
        MemoryStream := MemoryStream.MemoryStream();
        CopyStream(MemoryStream, SourceInStream);
        Length := MemoryStream.Length;
        Clear(SourceInStream);
    end;

}