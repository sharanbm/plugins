<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
<portlet:actionURL var="createSite"></portlet:actionURL>
<div class="modal fade" id="websiteModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Site</h4>
			</div>
			<div class="modal-body">
				<p>Some text in the modal.</p>

				<form name="createSite" id="createSite" action="${createSite}" method="post">

                    <div id="site-templates">
                    </div>



					<div class="form-group">
						<label class="control-label col-sm-2" for="siteName">Site Name:</label>
						<div class="col-sm-4">
							<input class="form-control input-lg" id="siteName" name="siteName" type="text">
						</div>
					</div>

					<div class="form-group">
                        <label class="control-label col-sm-2" for="description">Description:</label>
                        <div class="col-sm-4">
                        <textarea class="form-control" rows="5" id="description" name="description"></textarea>

                        </div>
                    </div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" id="createSiteSubmit" class="btn btn-default" value="Submit" />
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>

	</div>
</div>
<script>
 $("document").ready(function() {
		    $.each(${siteTemplates}, function(key, value) {

		    console.log(value);
			    $("#site-templates").append("<div class='radio'><label><input type='radio' name='siteTemplate' value="+
			    value._layoutSetPrototypeId+">" + value._name + "</label></div>");
		    });
    });
</script>