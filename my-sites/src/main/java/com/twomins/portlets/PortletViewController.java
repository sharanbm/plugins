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

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ReleaseInfo;

import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Group;
import com.liferay.portal.service.GroupLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import javax.portlet.RenderRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("VIEW")
public class PortletViewController {


    Log log = LogFactoryUtil.getLog(this.getClass());

    @RenderMapping
    public String question(Model model, RenderRequest renderRequest) {
        model.addAttribute("releaseInfo", ReleaseInfo.getReleaseInfo());

        ThemeDisplay themeDisplay = (ThemeDisplay) renderRequest.getAttribute(WebKeys.THEME_DISPLAY);
        List<Group> groups = new ArrayList<Group>();
        String json = "";

        try {
            groups = GroupLocalServiceUtil.getUserGroups(themeDisplay.getUserId());
            json = JSONFactoryUtil.looseSerialize(groups);
            log.info(json);
            model.addAttribute("groupsList", json);
        } catch (SystemException e) {
            e.printStackTrace();
        }
        return "my-sites/view";
    }

}