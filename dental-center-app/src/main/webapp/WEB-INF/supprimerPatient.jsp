<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Delete Modal HTML -->
<div id="supprimerPatientModal" class="modal fade">
	<div class="modal-dialog">
        <div class="modal-content">
            <form>
            
                <!-- Modal Header -->
                <div class="modal-header">
                        <h4 class="modal-title">Supprimer Patient</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <p>Êtes-vous sûr de vouloir supprimer ces enregistrements ?</p>
                    <p class="text-danger">
                        <small>Cette action ne peut pas être annulée.</small>
                    </p>
               	</div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="Annuler"> 
                    <input type="submit" id="deleteBtn" class="btn btn-danger" value="Supprimer">
                </div>
            </form>
        </div>
    </div>
</div>