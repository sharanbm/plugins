<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://use.fontawesome.com/1b5ff897c7.js"></script>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />

<portlet:actionURL var="createPage">
	<portlet:param name="action" value="page" />
</portlet:actionURL>
<portlet:actionURL var="updatePage">
	<portlet:param name="action" value="updatePage" />
</portlet:actionURL>
<portlet:resourceURL id="getGroupList" var="getGroupList"></portlet:resourceURL>
<portlet:resourceURL id="getPagesList" var="getPagesList"></portlet:resourceURL>
<portlet:resourceURL id="getLayoutList" var="getLayoutList"></portlet:resourceURL>
<c:if test="${not empty newSite}">
	<div class="alert alert-success">
		<strong>Success!</strong>
		Your WebSite ${newSite.name} has been created. Do some stuff with it.
	</div>
</c:if>
<div class="container">
	<input type="checkbox" id="menu_opener_id" class="menu_opener">
	<label for="menu_opener_id" class="menu_opener_label"></label>
	<div class="barre_hamburger"></div>

	<a href="#" class="link_blog link_general" data-toggle="modal" data-target="#blogModal">
		<span class="actionTitle">Blog</span>
	</a>

	<a href="#" class="link_website link_general" data-toggle="modal" data-target="#websiteModal">
		<span class="actionTitle">Website</span>
	</a>

	<a href="#" id="link_pages" class="link_pages link_general" data-toggle="modal" data-target="#pagesModal">
		<span class="actionTitle">Pages</span>
	</a>

	<a href="#" id="link_layout" class="link_layout link_general" data-toggle="modal" data-target="#layoutModal">
		<span class="actionTitle">Layout</span>
	</a>


	<a href="#" class="link_settings link_general" data-toggle="modal" data-target="#settingsModal">
		<span class="actionTitle">Settings</span>
	</a>

	<a href="#" class="link_content link_general" data-toggle="modal" data-target="#contentModal">
		<span class="actionTitle">Content</span>
	</a>

	<a href="#" class="link_media link_general" data-toggle="modal" data-target="#mediaModal">
		<span class="actionTitle">Media</span>
	</a>


	<a href="#" class="link_users link_general" data-toggle="modal" data-target="#usersModal">
		<span class="actionTitle">Users</span>
	</a>
	</input>


	<!-- Modal -->


	<jsp:include page="blog.jsp"></jsp:include>
	<jsp:include page="users.jsp"></jsp:include>
	<jsp:include page="settings.jsp"></jsp:include>
	<jsp:include page="page.jsp"></jsp:include>
	<jsp:include page="website.jsp"></jsp:include>
	<jsp:include page="layout.jsp"></jsp:include>
</div>


<script>
	$("#selectLayoutSubmit").click(function() {
	    $.ajax({type : "POST", url : '${updatePage}', data : $('#selectLayout').serialize(), success : function(data) {
		    $("#layoutUpdateSuccess").css("display", "block");
	    }});
    });
</script>
<script>
	$("#createPagesSubmit").click(function() {
	    $.ajax({type : "POST", url : '${createPage}', data : $('#createPage').serialize(), success : function(data) {
		    $("#pageSuccess").css("display", "block");
	    }});
    });
</script>
<script>
	$("#link_pages").click(function() {
	    $.getJSON("${getGroupList}", function(obj) {
		    $.each(obj, function(key, value) {

			    $("#groupsList").append("<option value=" + value.groupId + ">" + value.name + "</option>");
		    });
	    });
    });

    $("#link_layout").click(function() {
	    $.getJSON("${getGroupList}", function(obj) {
		    $.each(obj, function(key, value) {

			    $("#layout_groupsList").append("<option value=" + value.groupId + ">" + value.name + "</option>");
		    });
	    });
    });
</script>
<script>
	$("#link_layout").click(function() {
	    $.getJSON("${getLayoutList}", function(obj) {
		    var str = "";
		    $.each(obj, function(key, value) {
			    $("#layouts").append(str.concat("<div class=\"radio\"><label><input type=\"radio\" name=").concat("selectedTemplate").concat(" id=")
			            .concat(value._layoutTemplateId).concat(" value=" + value._layoutTemplateId).concat(">").concat(value._layoutTemplateId).concat("</label>")
			            .concat("<img src="+value._thumbnailPath+" width=25 height=25 />").concat("<br />"));
		    });
	    });
    });
</script>

<script>
	$("#groupsList").change(function() {
	    var selectedSite = this.value;
	    $.getJSON("${getPagesList}&selectedSite=" + selectedSite, function(obj) {
		    $.each(obj, function(key, value) {
			    $("#pagesList").append("<option value=" + value.layoutId + " data-target=" + value.friendlyURL + ">" + value.name + "</option>");
		    });
	    });
    });

    $("#layout_groupsList").change(function() {
	    var selectedSite = this.value;
	    $.getJSON("${getPagesList}&selectedSite=" + selectedSite, function(obj) {
		    $.each(obj, function(key, value) {
			    $("#layout_pagesList").append("<option value=" + value.layoutId + " data-target=" + value.friendlyURL + ">" + value.name + "</option>");
		    });
	    });
    });
</script>

<script>
	$("#pagesList").change(function() {
	    thisdata = $(this).attr('data-target');
    });
</script>