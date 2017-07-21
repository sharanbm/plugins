<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table id="target_table_id">
    <tbody></tbody>
</table>


<script>
    $(document).ready(function () {
        var tbl_body = "";
        var odd_even = false;

        $.each(${groupsList}, function (k, v) {
            var tbl_row = "";
            tbl_row += "<td>" + v.name + "</td>";
            tbl_body += "<tr class=\"" + ( odd_even ? "odd" : "even") + "\">" + tbl_row + "</tr>";
            odd_even = !odd_even;
        })

        $("#target_table_id tbody").html(tbl_body);
    })
</script>