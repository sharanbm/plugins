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
                <form name="selectLayout" id="selectLayout" action="${selectLayout}" method="post"
                      class="form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="layout_groupsList">Site Name:</label>
                            <div class="col-lg-10">
                                <select id="layout_groupsList" name="layout_groupsList" class="form-control">
                                    <option value="">Please select the site</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-2" for="layout_pagesList">Pages</label>
                            <div class="col-lg-10">
                                <select id="layout_pagesList" name="layout_pagesList" class="form-control">
                                    <option value="">Please select the page</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">Layouts</label>
                            <div class="col-lg-10">
                                <div id="layouts"></div>
                            </div>
                        </div>
                        <div class="pull-right btn-toolbar top-buffer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            <button type="button" id="selectLayoutSubmit" class="btn btn-success">Submit</button>
                        </div>
                        <div style="clear:both"></div>
                    </fieldset>
                </form>
            </div>
        </div>

    </div>
</div>