<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Logout Confirmation Modal (autonome, sans dépendance Bootstrap) -->
<div id="logoutModal" class="logout-modal-overlay">
	<div class="logout-modal">
		<div class="logout-modal-header">
			<h4 class="logout-modal-title">Déconnexion</h4>
			<button type="button" class="logout-modal-close" onclick="closeLogoutModal()" aria-label="Close">&times;</button>
		</div>
		<div class="logout-modal-body">
			<p>Êtes-vous sûr de vouloir vous déconnecter ?</p>
		</div>
		<div class="logout-modal-footer">
			<button type="button" class="lm-btn lm-btn-cancel" onclick="closeLogoutModal()">Annuler</button>
			<a href="Logout" class="lm-btn lm-btn-confirm">Se déconnecter</a>
		</div>
	</div>
</div>

<style>
	.logout-modal-overlay {
		display: none;
		position: fixed;
		inset: 0;
		background: rgba(0, 0, 0, 0.5);
		z-index: 1060;
		align-items: center;
		justify-content: center;
	}
	.logout-modal-overlay.show { display: flex; }
	.logout-modal {
		background: #fff;
		border-radius: 8px;
		width: 90%;
		max-width: 420px;
		box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
		overflow: hidden;
		animation: logoutModalFade 0.15s ease;
	}
	@keyframes logoutModalFade {
		from { opacity: 0; transform: translateY(-12px); }
		to   { opacity: 1; transform: translateY(0); }
	}
	.logout-modal-header {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 16px 20px;
		border-bottom: 1px solid #e9ecef;
	}
	.logout-modal-title { margin: 0; font-size: 1.2rem; color: #333; }
	.logout-modal-close {
		background: none;
		border: none;
		font-size: 1.6rem;
		line-height: 1;
		cursor: pointer;
		color: #888;
	}
	.logout-modal-close:hover { color: #333; }
	.logout-modal-body { padding: 20px; color: #444; }
	.logout-modal-body p { margin: 0; }
	.logout-modal-footer {
		display: flex;
		justify-content: flex-end;
		gap: 10px;
		padding: 16px 20px;
		border-top: 1px solid #e9ecef;
	}
	.lm-btn {
		padding: 8px 18px;
		border-radius: 6px;
		border: none;
		cursor: pointer;
		font-weight: 600;
		text-decoration: none;
		display: inline-block;
	}
	.lm-btn-cancel { background: #6c757d; color: #fff; }
	.lm-btn-cancel:hover { background: #5c636a; color: #fff; }
	.lm-btn-confirm { background: #dc3545; color: #fff; }
	.lm-btn-confirm:hover { background: #bb2d3b; color: #fff; }
</style>

<script>
	function openLogoutModal(event) {
		if (event) event.preventDefault();
		document.getElementById('logoutModal').classList.add('show');
	}
	function closeLogoutModal() {
		document.getElementById('logoutModal').classList.remove('show');
	}
	// Fermer en cliquant en dehors de la fenêtre
	document.addEventListener('click', function (ev) {
		var overlay = document.getElementById('logoutModal');
		if (ev.target === overlay) closeLogoutModal();
	});
	// Fermer avec la touche Échap
	document.addEventListener('keydown', function (ev) {
		if (ev.key === 'Escape') closeLogoutModal();
	});
</script>
