<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty error}">
	<div class="container">
	  <div class="modal show" id="myModal" role="dialog">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header alert alert-danger" role="alert" style="background-color:#ff9999">
	          <button type="button" class="close" data-dismiss="modal" style="display:none">&times;</button>
	          <h4 class="modal-title" style="font-weight:bold">Error</h4>
	        </div>
	        <div class="modal-body">
	          <p>${error}</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" onclick = "$('.modal').removeClass('show').addClass('fade');">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
</c:if>