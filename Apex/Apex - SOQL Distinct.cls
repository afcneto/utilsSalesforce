/**
 * Para acessar os nomes exclusivos
 */
AggregateResult[] results = [SELECT count(Id), Name FROM Participant__c GROUP BY Name];
List<String> uniqueNames = new List<String>();
for (AggregateResult result : results) {
    uniqueNames.add((String)result.get('Name'));
}
system.debug(uniqueNames);

/**
 * Usando Set
 */
Set<String> uniqueNames = new Set<String>();
for (Participant__c p : [SELECT Name FROM Participant__c]) {
    uniqueNames.add(p.Name);
}