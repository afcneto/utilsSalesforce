/**
 * Lista todos os usuários que possuem uma custom permission específica
 */
private static Map<Id,User> getUsersWithCustomPermission(String nameCustomPermission) {
    Set<Id> permissionSetIds = new Set<Id>();
    for (SetupEntityAccess access : [
        SELECT ParentId 
        FROM SetupEntityAccess 
        WHERE SetupEntityId IN (
            SELECT Id 
            FROM CustomPermission 
            WHERE DeveloperName = :nameCustomPermission
        )
    ]) {
        permissionSetIds.add(access.ParentId);
    }
    return permissionSetIds.isEmpty() ? new Map<Id,User>() : new Map<Id,User>([
        SELECT Username FROM User WHERE Id IN (
            SELECT AssigneeId FROM PermissionSetAssignment
            WHERE PermissionSetId IN :permissionSetIds
        )
    ]);
}