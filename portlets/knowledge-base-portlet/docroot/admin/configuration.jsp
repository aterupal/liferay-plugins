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

<%@ include file="/admin/init.jsp" %>

<%
String tabs2 = ParamUtil.getString(request, "tabs2", "general");
String tabs3 = ParamUtil.getString(request, "tabs3", "article");

String emailFromName = ParamUtil.getString(request, "emailFromName", AdminUtil.getEmailFromName(portletPreferences, company.getCompanyId()));
String emailFromAddress = ParamUtil.getString(request, "emailFromAddress", AdminUtil.getEmailFromAddress(portletPreferences, company.getCompanyId()));

boolean emailKBArticleAddedEnabled = ParamUtil.getBoolean(request, "emailKBArticleAddedEnabled", AdminUtil.getEmailKBArticleAddedEnabled(portletPreferences));
String emailKBArticleAddedSubject = ParamUtil.getString(request, "emailKBArticleAddedSubject", AdminUtil.getEmailKBArticleAddedSubject(portletPreferences));
String emailKBArticleAddedBody = ParamUtil.getString(request, "emailKBArticleAddedBody", AdminUtil.getEmailKBArticleAddedBody(portletPreferences));

boolean emailKBArticleFeedbackInProgressEnabled = ParamUtil.getBoolean(request, "emailKBArticleFeedbackInProgressEnabled", AdminUtil.getEmailKBArticleFeedbackInProgressEnabled(portletPreferences));
String emailKBArticleFeedbackInProgressSubject = ParamUtil.getString(request, "emailKBArticleFeedbackInProgressSubject", AdminUtil.getEmailKBArticleFeedbackInProgressSubject(portletPreferences));
String emailKBArticleFeedbackInProgressBody = ParamUtil.getString(request, "emailKBArticleFeedbackInProgressBody", AdminUtil.getEmailKBArticleFeedbackInProgressBody(portletPreferences));

boolean emailKBArticleFeedbackReceivedEnabled = ParamUtil.getBoolean(request, "emailKBArticleFeedbackReceivedEnabled", AdminUtil.getEmailKBArticleFeedbackReceivedEnabled(portletPreferences));
String emailKBArticleFeedbackReceivedSubject = ParamUtil.getString(request, "emailKBArticleFeedbackReceivedSubject", AdminUtil.getEmailKBArticleFeedbackReceivedSubject(portletPreferences));
String emailKBArticleFeedbackReceivedBody = ParamUtil.getString(request, "emailKBArticleFeedbackReceivedBody", AdminUtil.getEmailKBArticleFeedbackReceivedBody(portletPreferences));

boolean emailKBArticleFeedbackResolvedEnabled = ParamUtil.getBoolean(request, "emailKBArticleFeedbackResolvedEnabled", AdminUtil.getEmailKBArticleFeedbackResolvedEnabled(portletPreferences));
String emailKBArticleFeedbackResolvedSubject = ParamUtil.getString(request, "emailKBArticleFeedbackResolvedSubject", AdminUtil.getEmailKBArticleFeedbackResolvedSubject(portletPreferences));
String emailKBArticleFeedbackResolvedBody = ParamUtil.getString(request, "emailKBArticleFeedbackResolvedBody", AdminUtil.getEmailKBArticleFeedbackResolvedBody(portletPreferences));

boolean emailKBArticleUpdatedEnabled = ParamUtil.getBoolean(request, "emailKBArticleUpdatedEnabled", AdminUtil.getEmailKBArticleUpdatedEnabled(portletPreferences));
String emailKBArticleUpdatedSubject = ParamUtil.getString(request, "emailKBArticleUpdatedSubject", AdminUtil.getEmailKBArticleUpdatedSubject(portletPreferences));
String emailKBArticleUpdatedBody = ParamUtil.getString(request, "emailKBArticleUpdatedBody", AdminUtil.getEmailKBArticleUpdatedBody(portletPreferences));

String editorParam = StringPool.BLANK;
String editorBody = StringPool.BLANK;

if (tabs2.equals("article-added-email")) {
	editorParam = "emailKBArticleAddedBody";
	editorBody = emailKBArticleAddedBody;
}
else if (tabs2.equals("article-updated-email")) {
	editorParam = "emailKBArticleUpdatedBody";
	editorBody = emailKBArticleUpdatedBody;
}
else if (tabs2.equals("feedback-in-progress-email")) {
	editorParam = "emailKBArticleFeedbackInProgressBody";
	editorBody = emailKBArticleFeedbackInProgressBody;
}
else if (tabs2.equals("feedback-received-email")) {
	editorParam = "emailKBArticleFeedbackReceivedBody";
	editorBody = emailKBArticleFeedbackReceivedBody;
}
else if (tabs2.equals("feedback-resolved-email")) {
	editorParam = "emailKBArticleFeedbackResolvedBody";
	editorBody = emailKBArticleFeedbackResolvedBody;
}
%>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationActionURL" />

<liferay-portlet:renderURL portletConfiguration="true" var="configurationRenderURL">
	<portlet:param name="tabs2" value="<%= tabs2 %>" />
	<portlet:param name="tabs3" value="<%= tabs3 %>" />
</liferay-portlet:renderURL>

<liferay-ui:tabs
	names="general,email-from,article-added-email,article-updated-email,feedback-received-email,feedback-in-progress-email,feedback-resolved-email,display-settings"
	param="tabs2"
	url="<%= configurationRenderURL %>"
/>

<aui:form action="<%= configurationActionURL %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />
	<aui:input name="tabs2" type="hidden" value="<%= tabs2 %>" />
	<aui:input name="tabs3" type="hidden" value="<%= tabs3 %>" />

	<liferay-ui:error key="emailKBArticleAddedBody" message="please-enter-a-valid-body" />
	<liferay-ui:error key="emailKBArticleAddedSubject" message="please-enter-a-valid-subject" />
	<liferay-ui:error key="emailKBArticleUpdatedBody" message="please-enter-a-valid-body" />
	<liferay-ui:error key="emailKBArticleUpdatedSubject" message="please-enter-a-valid-subject" />
	<liferay-ui:error key="emailFromAddress" message="please-enter-a-valid-email-address" />
	<liferay-ui:error key="emailFromName" message="please-enter-a-valid-name" />

	<aui:fieldset>
		<c:choose>
			<c:when test='<%= tabs2.equals("general") %>'>
				<div class="kb-field-wrapper">
					<aui:field-wrapper label="order-by">
						<aui:select inlineField="<%= true %>" label="" name="preferences--kbArticlesOrderByCol--">
							<aui:option label="author" selected='<%= kbArticlesOrderByCol.equals("user-name") %>' value="user-name" />
							<aui:option label="create-date" selected='<%= kbArticlesOrderByCol.equals("create-date") %>' />
							<aui:option label="modified-date" selected='<%= kbArticlesOrderByCol.equals("modified-date") %>' />
							<aui:option label="priority" selected='<%= kbArticlesOrderByCol.equals("priority") %>' />
							<aui:option label="status" selected='<%= kbArticlesOrderByCol.equals("status") %>' />
							<aui:option label="title" selected='<%= kbArticlesOrderByCol.equals("title") %>' />
							<aui:option label="view-count" selected='<%= kbArticlesOrderByCol.equals("view-count") %>' />
						</aui:select>

						<aui:select inlineField="<%= true %>" label="" name="preferences--kbArticlesOrderByType--">
							<aui:option label="ascending" selected='<%= kbArticlesOrderByType.equals("asc") %>' value="asc" />
							<aui:option label="descending" selected='<%= kbArticlesOrderByType.equals("desc") %>' value="desc" />
						</aui:select>
					</aui:field-wrapper>
				</div>
			</c:when>
			<c:when test='<%= tabs2.equals("email-from") %>'>
				<aui:input cssClass="lfr-input-text-container" label="name" name="preferences--emailFromName--" value="<%= emailFromName %>" />

				<aui:input cssClass="lfr-input-text-container" label="address" name="preferences--emailFromAddress--" value="<%= emailFromAddress %>" />

				<div class="definition-of-terms">
					<h4><liferay-ui:message key="definition-of-terms" /></h4>

					<dl>
						<dt>
							[$ARTICLE_USER_ADDRESS$]
						</dt>
						<dd>
							<liferay-ui:message key="the-email-address-of-the-user-who-added-the-article" />
						</dd>
						<dt>
							[$ARTICLE_USER_NAME$]
						</dt>
						<dd>
							<liferay-ui:message key="the-user-who-added-the-article" />
						</dd>
						<dt>
							[$CATEGORY_TITLE$]
						</dt>
						<dd>
							<liferay-ui:message key="category.kb" />
						</dd>
						<dt>
							[$COMMUNITY_NAME$]
						</dt>
						<dd>
							<liferay-ui:message key="the-site-name-associated-with-the-article" />
						</dd>
						<dt>
							[$COMPANY_ID$]
						</dt>
						<dd>
							<liferay-ui:message key="the-company-id-associated-with-the-article" />
						</dd>
						<dt>
							[$COMPANY_MX$]
						</dt>
						<dd>
							<liferay-ui:message key="the-company-mx-associated-with-the-article" />
						</dd>
						<dt>
							[$COMPANY_NAME$]
						</dt>
						<dd>
							<liferay-ui:message key="the-company-name-associated-with-the-article" />
						</dd>
					</dl>
				</div>
			</c:when>
			<c:when test='<%= tabs2.startsWith("article-") %>'>
				<c:choose>
					<c:when test='<%= tabs2.equals("article-added-email") %>'>
						<aui:input label="enabled" name="preferences--emailKBArticleAddedEnabled--" type="checkbox" value="<%= emailKBArticleAddedEnabled %>" />
					</c:when>
					<c:when test='<%= tabs2.equals("article-updated-email") %>'>
						<aui:input label="enabled" name="preferences--emailKBArticleUpdatedEnabled--" type="checkbox" value="<%= emailKBArticleUpdatedEnabled %>" />
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test='<%= tabs2.equals("article-added-email") %>'>
						<aui:input cssClass="lfr-input-text-container" label="subject" name="preferences--emailKBArticleAddedSubject--" value="<%= emailKBArticleAddedSubject %>" />
					</c:when>
					<c:when test='<%= tabs2.equals("article-updated-email") %>'>
						<aui:input cssClass="lfr-input-text-container" label="subject" name="preferences--emailKBArticleUpdatedSubject--" value="<%= emailKBArticleUpdatedSubject %>" />
					</c:when>
				</c:choose>

				<aui:input cssClass="lfr-textarea-container" label="body" name='<%= "preferences--".concat(editorParam).concat("--") %>' type="textarea" value="<%= editorBody %>" />

				<div class="definition-of-terms">
					<h4><liferay-ui:message key="definition-of-terms" /></h4>

					<dl>
						<dt>
							[$ARTICLE_ATTACHMENTS$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-attachments-file-names" />
						</dd>
						<dt>
							[$ARTICLE_CONTENT$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-content" />
						</dd>
						<dt>
							[$ARTICLE_CONTENT_DIFF$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-content-diff" />
						</dd>
						<dt>
							[$ARTICLE_TITLE$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-title" />
						</dd>
						<dt>
							[$ARTICLE_TITLE_DIFF$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-title-diff" />
						</dd>
						<dt>
							[$ARTICLE_URL$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-url" />
						</dd>
						<dt>
							[$ARTICLE_USER_ADDRESS$]
						</dt>
						<dd>
							<liferay-ui:message key="the-email-address-of-the-user-who-added-the-article" />
						</dd>
						<dt>
							[$ARTICLE_USER_NAME$]
						</dt>
						<dd>
							<liferay-ui:message key="the-user-who-added-the-article" />
						</dd>
						<dt>
							[$ARTICLE_VERSION$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-version" />
						</dd>
						<dt>
							[$CATEGORY_TITLE$]
						</dt>
						<dd>
							<liferay-ui:message key="category.kb" />
						</dd>
						<dt>
							[$COMMUNITY_NAME$]
						</dt>
						<dd>
							<liferay-ui:message key="the-site-name-associated-with-the-article" />
						</dd>
						<dt>
							[$COMPANY_ID$]
						</dt>
						<dd>
							<liferay-ui:message key="the-company-id-associated-with-the-article" />
						</dd>
						<dt>
							[$COMPANY_MX$]
						</dt>
						<dd>
							<liferay-ui:message key="the-company-mx-associated-with-the-article" />
						</dd>
						<dt>
							[$COMPANY_NAME$]
						</dt>
						<dd>
							<liferay-ui:message key="the-company-name-associated-with-the-article" />
						</dd>
						<dt>
							[$FROM_ADDRESS$]
						</dt>
						<dd>
							<%= HtmlUtil.escape(emailFromAddress) %>
						</dd>
						<dt>
							[$FROM_NAME$]
						</dt>
						<dd>
							<%= HtmlUtil.escape(emailFromName) %>
						</dd>
						<dt>
							[$PORTAL_URL$]
						</dt>
						<dd>
							<%= PortalUtil.getPortalURL(themeDisplay) %>
						</dd>
						<dt>
							[$TO_ADDRESS$]
						</dt>
						<dd>
							<liferay-ui:message key="the-address-of-the-email-recipient" />
						</dd>
						<dt>
							[$TO_NAME$]
						</dt>
						<dd>
							<liferay-ui:message key="the-name-of-the-email-recipient" />
						</dd>
					</dl>
				</div>
			</c:when>
			<c:when test='<%= tabs2.startsWith("feedback-") %>'>
				<c:choose>
					<c:when test='<%= tabs2.equals("feedback-in-progress-email") %>'>
						<aui:input label="enabled" name="preferences--emailKBArticleFeedbackInProgressEnabled--" type="checkbox" value="<%= emailKBArticleFeedbackInProgressEnabled %>" />
					</c:when>
					<c:when test='<%= tabs2.equals("feedback-received-email") %>'>
						<aui:input label="enabled" name="preferences--emailKBArticleFeedbackReceivedEnabled--" type="checkbox" value="<%= emailKBArticleFeedbackReceivedEnabled %>" />
					</c:when>
					<c:when test='<%= tabs2.equals("feedback-resolved-email") %>'>
						<aui:input label="enabled" name="preferences--emailKBArticleFeedbackResolvedEnabled--" type="checkbox" value="<%= emailKBArticleFeedbackResolvedEnabled %>" />
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test='<%= tabs2.equals("feedback-in-progress-email") %>'>
						<aui:input cssClass="lfr-input-text-container" label="subject" name="preferences--emailKBArticleFeedbackInProgressSubject--" value="<%= emailKBArticleFeedbackInProgressSubject %>" />
					</c:when>
					<c:when test='<%= tabs2.equals("feedback-received-email") %>'>
						<aui:input cssClass="lfr-input-text-container" label="subject" name="preferences--emailKBArticleFeedbackReceivedSubject--" value="<%= emailKBArticleFeedbackReceivedSubject %>" />
					</c:when>
					<c:when test='<%= tabs2.equals("feedback-resolved-email") %>'>
						<aui:input cssClass="lfr-input-text-container" label="subject" name="preferences--emailKBArticleFeedbackResolvedSubject--" value="<%= emailKBArticleFeedbackResolvedSubject %>" />
					</c:when>
				</c:choose>

				<aui:input cssClass="lfr-textarea-container" label="body" name='<%= "preferences--".concat(editorParam).concat("--") %>' type="textarea" value="<%= editorBody %>" />

				<div class="definition-of-terms">
					<h4><liferay-ui:message key="definition-of-terms" /></h4>

					<dl>
						<dt>
							[$ARTICLE_CONTENT$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-content" />
						</dd>
						<dt>
							[$ARTICLE_TITLE$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-title" />
						</dd>
						<dt>
							[$ARTICLE_URL$]
						</dt>
						<dd>
							<liferay-ui:message key="the-article-url" />
						</dd>
						<dt>
							[$TO_ADDRESS$]
						</dt>
						<dd>
							<liferay-ui:message key="the-address-of-the-email-recipient" />
						</dd>
						<dt>
							[$TO_NAME$]
						</dt>
						<dd>
							<liferay-ui:message key="the-name-of-the-email-recipient" />
						</dd>
					</dl>
				</div>
			</c:when>
			<c:when test='<%= tabs2.equals("display-settings") %>'>
				<liferay-ui:tabs
					names="article,template"
					param="tabs3"
					url="<%= configurationRenderURL %>"
				/>

				<c:choose>
					<c:when test='<%= tabs3.equals("article") %>'>
						<aui:input label="enable-description" name="preferences--enableKBArticleDescription--" type="checkbox" value="<%= enableKBArticleDescription %>" />

						<aui:input label="enable-ratings" name="preferences--enableKBArticleRatings--" type="checkbox" value="<%= enableKBArticleRatings %>" />

						<div class="kb-ratings-type" id="<portlet:namespace />ratingsType">
							<aui:input checked='<%= kbArticleRatingsType.equals("stars") %>' label="use-star-ratings" name="preferences--kbArticleRatingsType--" type="radio" value="stars" />
							<aui:input checked='<%= kbArticleRatingsType.equals("thumbs") %>' label="use-thumbs-up-thumbs-down" name="preferences--kbArticleRatingsType--" type="radio" value="thumbs" />
						</div>

						<aui:input label="show-asset-entries" name="preferences--showKBArticleAssetEntries--" type="checkbox" value="<%= showKBArticleAssetEntries %>" />

						<aui:input label="enable-related-assets" name="preferences--enableKBArticleAssetLinks--" type="checkbox" value="<%= enableKBArticleAssetLinks %>" />

						<aui:input label="enable-view-count-increment" name="preferences--enableKBArticleViewCountIncrement--" type="checkbox" value="<%= enableKBArticleViewCountIncrement %>" />
					</c:when>
					<c:when test='<%= tabs3.equals("template") %>'>
						<aui:input label="enable-suggestions" name="preferences--enableKBTemplateKBComments--" type="checkbox" value="<%= enableKBTemplateKBComments %>" />

						<aui:input label="show-feedback" name="preferences--showKBTemplateKBComments--" type="checkbox" value="<%= showKBTemplateKBComments %>" />
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>

		<aui:button-row cssClass="kb-submit-buttons">
			<aui:button type="submit" />
		</aui:button-row>
	</aui:fieldset>
</aui:form>

<c:if test='<%= tabs2.equals("display-settings") && tabs3.equals("article") %>'>
	<aui:script>
		Liferay.Util.toggleBoxes('<portlet:namespace />enableKBArticleRatingsCheckbox', '<portlet:namespace />ratingsType');
	</aui:script>
</c:if>
