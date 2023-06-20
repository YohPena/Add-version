% Exécute la commande git log -1 pour obtenir les informations du dernier commit
[status, result] = system('git log -1');

% Vérifie que la commande s'est exécutée avec succès
if status == 0
    commit_info = strtrim(result);  % Récupère les informations du commit
    
    % Exécute la commande git show --name-status pour obtenir les modifications apportées
    [status, result] = system('git show --name-status');
    
    % Vérifie que la commande s'est exécutée avec succès
    if status == 0
        file_changes = strtrim(result);  % Récupère les modifications apportées
        
        % Exécute la commande git diff --stat pour obtenir les statistiques des modifications
        [status, result] = system('git diff --stat');
        
        % Vérifie que la commande s'est exécutée avec succès
        if status == 0
            diff_stat = strtrim(result);  % Récupère les statistiques des modifications
            
            % Enregistre les informations dans un fichier texte
            fileID = fopen('commit_info.txt', 'w');
            fprintf(fileID, 'Informations du dernier commit:\n%s\n\n', commit_info);
            fprintf(fileID, 'Modifications apportées:\n%s\n\n', file_changes);
            fprintf(fileID, 'Statistiques des modifications:\n%s\n', diff_stat);
            fclose(fileID);
            
            disp('Les informations du dernier commit ont été enregistrées dans commit_info.txt.');
        else
            disp('Erreur lors de l''exécution de la commande git diff --stat.');
        end
    else
        disp('Erreur lors de l''exécution de la commande git show --name-status.');
    end
else
    disp('Erreur lors de l''exécution de la commande git log -1.');
end
