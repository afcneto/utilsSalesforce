/**
 * Exemplos para uso de SOQL dinâmico
 */

//SOQL dinâmico que inclui todos os campos do objeto Account
Map<String, Schema.SObjectField> fields = Schema.SObjectType.Account.fields.getMap();
for (String fieldName : fields.keySet()) {
    query += (query == '') ? 'SELECT ' + fieldName : ', ' + fieldName;
}
query += ' FROM Account';
Account conta = Database.query(query);                     