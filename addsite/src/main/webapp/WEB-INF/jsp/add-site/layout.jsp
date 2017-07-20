
<div class="modal fade" id="layoutModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Select Layout</h4>
			</div>
			<div class="modal-body">
				<div class="alert alert-success" id="layoutUpdateSuccess" style="display: none">
					<strong>Success!</strong>
					Page has been created. Do some stuff with it.
				</div>
				<p>Select layout for the page in your website.</p>
				<form name="selectLayout" id="selectLayout" action="${selectLayout}" method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="layout_groupsList">Site Name:</label>
						<div class="col-sm-4">
							<select id="layout_groupsList" name="layout_groupsList">
								<option value="">Please select the site</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="layout_pagesList">Pages</label>
						<div class="col-sm-4">
							<select id="layout_pagesList" name="layout_pagesList">
								<option value="">Please select the page</option>
							</select>
						</div>
					</div>

					<div id="layouts"></div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" id="selectLayoutSubmit" class="btn btn-default">Submit</button>
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