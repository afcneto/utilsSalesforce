public with sharing class LazyLoadingController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(Integer limitSize, Integer offset){
        List<Account> accountList = [SELECT Id,Name,Rating
                                     FROM Account
                                     ORDER BY CreatedDate
                                     LIMIT :limitSize
                                     OFFSET :offset
                                     ];
        return accountList;
    }
}