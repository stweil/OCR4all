<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:html>
    <t:head>
        <title>OCR4all_Web - Page Overview</title>
    </t:head>
    <t:body>
        <div class="container">
            <h3 class="header">Page Overview - ${param.pageId}</h3>
            <p>${test}</p>
            <p>${segmented}</p>
            <img src="data:image/jpeg;base64,${image.Binary}">
        </div>
    </t:body>
</t:html>