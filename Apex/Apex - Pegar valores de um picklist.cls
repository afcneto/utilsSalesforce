/**
 * Retorna as opções ativas de um picklist 
 */
public List<String> getPickListValuesIntoList(){

    List<String> pickListValuesList= new List<String>();
    Schema.DescribeFieldResult fieldResult = ObjectApiName.FieldApiName.getDescribe();
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

    for( Schema.PicklistEntry pickListVal : ple){
        pickListValuesList.add(pickListVal.getLabel());
    }     

    return pickListValuesList;

}