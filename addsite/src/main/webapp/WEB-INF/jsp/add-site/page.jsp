<div class="modal fade" id="pagesModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title">Add Pages</h2>
            </div>
            <div class="modal-body">
                <h3>Select the site, add the page</h3>

                <div class="alert alert-success" id="pageSuccess" style="display: none">
                    <strong>Success!</strong>
                    Page has been created. Do some stuff with it.
                </div>

                <form name="createPage" id="createPage" action="${createPage}" method="post" class="form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="groupsList">Site Name:</label>
                            <div class="col-lg-10">
                                <select id="groupsList" name="groupsList" class="form-control">
                                    <option value="">Please select the site</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="pagesList">Pages</label>
                            <div class="col-lg-10">
                                <select id="pagesList" name="pagesList" class="form-control">
                                    <option value="">Please select the page</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="pageName">Name:</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="pageName"
                                       placeholder="Enter Name of the page" name="pageName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="pageURL">Friendly URL:</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="pageURL" placeholder="Enter Friendly URL"
                                       name="pageURL">
                            </div>
                        </div>


                            <div class="pull-right btn-toolbar top-buffer">
                                <button type="button" id="createPagesSubmit" class="btn btn-success">Submit</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>