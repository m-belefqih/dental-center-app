<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Add Modal HTML -->
<div id="ajouterPatientModal" class="modal fade">
	<div class="modal-dialog custom-width">
		<div class="modal-content">
			<form action="/dental-center-app/ListePatients/create" method="POST">
				
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">
						<b>Ajouter Patient</b>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6">
								<div class="mb-3">
									<label for="InputPrenom" class="form-label">Prénom *</label> 
									<input type="text" name="prenom" class="form-control custom-border-color" id="InputPrenom" required>
								</div>
								<div class="mb-3">
									<label for="InputNom" class="form-label">Nom *</label> 
									<input type="text" name="nom" class="form-control custom-border-color" id="InputNom" required>
								</div>
								<div class="mb-3">
									<label for="InputSexe" class="form-label">Sexe *</label> 
									<select class="form-select custom-border-color" name="sexe" id="InputSexe" required>
										<option value="">Sélectionnez votre sexe</option>
									  	<option value="Homme">Homme</option>
									  	<option value="Femme">Femme</option>
									</select>
								</div>
								<div class="mb-3">
									<label for="InputDateNaissance" class="form-label">Date de naissance *</label> 
									<input type="text" name="birthDate" class="form-control custom-border-color" id="InputDateNaissance" required>
								</div>
								<div class="mb-3">
									<label for="InputAdresse" class="col-form-label">Adresse *</label>
									<textarea name="adresse" class="form-control custom-border-color" id="InputAdresse" required></textarea>
								</div>
							</div>

							<div class="col-md-6">
								<div class="mb-3">
									<label for="InputCIN" class="form-label">CIN *</label> 
									<input type="text" name="cin" class="form-control custom-border-color" id="InputCIN" required>
								</div>
								<div class="mb-3">
									<label for="InputTelephone" class="form-label">Téléphone *</label> 
									<input type="text" name="telephone" class="form-control custom-border-color" id="InputTelephone" required>
								</div>
								<div class="mb-3">
									<label for="InputEmail" class="form-label">E-mail *</label> 
									<input type="email" name="email" class="form-control custom-border-color" id="InputEmail" required>
								</div>
								<div class="mb-3">
									<label for="InputPassword" class="form-label">Mot de passe *</label> 
									<input type="text" name="password" class="form-control custom-border-color" id="InputPassword" aria-describedby="passwordHelp" required>
									<div id="passwordHelp" class="form-text">Veuillez entrer au moins 8 caractères.</div>
								</div>
								<div class="mb-3">
									<label for="InputConfirmPassword" class="form-label">Confirmation mot de passe *</label> 
									<input type="text" class="form-control custom-border-color" id="InputConfirmPassword" required>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Modal Footer -->
				<div class="modal-footer">
					<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="Annuler"> 
					<input type="submit" class="btn btn-primary" value="Ajouter">
				</div>
			</form>
		</div>
	</div>
</div>
