<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
</head>

<body class="${css_class}">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<@liferay.control_menu />
<#assign HEADER_MENU_ID = "36032" >
<#assign FOOTER_MENU_ID = "37969" >
<#assign journalArticleLocalService = serviceLocator.findService("com.liferay.journal.service.JournalArticleLocalService")>
<#assign headerContent = journalArticleLocalService.getArticle(theme_display.getSiteGroupId(), HEADER_MENU_ID)>
<#assign footerContent = journalArticleLocalService.getArticle(theme_display.getSiteGroupId(), FOOTER_MENU_ID)>

<div class="container-fluid" id="wrapper">
	<header>
		${journalArticleLocalService.getArticleContent(headerContent, headerContent.getDDMTemplateKey(), "VIEW", locale, theme_display)}
	</header>
	
	<section id="content">
		<h1 class="hide-accessible">${the_title}</h1>

		<#if selectable>
			<@liferay_util["include"] page=content_include />
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>

	<footer id="footer" role="contentinfo">
		${journalArticleLocalService.getArticleContent(footerContent, footerContent.getDDMTemplateKey(), "VIEW", locale, theme_display)}
	</footer>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<!-- inject:js -->
<!-- endinject -->
</body>

</html>