/**
 * Exemplos para uso em MAP 
 */ 

Map<String, List<SObject>> myMap = new Map<String, List<SObject>>();

for(SObject item : sObjectList){
    //verifica se a chave não existe no Map
    //se não, adiciona o item ao mapa instanciando uma nova lista como valor
    if(!myMap.containsKey(key)){
        myMap.put(key, new List<SObject>());
    }

    //e por fim, busca o item e adiciona o item à lista valor 
    myMap.get(key).add(item);
}