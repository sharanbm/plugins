
<div class="modal fade" id="pagesModal" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add Pages</h4>
			</div>
			<div class="modal-body">
				<p>Select the site, add the page</p>

				<div class="alert alert-success" id="pageSuccess" style="display: none">
					<strong>Success!</strong>
					Page has been created. Do some stuff with it.
				</div>

				<form name="createPage" id="createPage" action="${createPage}" method="post" class="">
					<div class="form-group">
						<label class="control-label col-sm-2" for="groupsList">Site Name:</label>
						<div class="col-sm-4">
							<select id="groupsList" name="groupsList">
								<option value="">Please select the site</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pagesList">Pages</label>
						<div class="col-sm-4">
							<select id="pagesList" name="pagesList">
								<option value="">Please select the page</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-sm-2" for="pageName">Name:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="pageName" placeholder="Enter Name of the page" name="pageName">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="pageURL">Friendly URL:</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="pageURL" placeholder="Enter Friendly URL" name="pageURL">
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" id="createPagesSubmit" class="btn btn-default">Submit</button>
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