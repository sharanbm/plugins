/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 * <p>
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 * <p>
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package com.twomins.portlets;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.ReleaseInfo;
import com.liferay.portal.kernel.util.UnicodeProperties;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Group;
import com.liferay.portal.model.GroupConstants;
import com.liferay.portal.model.Layout;
import com.liferay.portal.model.LayoutConstants;
import com.liferay.portal.model.LayoutTemplate;
import com.liferay.portal.service.*;
import com.liferay.portal.theme.ThemeDisplay;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

@Controller
@RequestMapping("VIEW")
public class PortletViewController {

	Log log = LogFactoryUtil.getLog(this.getClass());

	@RenderMapping
	public String question(Model model) {

		model.addAttribute("releaseInfo", ReleaseInfo.getReleaseInfo());

		return "add-site/view";
	}

	@ActionMapping
	public void createSite(ActionRequest actionRequest, Model model) {

		log.info(ParamUtil.getString(actionRequest, "siteName"));
		ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(WebKeys.THEME_DISPLAY);

		String siteName = actionRequest.getParameter("siteName");
		log.info("Site created : " + siteName);

		Group site;
		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(Group.class.getName(), actionRequest);
			serviceContext.setAddGroupPermissions(true);
			serviceContext.setAddGuestPermissions(true);
			site = GroupLocalServiceUtil.addGroup(
				themeDisplay.getUserId(), GroupConstants.DEFAULT_PARENT_GROUP_ID, Group.class.getName(), ClassNameLocalServiceUtil.getClassNameId(Group.class),
				GroupConstants.DEFAULT_LIVE_GROUP_ID, siteName, "description", GroupConstants.TYPE_SITE_OPEN, true,
				GroupConstants.DEFAULT_MEMBERSHIP_RESTRICTION, "", true, true, serviceContext);
			model.addAttribute("newSite", site);
		}
		catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@ActionMapping(params = {
		"action=page"
	})
	public void createPage(ActionRequest actionRequest, Model model) {

		ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(WebKeys.THEME_DISPLAY);
		String groupsList = actionRequest.getParameter("groupsList");
		String pageName = actionRequest.getParameter("pageName");

		Layout layout;
		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(Layout.class.getName(), actionRequest);
			serviceContext.setAddGroupPermissions(true);
			serviceContext.setAddGuestPermissions(true);
			layout = LayoutLocalServiceUtil.addLayout(
				themeDisplay.getUserId(), Long.parseLong(groupsList), false, LayoutConstants.DEFAULT_PARENT_LAYOUT_ID, pageName, pageName, pageName,
				LayoutConstants.TYPE_PORTLET, false, "/" + pageName, serviceContext);
			model.addAttribute("page", layout);
		}
		catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@ActionMapping(params = {
		"action=updatePage"
	})
	public void updatePage(ActionRequest actionRequest, Model model) {

		ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(WebKeys.THEME_DISPLAY);
		String groupId = actionRequest.getParameter("layout_groupsList");
		String pageId = actionRequest.getParameter("layout_pagesList");
		String selectedTemplate = actionRequest.getParameter("selectedTemplate");

		Layout layout;
		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(Layout.class.getName(), actionRequest);
			serviceContext.setAddGroupPermissions(true);
			serviceContext.setAddGuestPermissions(true);
			layout = LayoutLocalServiceUtil.getLayout(Long.parseLong(groupId), false, Long.parseLong(pageId));
			UnicodeProperties unicodeProperties = layout.getTypeSettingsProperties();
			unicodeProperties.setProperty("layout-template-id", selectedTemplate);
			layout.setTypeSettingsProperties(unicodeProperties);
			LayoutLocalServiceUtil.updateLayout(layout);
			log.info(unicodeProperties.toString());
			model.addAttribute("page", layout);
		}
		catch (PortalException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@ResourceMapping(value = "getPagesList")
	public void getPagesForTheSelectedSite(ResourceRequest request, ResourceResponse response) {

		log.info("inside resoruce serving method." + request.getParameter("selectedSite"));
		List<Layout> pages = new ArrayList<Layout>();
		String json = "";
		try {
			long siteId = Long.parseLong(request.getParameter("selectedSite"));
			log.info(siteId);
			pages = LayoutLocalServiceUtil.getLayouts(siteId, false);
			json = JSONFactoryUtil.looseSerialize(pages);
			log.info("just wanted to see the json " + json);
			response.getPortletOutputStream().write(json.getBytes());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
		}
		catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@ResourceMapping(value = "getLayoutList")
	public void getLayoutTemplates(ResourceRequest request, ResourceResponse response) {

		log.info("inside getLayoutTemplates serving method.");
		List<LayoutTemplate> layoutTemplates = new ArrayList<LayoutTemplate>();
		String json = "";
		try {
			layoutTemplates = LayoutTemplateLocalServiceUtil.getLayoutTemplates();
			log.info(layoutTemplates.toString());
			Gson gson = new GsonBuilder().create();
			json = gson.toJson(layoutTemplates).toString();

			log.info("just wanted to see the json " + json);
			response.getPortletOutputStream().write(json.getBytes());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@ResourceMapping(value = "getGroupList")
	public void serveResource(ResourceRequest request, ResourceResponse response) {

		log.info("inside resoruce serving method.");
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		List<Group> groups = new ArrayList<Group>();
		String json = "";
		try {
			groups = GroupLocalServiceUtil.getUserGroups(themeDisplay.getUserId());
			json = JSONFactoryUtil.looseSerialize(groups);
			log.info("just wanted to see the json " + json);
			response.getPortletOutputStream().write(json.getBytes());
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
		}
		catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
