<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<portlet:defineObjects/>
<portlet:actionURL var="createSite"></portlet:actionURL>
<div class="modal fade" id="websiteModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h2 class="modal-title">Add Site</h2>
            </div>
            <div class="modal-body">
                <h3>What kind of website you want to build? </h3>

                <form name="createSite" id="createSite" action="${createSite}" method="post" class="form-horizontal">
                    <fieldset>
                        <div class="form-group">
                            <div class="col-lg-10">
                                <div id="site-templates">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="siteName">Site Name:</label>
                            <div class="col-lg-10">
                                <input class="form-control input-lg" id="siteName" name="siteName" type="text">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-2 control-label" for="description">Description:</label>
                            <div class="col-lg-10">
                                <textarea class="form-control" rows="3" id="description" name="description"></textarea>
                            </div>
                        </div>


                        <div class="pull-right btn-toolbar top-buffer">
                            <input type="submit" id="createSiteSubmit" class="btn btn-success" value="Submit"/>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>

                    </fieldset>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>

    </div>
</div>
<script>
    $("document").ready(function () {
        $.each(${siteTemplates}, function (key, value) {

            console.log(value);
            $("#site-templates").append("<div class='radio'><label><input type='radio' name='siteTemplate' value=" +
                value._layoutSetPrototypeId + ">" + value._name + "</label></div>");
        });
    });
</script>