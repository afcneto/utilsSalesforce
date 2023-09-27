/**
 * Criação de doc para depurar valores grandes no APEX
 */

List<Document> docs = [SELECT FolderId, Name, Body, ContentType, Type FROM Document WHERE Name = 'XML'];

Document doc = docs != null ? docs[0] : new Document(
    FolderId = UserInfo.getUserId(), // "My Personal Documents" folder
    Name = 'XML',
    Body = Blob.valueOf(''),
    ContentType = 'text/plain',
    Type = 'txt'
);

doc.Body = Blob.valueOf(doc.Body.toString());

upsert doc;