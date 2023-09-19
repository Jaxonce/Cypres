# Cypres - Use cases

### Liste des use cases : 

_(N.B. toutes les fonctionnalités pour "un contact" seront possible à l'avenir pour "un groupe de contacts")_

- [x] Créer un compte
- [x] Se connecter 
- [x] Ajouter un contact
- [ ] Consulter les informations d'un contact
- [ ] Éditer/supprimer un contact
- [ ] Envoyer un message à un contact
- [ ] Apeller un contact
- [ ] Partager un évenement à un contact
- [ ] Ajouter une image dans la galerie partager avec un contact
- [ ] Consulter les images de la galerie partager avec un contact
- [ ] Ajouter un film dans la filmothèque partager avec un contact
- [ ] Consulter les films de la filmothèque partager avec un contact
- [ ] Partager sa localisation avec un contact
- [ ] Consulter la localisation d'un contact
- [ ] Ajouter une musique dans la playlist partager avec un contact

#### Gestion de compte

| Cas | Créer un compte |
|---|---|
| Objectif | Créer un compte utilisateur, pour pouvoir s'identifier sur l'application |
| Acteurs principaux | Utilisateurs sans compte |
| Acteurs secondaires | n/a |
| Conditions initiales | L'utilisateur ne possède pas de compte |
| Scénario d'utilisation | 1. L'utilisateur clique sur "Sign up" <br> 2. Lancement du formulaire d'inscription <br> 3. L'utilisateur renseigne ses informations <br> 4. Le système créer un compte <br> 5. L'utilisateur est redirigé vers la page de connexion |
| Condition de fin réussie | L'utilisateur à réussi à créer un compte |
| Condition de fin échouée | L'utilisateur n'a pas réussi a créer un compte |

| Cas | Se connecter |
|---|---|
| Objectif | Connecter l'utilisateur à son compte personnel |
| Acteurs principaux | Utilisateur avec compte |
| Acteurs secondaires | n/a |
| Conditions initiales | L'utilisateur possède un compte |
| Scénario d'utilisation | 1. L'utilisateur clique sur "Sign in" <br> 2. Lancement du formulaire d'authentification <br> 3. L'utilisateur renseigne ses informations <br> 4. Le système valide les informations <br> 5. L'utilisateur est  connecté|
| Condition de fin réussie | L'utilisateur à réussi à se connecter |
| Condition de fin échouée | L'utilisateur n'a pas réussi à se connecter |

#### Gestion des contacts

| Cas | Ajouter un contact |
|---|---|
| Objectif | Lier deux compte entre eux, pour qu'ils deviennent contact |
| Acteurs principaux | Utilisateur connecté avec son compte |
| Acteurs secondaires | Deuxième utilisateur connecté avec son compte |
| Conditions initiales | Les deux utilisateurs sont connectés et ne sont pas déja contact |
| Scénario d'utilisation | 1. L'utilisateur1 clique sur "Ajouter un contact" <br> 2. Lancement du formulaire d'ajout de contact <br> 3. L'utilisateur1 renseigne les informations de l'utilisateur2 <br> 4. Le système valide les informations <br> 5. L'utilisateur2 recoit une demande de contact<br> 6. L'utilisateur2 accepte la demande <br> 7. Le lien "contact" est créé entre les deux utilisateurs|
| Condition de fin réussie | Les utilisateur ont réussi à s'ajouter en contact |
| Condition de fin échouée | L'utilisateur n'ont pas réussi à s'ajouter en contact |

#### Fonctionnalités de l'application
