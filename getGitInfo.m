% Exécute la commande git log -1 pour obtenir les informations du dernier commit
[status, result] = system('git log -1');

% Vérifie que la commande s'est exécutée avec succès
if status == 0
    commit_info = strtrim(result);  % Récupère les informations du commit
            
            % Enregistre les informations dans un fichier texte
            fileID = fopen('commit_info.txt', 'w');
            fprintf(fileID, 'Informations du dernier commit:\n%s\n\n', commit_info);
            fclose(fileID);
            
            disp('Les informations du dernier commit ont été enregistrées dans commit_info.txt.');
else
    disp('Erreur lors de l''exécution de la commande git log -1.');
end

%Texte test dans dev et pas main