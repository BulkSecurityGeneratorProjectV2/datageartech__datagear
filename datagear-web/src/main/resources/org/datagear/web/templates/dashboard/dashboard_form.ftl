<#--
 *
 * Copyright 2018 datagear.tech
 *
 * Licensed under the LGPLv3 license:
 * http://www.gnu.org/licenses/lgpl-3.0.html
 *
-->
<#include "../include/import_global.ftl">
<#include "../include/html_doctype.ftl">
<#--
titleMessageKey 标题标签I18N关键字，不允许null
formAction 表单提交action，允许为null
readonly 是否只读操作，允许为null
-->
<#assign formAction=(formAction!'#')>
<#assign readonly=(readonly!false)>
<#assign isAdd=(isAdd!false)>
<html>
<head>
<#include "../include/html_head.ftl">
<title><#include "../include/html_title_app_name.ftl"><@spring.message code='${titleMessageKey}' /></title>
</head>
<body>
<#include "../include/page_js_obj.ftl" >
<div id="${pageId}" class="page-form page-form-dashboard">
	<form id="${pageId}-form" action="${contextPath}/dashboard/${formAction}" method="POST" class="dashboard-form">
		<div class="form-head"></div>
		<div class="form-content">
			<input type="hidden" name="id" value="${(dashboard.id)!''}" />
			<input type="hidden" id="${pageId}-copySourceId" value="${copySourceId!''}" />
			<input type="hidden" name="templateEncoding" value="${(dashboard.templateEncoding)!''}" />
			<textarea id="${pageId}-initTemplateName" style="display:none;">${templateName}</textarea>
			<textarea id="${pageId}-initTemplateContent" style="display:none;">${templateContent!''}</textarea>
			<textarea id="${pageId}-defaultTemplateContent" style="display:none;">${defaultTemplateContent!''}</textarea>
			<div class="form-item form-item-analysisProjectAware">
				<div class="form-item-label">
					<label><@spring.message code='dashboard.name' /></label>
				</div>
				<div class="form-item-value">
					<input type="text" name="name" value="${(dashboard.name)!''}" placeholder="<@spring.message code='dashboard.name' />" class="ui-widget ui-widget-content" />
				</div>
				<#include "../include/analysisProjectAware_form_select.ftl" >
			</div>
			<div class="form-item form-item-resources">
				<div class="form-item-label">
					<label><@spring.message code='dashboard.dashboardResource' /></label>
				</div>
				<div class="form-item-value form-item-value-resources">
					<div class="resources-wrapper">
						<div id="${pageId}-resourceEditorTabs" class="resource-editor-tabs minor-tabs">
							<ul class="resource-editor-tab-nav always-show">
							</ul>
							<div class="tabs-more-operation-menu-wrapper ui-widget ui-front ui-widget-content ui-corner-all ui-widget-shadow" style="position: absolute; left:0px; top:0px; display: none;">
								<ul class="tabs-more-operation-menu">
									<li class="tab-operation-close-left"><div><@spring.message code='main.closeLeft' /></div></li>
									<li class="tab-operation-close-right"><div><@spring.message code='main.closeRight' /></div></li>
									<li class="tab-operation-close-other"><div><@spring.message code='main.closeOther' /></div></li>
									<li class="tab-operation-close-all"><div><@spring.message code='main.closeAll' /></div></li>
								</ul>
							</div>
							<div class="tabs-more-tab-menu-wrapper ui-widget ui-front ui-widget-content ui-corner-all ui-widget-shadow" style="position: absolute; left:0px; top:0px; display: none;">
								<ul class="tabs-more-tab-menu">
								</ul>
							</div>
							<div class="resize-editor-wrapper resize-left">
								<button type='button' class='resize-editor-button resize-editor-button-left ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='expandOrCollapse' />"><span class='ui-icon ui-icon-arrowstop-1-w'></span><span class='ui-button-icon-space'></span></button>
							</div>
						</div>
						<div class="resource-list-tabs minor-tabs">
							<ul class="resource-list-tabs-nav">
								<li class="nav-item-local"><a href="#${pageId}-resourceListLocal"><@spring.message code='dashboard.localResource' /></a></li>
								<li class="nav-item-global"><a href="#${pageId}-resourceListGlobal"><@spring.message code='dashboard.globalResource' /></a></li>
							</ul>
							<div id="${pageId}-resourceListLocal" class="resource-list-wrapper resource-list-local-wrapper ui-widget ui-widget-content ui-corner-all">
								<div class="resource-list-head ui-widget ui-widget-content">
									<#if !readonly>
									<div class="resource-button-wrapper rbw-left">
										<button type='button' auto-close-prevent="add-resource-panel" class='addResBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.addResource.desc' />"><span class='ui-icon ui-icon-plus'></span><span class='ui-button-icon-space'></span></button>
										<button type='button' auto-close-prevent="upload-resource-panel" class='uploadResBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.uploadResource' />"><span class='ui-icon ui-icon-arrowstop-1-n'></span><span class='ui-button-icon-space'></span></button>
									</div>
									</#if>
									<div class="resource-button-wrapper rbw-right">
										<#if !readonly>
										<button type='button' class='editResBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.editResource.desc' />"><span class='ui-icon ui-icon-pencil'></span><span class='ui-button-icon-space'></span></button>
										<button type='button' class='copyResNameButton resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.copyResourceNameToClipboard' />"><span class='ui-icon ui-icon-copy'></span><span class='ui-button-icon-space'></span></button>
										<button type='button' class='viewResButton resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.viewResource' />"><span class='ui-icon ui-icon-extlink'></span><span class='ui-button-icon-space'></span></button>
										<div class="resource-more-button-wrapper">
											<span class="resource-more-icon ui-icon ui-icon-caret-1-s"></span>
											<div class="resource-more-button-panel ui-widget ui-widget-content ui-corner-all ui-front ui-widget-shadow">
												<button type='button' class='deleteResBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.deleteResource' />"><span class='ui-icon ui-icon-close'></span><span class='ui-button-icon-space'></span></button>
												<button type='button' class='asTemplateBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.resourceAsTemplate' />"><span class='ui-icon ui-icon-arrow-1-n'></span><span class='ui-button-icon-space'></span></button>
												<button type='button' class='asNormalResBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.templateAsNormalResource' />"><span class='ui-icon ui-icon-arrow-1-s'></span><span class='ui-button-icon-space'></span></button>
												<button type='button' class='asFirstTemplateBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.asFirstTemplate' />"><span class='ui-icon ui-icon-home'></span><span class='ui-button-icon-space'></span></button>
												<button type='button' class='refreshResListBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.refreshResource' />"><span class='ui-icon ui-icon-refresh'></span><span class='ui-button-icon-space'></span></button>
											</div>
										</div>
										<#else>
										<button type='button' class='editResBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.editResource.desc' />"><span class='ui-icon ui-icon-pencil'></span><span class='ui-button-icon-space'></span></button>
										<button type='button' class='copyResNameButton resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.copyResourceNameToClipboard' />"><span class='ui-icon ui-icon-copy'></span><span class='ui-button-icon-space'></span></button>
										<button type='button' class='viewResButton resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.viewResource' />"><span class='ui-icon ui-icon-extlink'></span><span class='ui-button-icon-space'></span></button>
										<button type='button' class='refreshResListBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.refreshResource' />"><span class='ui-icon ui-icon-refresh'></span><span class='ui-button-icon-space'></span></button>
										</#if>
									</div>
								</div>
								<div class="resource-list-template"></div>
								<div class="resource-list-divider ui-widget ui-widget-content"></div>
								<div class="resource-list-content"></div>
							</div>
							<div id="${pageId}-resourceListGlobal" class="resource-list-wrapper resource-list-global-wrapper ui-widget ui-widget-content ui-corner-all">
								<div class="resource-list-head ui-widget ui-widget-content">
									<div class="resource-button-wrapper rbw-left">
										<div class="search-group ui-widget ui-widget-content ui-corner-all">
											<input type="text" class="search-input ui-widget ui-widget-content" />
											<button type="button" class="search-button ui-button ui-corner-all ui-widget ui-button-icon-only">
												<span class="ui-icon ui-icon-search"></span><span class="ui-button-icon-space"></span>Search
											</button>
										</div>
									</div>
									<div class="resource-button-wrapper rbw-right">
										<button type='button' class='copyResNameButton resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.copyResourceNameToClipboard' />"><span class='ui-icon ui-icon-copy'></span><span class='ui-button-icon-space'></span></button>
										<button type='button' class='viewResButton resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.viewResource' />"><span class='ui-icon ui-icon-extlink'></span><span class='ui-button-icon-space'></span></button>
										<button type='button' class='refreshResListBtn resource-button ui-button ui-corner-all ui-widget ui-button-icon-only' title="<@spring.message code='dashboard.refreshResource' />"><span class='ui-icon ui-icon-refresh'></span><span class='ui-button-icon-space'></span></button>
									</div>
								</div>
								<div class="resource-list-global-prefix ui-state-default">${dashboardGlobalResUrlPrefix}</div>
								<div class='resource-none ui-state-disabled'><@spring.message code='none' /></div>
								<div class="resource-list-content">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="form-foot">
			<#if !readonly>
			<button type="submit" class="recommended"><@spring.message code='save' /></button>
			<button id="saveAndShowDashboard" type="button"><@spring.message code='dashboard.saveAndShow' /></button>
			</#if>
		</div>
	</form>
	<form id="${pageId}-tplEditVisualForm" action="#" method="POST" style="display:none;">
		<input type="hidden" name="DG_EDIT_TEMPLATE" value="true" />
		<textarea name="DG_TEMPLATE_CONTENT"></textarea>
	</form>
	<div class="chart-list-panel auto-close-panel togglable-table-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<div class="panel-content minor-dataTable pagination-light"></div>
	</div>
	<div class='add-resource-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-front ui-widget-shadow'>
		<form action="#" method="POST">
			<div class="panel-head ui-widget-header ui-corner-all"><@spring.message code='dashboard.addResource' /></div>
			<div class="panel-content">
				<div class="content-item">
					<div class="label-wrapper">
						<label title="<@spring.message code='dashboard.addResource.name.desc' />" class="tip-label">
							<@spring.message code='dashboard.addResource.name' />
						</label>
					</div>
					<input type="text" name="addResName" value="" class="ui-widget ui-widget-content" />
				</div>
			</div>
			<div class="panel-foot">
				<button type="submit" class="recommended"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class='upload-resource-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front'>
		<form action="#" method="POST">
			<div class="panel-head ui-widget-header ui-corner-all"><@spring.message code='dashboard.uploadResource' /></div>
			<div class="panel-content">
				<div class="content-item">
					<div class="label-wrapper">
						<label><@spring.message code='dashboard.uploadResource.select' /></label>
					</div>
					<div class="fileinput-button ui-button ui-corner-all ui-widget">
						<@spring.message code='select' /><input type="file" class="ignore">
					</div>
					<div class="upload-file-info"></div>
				</div>
				<div class="content-item">
					<div class="label-wrapper">
						<label title="<@spring.message code='dashboard.uploadResource.savePath.desc' />" class="tip-label">
							<@spring.message code='dashboard.uploadResource.savePath' />
						</label>
					</div>
					<input type="text" name="uploadResName" value="" class="ui-widget ui-widget-content" />
					<input type="hidden"name="uploadResFilePath"  value="" />
				</div>
			</div>
			<div class="panel-foot">
				<button type="submit" class="recommended"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class="veditor-content-panel veditor-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<form action="#" method="POST" class="display-37">
			<div class="panel-head ui-widget-header ui-corner-all">
				<@spring.message code='dashboard.veditor.content' />
			</div>
			<div class="panel-content">
				<div class="content-item">
					<div class="label-wrapper">
						<label><@spring.message code='dashboard.veditor.content.content' /></label>
					</div>
					<input type="text" name="content" value="" class="ui-widget ui-widget-content" />
				</div>
			</div>
			<div class="panel-foot">
				<button type="submit" class="recommended"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class="veditor-style-panel veditor-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<form action="#" method="POST" class="display-37">
			<div class="panel-head ui-widget-header ui-corner-all">
				<div class="editStyleTitle">
					<@spring.message code='dashboard.veditor.style' />
				</div>
				<div class="editGlobalStyleTitle">
					<@spring.message code='dashboard.veditor.globalStyle' />
				</div>
			</div>
			<div class="panel-content form-content">
				<div class="style-tabs minor-tabs">
					<ul class="style-tabs-nav">
						<li><a href="#${pageId}-styleTabsPaneColor"><@spring.message code='dashboard.veditor.styleCategory.color' /></a></li>
						<li><a href="#${pageId}-styleTabsPaneSize"><@spring.message code='dashboard.veditor.styleCategory.size' /></a></li>
						<li><a href="#${pageId}-styleTabsPaneFont"><@spring.message code='dashboard.veditor.styleCategory.font' /></a></li>
					</ul>
					<div id="${pageId}-styleTabsPaneColor" class="style-tab-pane ui-widget ui-widget-content">
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.color.desc' />">
									<@spring.message code='dashboard.veditor.style.color' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="color" class="ui-widget ui-widget-content" size="100" />
								<div class="color-indicator listpallet-indicator ui-widget ui-widget-content ui-corner-all"></div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.bgColor.desc' />">
									<@spring.message code='dashboard.veditor.style.bgColor' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="background-color" class="ui-widget ui-widget-content" size="100" />
								<div class="bgcolor-indicator listpallet-indicator ui-widget ui-widget-content ui-corner-all"></div>
							</div>
						</div>
						<div class="ui-widget-header">
							<@spring.message code='dashboard.veditor.styleSubType.bgImage' />
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.bgImage.desc' />">
									<@spring.message code='dashboard.veditor.style.bgImage' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="background-image" class="width-9 ui-widget ui-widget-content" size="200" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label><@spring.message code='dashboard.veditor.style.bgSize' /></label>
							</div>
							<div class="form-item-value">
								<input type="text" name="background-size" class="help-target ui-widget ui-widget-content" size="200" />
								<br>
								<div class="styleBgSizeBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="100% 100%">
										<@spring.message code='dashboard.veditor.style.bgSize.fill' />
									</button>
									<button type="button" class="help-src small-button" help-value="100% auto">
										<@spring.message code='dashboard.veditor.style.bgSize.fill-x' />
									</button>
									<button type="button" class="help-src small-button" help-value="auto 100%">
										<@spring.message code='dashboard.veditor.style.bgSize.fill-y' />
									</button>
									<button type="button" class="help-src small-button" help-value="auto auto">
										<@spring.message code='dashboard.veditor.style.bgSize.oirgin' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label><@spring.message code='dashboard.veditor.style.bgRepeat' /></label>
							</div>
							<div class="form-item-value">
								<input type="text" name="background-repeat" class="help-target ui-widget ui-widget-content" size="200" />
								<br>
								<div class="styleBgRepeatBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="no-repeat">
										<@spring.message code='dashboard.veditor.style.bgRepeat.no-repeat' />
									</button>
									<button type="button" class="help-src small-button" help-value="repeat">
										<@spring.message code='dashboard.veditor.style.bgRepeat.repeat' />
									</button>
									<button type="button" class="help-src small-button" help-value="repeat-x">
										<@spring.message code='dashboard.veditor.style.bgRepeat.repeat-x' />
									</button>
									<button type="button" class="help-src small-button" help-value="repeat-y">
										<@spring.message code='dashboard.veditor.style.bgRepeat.repeat-y' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label><@spring.message code='dashboard.veditor.style.bgPosition' /></label>
							</div>
							<div class="form-item-value">
								<input type="text" name="background-position" class="help-target ui-widget ui-widget-content" size="200" />
								<br>
								<div class="styleBgPositionBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="center center">
										<@spring.message code='dashboard.veditor.style.bgPosition.center' />
									</button>
									<button type="button" class="help-src small-button" help-value="left top">
										<@spring.message code='dashboard.veditor.style.bgPosition.leftTop' />
									</button>
									<button type="button" class="help-src small-button" help-value="right top">
										<@spring.message code='dashboard.veditor.style.bgPosition.rightTop' />
									</button>
									<button type="button" class="help-src small-button" help-value="left bottom">
										<@spring.message code='dashboard.veditor.style.bgPosition.leftBottom' />
									</button>
									<button type="button" class="help-src small-button" help-value="right bottom">
										<@spring.message code='dashboard.veditor.style.bgPosition.rightBottom' />
									</button>
								</div>
							</div>
						</div>
						<div class="ui-widget-header">
							<@spring.message code='dashboard.veditor.styleSubType.border' />
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label title="<@spring.message code='dashboard.veditor.style.borderWidth.desc' />">
									<@spring.message code='dashboard.veditor.style.borderWidth' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="border-width" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleBorderWidthBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="1px">
										<@spring.message code='dashboard.veditor.style.borderWidth.1px' />
									</button>
									<button type="button" class="help-src small-button" help-value="2px">
										<@spring.message code='dashboard.veditor.style.borderWidth.2px' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.borderColor.desc' />">
									<@spring.message code='dashboard.veditor.style.borderColor' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="border-color" class="ui-widget ui-widget-content" size="200" />
								<div class="border-color-indicator listpallet-indicator ui-widget ui-widget-content ui-corner-all"></div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label>
									<@spring.message code='dashboard.veditor.style.borderStyle' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="border-style" class="help-target ui-widget ui-widget-content" size="200" />
								<br>
								<div class="styleBorderStyleBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="solid">
										<@spring.message code='dashboard.veditor.style.borderStyle.solid' />
									</button>
									<button type="button" class="help-src small-button" help-value="dotted">
										<@spring.message code='dashboard.veditor.style.borderStyle.dotted' />
									</button>
									<button type="button" class="help-src small-button" help-value="dashed">
										<@spring.message code='dashboard.veditor.style.borderStyle.dashed' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.borderRadius.desc' />">
									<@spring.message code='dashboard.veditor.style.borderRadius' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="border-radius" class="ui-widget ui-widget-content" size="200" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.boxShadow.desc' />">
									<@spring.message code='dashboard.veditor.style.boxShadow' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="box-shadow" class="ui-widget ui-widget-content" size="200" />
							</div>
						</div>
					</div>
					<div id="${pageId}-styleTabsPaneSize" class="style-tab-pane ui-widget ui-widget-content">
						<div class="ui-widget-header">
							<@spring.message code='dashboard.veditor.styleSubType.display' />
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label><@spring.message code='dashboard.veditor.style.display' /></label>
							</div>
							<div class="form-item-value">
								<input type="text" name="display" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleDisplayBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="flex">
										<@spring.message code='dashboard.veditor.style.display.flex' />
									</button>
									<button type="button" class="help-src small-button" help-value="inline-flex">
										<@spring.message code='dashboard.veditor.style.display.inline-flex' />
									</button>
									<button type="button" class="help-src small-button" help-value="block">
										<@spring.message code='dashboard.veditor.style.display.block' />
									</button>
									<button type="button" class="help-src small-button" help-value="inline-block">
										<@spring.message code='dashboard.veditor.style.display.inline-block' />
									</button>
									<button type="button" class="help-src small-button" help-value="inline">
										<@spring.message code='dashboard.veditor.style.display.inline' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.width.desc' />">
									<@spring.message code='dashboard.veditor.style.width' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="width" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.height.desc' />">
									<@spring.message code='dashboard.veditor.style.height' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="height" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.padding.desc' />">
									<@spring.message code='dashboard.veditor.style.padding' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="padding" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.margin.desc' />">
									<@spring.message code='dashboard.veditor.style.margin' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="margin" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label>
									<@spring.message code='dashboard.veditor.style.boxSizing' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="box-sizing" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleBoxSizingBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="border-box">
										<@spring.message code='dashboard.veditor.style.boxSizing.border-box' />
									</button>
									<button type="button" class="help-src small-button" help-value="content-box">
										<@spring.message code='dashboard.veditor.style.boxSizing.content-box' />
									</button>
								</div>
							</div>
						</div>
						<div class="ui-widget-header">
							<@spring.message code='dashboard.veditor.styleSubType.position' />
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label><@spring.message code='dashboard.veditor.style.position' /></label>
							</div>
							<div class="form-item-value">
								<input type="text" name="position" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="stylePositionBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="absolute">
										<@spring.message code='dashboard.veditor.style.position.absolute' />
									</button>
									<button type="button" class="help-src small-button" help-value="relative">
										<@spring.message code='dashboard.veditor.style.position.relative' />
									</button>
									<button type="button" class="help-src small-button" help-value="fixed">
										<@spring.message code='dashboard.veditor.style.position.fixed' />
									</button>
									<button type="button" class="help-src small-button" help-value="static">
										<@spring.message code='dashboard.veditor.style.position.static' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.left.desc' />">
									<@spring.message code='dashboard.veditor.style.left' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="left" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.top.desc' />">
									<@spring.message code='dashboard.veditor.style.top' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="top" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.right.desc' />">
									<@spring.message code='dashboard.veditor.style.right' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="right" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.bottom.desc' />">
									<@spring.message code='dashboard.veditor.style.bottom' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="bottom" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="ui-widget-header">
							<@spring.message code='dashboard.veditor.styleSubType.flexContainer' />
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label>
									<@spring.message code='dashboard.veditor.style.flexDirection' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="flex-direction" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleFlexDirectionBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="row">
										<@spring.message code='dashboard.veditor.style.flexDirection.row' />
									</button>
									<button type="button" class="help-src small-button" help-value="row-reverse">
										<@spring.message code='dashboard.veditor.style.flexDirection.row-reverse' />
									</button>
									<button type="button" class="help-src small-button" help-value="column">
										<@spring.message code='dashboard.veditor.style.flexDirection.column' />
									</button>
									<button type="button" class="help-src small-button" help-value="column-reverse">
										<@spring.message code='dashboard.veditor.style.flexDirection.column-reverse' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label>
									<@spring.message code='dashboard.veditor.style.flexWrap' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="flex-wrap" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleFlexWrapBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="nowrap">
										<@spring.message code='dashboard.veditor.style.flexWrap.nowrap' />
									</button>
									<button type="button" class="help-src small-button" help-value="wrap">
										<@spring.message code='dashboard.veditor.style.flexWrap.wrap' />
									</button>
									<button type="button" class="help-src small-button" help-value="wrap-reverse">
										<@spring.message code='dashboard.veditor.style.flexWrap.wrap-reverse' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label>
									<@spring.message code='dashboard.veditor.style.justifyContent' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="justify-content" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleJustifyContentBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="flex-start">
										<@spring.message code='dashboard.veditor.style.flexAligns.flex-start' />
									</button>
									<button type="button" class="help-src small-button" help-value="flex-end">
										<@spring.message code='dashboard.veditor.style.flexAligns.flex-end' />
									</button>
									<button type="button" class="help-src small-button" help-value="center">
										<@spring.message code='dashboard.veditor.style.flexAligns.center' />
									</button>
									<button type="button" class="help-src small-button" help-value="space-between">
										<@spring.message code='dashboard.veditor.style.flexAligns.space-between' />
									</button>
									<button type="button" class="help-src small-button" help-value="space-around">
										<@spring.message code='dashboard.veditor.style.flexAligns.space-around' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label>
									<@spring.message code='dashboard.veditor.style.alignItems' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="align-items" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleAlignItemsBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="flex-start">
										<@spring.message code='dashboard.veditor.style.flexAligns.flex-start' />
									</button>
									<button type="button" class="help-src small-button" help-value="flex-end">
										<@spring.message code='dashboard.veditor.style.flexAligns.flex-end' />
									</button>
									<button type="button" class="help-src small-button" help-value="center">
										<@spring.message code='dashboard.veditor.style.flexAligns.center' />
									</button>
									<button type="button" class="help-src small-button" help-value="baseline">
										<@spring.message code='dashboard.veditor.style.flexAligns.baseline' />
									</button>
									<button type="button" class="help-src small-button" help-value="stretch">
										<@spring.message code='dashboard.veditor.style.flexAligns.stretch' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label>
									<@spring.message code='dashboard.veditor.style.alignContent' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="align-content" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleAlignContentBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="flex-start">
										<@spring.message code='dashboard.veditor.style.flexAligns.flex-start' />
									</button>
									<button type="button" class="help-src small-button" help-value="flex-end">
										<@spring.message code='dashboard.veditor.style.flexAligns.flex-end' />
									</button>
									<button type="button" class="help-src small-button" help-value="center">
										<@spring.message code='dashboard.veditor.style.flexAligns.center' />
									</button>
									<button type="button" class="help-src small-button" help-value="space-between">
										<@spring.message code='dashboard.veditor.style.flexAligns.space-between' />
									</button>
									<button type="button" class="help-src small-button" help-value="space-around">
										<@spring.message code='dashboard.veditor.style.flexAligns.space-around' />
									</button>
									<button type="button" class="help-src small-button" help-value="stretch">
										<@spring.message code='dashboard.veditor.style.flexAligns.stretch' />
									</button>
								</div>
							</div>
						</div>
						<div class="ui-widget-header">
							<@spring.message code='dashboard.veditor.styleSubType.flexItem' />
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.order.desc' />">
									<@spring.message code='dashboard.veditor.style.order' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="order" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.flexGrow.desc' />">
									<@spring.message code='dashboard.veditor.style.flexGrow' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="flex-grow" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.flexShrink.desc' />">
									<@spring.message code='dashboard.veditor.style.flexShrink' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="flex-shrink" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.flexBasis.desc' />">
									<@spring.message code='dashboard.veditor.style.flexBasis' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="flex-basis" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label>
									<@spring.message code='dashboard.veditor.style.alignSelf' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="align-self" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleAlignSelfBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="flex-start">
										<@spring.message code='dashboard.veditor.style.flexAligns.flex-start' />
									</button>
									<button type="button" class="help-src small-button" help-value="flex-end">
										<@spring.message code='dashboard.veditor.style.flexAligns.flex-end' />
									</button>
									<button type="button" class="help-src small-button" help-value="center">
										<@spring.message code='dashboard.veditor.style.flexAligns.center' />
									</button>
									<button type="button" class="help-src small-button" help-value="baseline">
										<@spring.message code='dashboard.veditor.style.flexAligns.baseline' />
									</button>
									<button type="button" class="help-src small-button" help-value="stretch">
										<@spring.message code='dashboard.veditor.style.flexAligns.stretch' />
									</button>
									<button type="button" class="help-src small-button" help-value="auto">
										<@spring.message code='dashboard.veditor.style.flexAligns.auto' />
									</button>
								</div>
							</div>
						</div>
					</div>
					<div id="${pageId}-styleTabsPaneFont" class="style-tab-pane ui-widget ui-widget-content">
						<div class="form-item">
							<div class="form-item-label">
								<label>
									<@spring.message code='dashboard.veditor.style.fontFamily' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="font-family" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label">
								<label title="<@spring.message code='dashboard.veditor.style.fontSize.desc' />">
									<@spring.message code='dashboard.veditor.style.fontSize' />
								</label>
							</div>
							<div class="form-item-value">
								<input type="text" name="font-size" class="ui-widget ui-widget-content" size="100" />
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label><@spring.message code='dashboard.veditor.style.fontWeight' /></label>
							</div>
							<div class="form-item-value">
								<input type="text" name="font-weight" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleFontWeightBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="normal">
										<@spring.message code='dashboard.veditor.style.fontWeight.normal' />
									</button>
									<button type="button" class="help-src small-button" help-value="bold">
										<@spring.message code='dashboard.veditor.style.fontWeight.bold' />
									</button>
								</div>
							</div>
						</div>
						<div class="form-item">
							<div class="form-item-label align-top">
								<label><@spring.message code='dashboard.veditor.style.textAlign' /></label>
							</div>
							<div class="form-item-value">
								<input type="text" name="text-align" class="help-target ui-widget ui-widget-content" size="100" />
								<br>
								<div class="styleTextAlignBtnGroup helper-opt">
									<button type="button" class="help-src small-button" help-value="left">
										<@spring.message code='dashboard.veditor.style.textAlign.left' />
									</button>
									<button type="button" class="help-src small-button" help-value="center">
										<@spring.message code='dashboard.veditor.style.textAlign.center' />
									</button>
									<button type="button" class="help-src small-button" help-value="right">
										<@spring.message code='dashboard.veditor.style.textAlign.right' />
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-item form-item-className">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.style.className' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="className" class="ui-widget ui-widget-content" size="200" />
					</div>
				</div>
				<div class="form-item form-item-syncChartTheme">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.style.syncChartTheme' /></label>
					</div>
					<div class="form-item-value">
						<div id="${pageId}-syncChartTheme">
							<input type="radio" id="${pageId}-syncChartTheme-true" name="syncChartTheme" value="true" checked="checked" />
							<label for="${pageId}-syncChartTheme-true"><@spring.message code='yes' /></label>
							<input type="radio" id="${pageId}-syncChartTheme-false" name="syncChartTheme" value="false" />
							<label for="${pageId}-syncChartTheme-false"><@spring.message code='no' /></label>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-foot form-foot">
				<button type="submit" class="recommended"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class="veditor-chartTheme-panel veditor-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<form action="#" method="POST" class="display-37">
			<div class="panel-head ui-widget-header ui-corner-all">
				<div class="editChartThemeTitle">
					<@spring.message code='dashboard.veditor.chartTheme' />
				</div>
				<div class="editGlobalChartThemeTitle">
					<@spring.message code='dashboard.veditor.globalChartTheme' />
				</div>
			</div>
			<div class="panel-content form-content">
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.chartTheme.color' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="color" class="ui-widget ui-widget-content" size="100" />
						<div class="color-indicator listpallet-indicator ui-widget ui-widget-content ui-corner-all"></div>
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.chartTheme.bgColor' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="backgroundColor" class="ui-widget ui-widget-content" size="100" />
						<div class="bgcolor-indicator listpallet-indicator ui-widget ui-widget-content ui-corner-all"></div>
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.chartTheme.actualBgColor' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="actualBackgroundColor" class="ui-widget ui-widget-content" size="100" />
						<div class="actbgcolor-indicator listpallet-indicator ui-widget ui-widget-content ui-corner-all"></div>
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.chartTheme.graphColors' /></label>
					</div>
					<div class="form-item-value">
						<div class="graphColorsInput"></div>
						<button type="button" class='addGraphColorsBtn small-button ui-button-icon-only'><span class='ui-icon ui-icon-plus'></span><span class='ui-button-icon-space'></span>&nbsp;</button>
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.chartTheme.graphRangeColors' /></label>
					</div>
					<div class="form-item-value">
						<div class="graphRangeColorsInput"></div>
						<button type="button" class='addGraphRangeColorsBtn small-button ui-button-icon-only'><span class='ui-icon ui-icon-plus'></span><span class='ui-button-icon-space'></span>&nbsp;</button>
					</div>
				</div>
			</div>
			<div class="panel-foot form-foot">
				<button type="submit" class="recommended"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class="veditor-dashboardSize-panel veditor-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<form action="#" method="POST" class="display-37">
			<div class="panel-head ui-widget-header ui-corner-all">
				<@spring.message code='dashboard.veditor.dashboardSize' />
			</div>
			<div class="panel-content form-content">
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.dashboardSize.width' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="width" class="ui-widget ui-widget-content" size="100" />
						<span>px</span>
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.dashboardSize.height' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="height" class="ui-widget ui-widget-content" size="100" />
						<span>px</span>
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.dashboardSize.scale' /></label>
					</div>
					<div class="form-item-value">
						<div class="setting-scale-wrapper">
							<input type="radio" id="${pageId}-settingScale-auto" name="scale" value="auto" checked="checked" />
							<label for="${pageId}-settingScale-auto"><@spring.message code='dashboard.veditor.dashboardSize.scale.auto' /></label>
							<input type="radio" id="${pageId}-settingScale-100" name="scale" value="100" />
							<label for="${pageId}-settingScale-100">100%</label>
							<input type="radio" id="${pageId}-settingScale-75" name="scale" value="75" />
							<label for="${pageId}-settingScale-75">75%</label>
							<input type="radio" id="${pageId}-settingScale-50" name="scale" value="50" />
							<label for="${pageId}-settingScale-50">50%</label>
							<input type="radio" id="${pageId}-settingScale-25" name="scale" value="25" />
							<label for="${pageId}-settingScale-25">25%</label>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-foot form-foot">
				<button type="submit" class="recommended"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class="veditor-chartOptions-panel veditor-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<form action="#" method="POST" class="display-block">
			<div class="panel-head ui-widget-header ui-corner-all">
				<div class="chartOptionsTitle">
				<@spring.message code='dashboard.veditor.chartOptions' />
				</div>
				<div class="globalChartOptionsTitle">
				<@spring.message code='dashboard.veditor.globalChartOptions' />
				</div>
			</div>
			<div class="panel-content form-content">
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.chartOptions.options' /></label>
					</div>
					<div class="form-item-value">
						<textarea name="options" class="ui-widget ui-widget-content"></textarea>
					</div>
				</div>
			</div>
			<div class="panel-foot">
				<button type="submit" class="recommended"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
</div>
<#include "../include/page_obj_form.ftl">
<#include "../include/page_obj_tabs.ftl" >
<#include "../include/page_obj_codeEditor.ftl" >
<#include "include/dashboard_form_editor.ftl" >
<#include "include/dashboard_form_res.ftl" >
<script type="text/javascript">
(function(po)
{
	po.readonly = ("${readonly?string('true','false')}" == "true");
	po.isAdd = ("${isAdd?string('true','false')}" == "true");
	po.isUnsavedAdd = (po.isAdd ? true : false);
	po.templates = <@writeJson var=templates />;
	po.dashboardGlobalResUrlPrefix = "${dashboardGlobalResUrlPrefix}";
	
	$.initButtons(po.element());
	po.element().autoCloseSubPanel();
	po.showAfterSave = false;
	po.initAnalysisProject("${((dashboard.analysisProject.id)!'')?js_string?no_esc}", "${((dashboard.analysisProject.name)!'')?js_string?no_esc}");
	
	po.url = function(action)
	{
		return "${contextPath}/dashboard/" + action;
	};
	
	po.showUrl = function(dashboardId, resName)
	{
		resName = (resName == null ? "" : resName);
		
		if(!resName)
		{
			return po.url("show/"+dashboardId+"/");
		}
		else
		{
			var path = $.concatPathArray(["show/"+dashboardId, resName]);
			return po.url(path);
		}
	};
	
	po.getDashboardId = function()
	{
		return  po.element("input[name='id']").val();
	};

	po.checkDashboardUnSaved = function(tip)
	{
		tip = (tip == null ? true : tip);
		
		if(po.isUnsavedAdd)
		{
			if(tip)
				$.tipInfo("<@spring.message code='dashboard.pleaseSaveDashboardFirst' />");
			
			return true;
		}
		
		return false;
	};
	
	po.element("button[id='saveAndShowDashboard']").click(function()
	{
		po.showAfterSave = true;
		po.form().submit();
	});
	
	po.form().validate(
	{
		ignore : "",
		rules :
		{
			"name" : "required"
		},
		messages :
		{
			"name" : "<@spring.message code='validation.required' />"
		},
		submitHandler : function(form)
		{
			$(form).ajaxSubmitJson(
			{
				handleData: function(data)
				{
					var newData = po.getResourceEditorData();
					newData.dashboard = data;
					newData.copySourceId = po.element("#${pageId}-copySourceId").val();
					newData.saveAdd = po.isUnsavedAdd;
					
					//首次复制保存时，需要把templates这里手动加入，不然会丢失
					if(newData.copySourceId && newData.saveAdd)
						newData.dashboard.templates = po.templates;
					
					var templateCount = (newData.dashboard.templates == null ? 0 : newData.dashboard.templates.length);
					for(var i=0; i<newData.resourceIsTemplates.length; i++)
					{
						if(newData.resourceIsTemplates[i] == true || newData.resourceIsTemplates[i] == "true")
							templateCount++;
					}
					
					if(templateCount == 0)
					{
						$.tipInfo("<@spring.message code='dashboard.atLeastOneTemplateRequired' />");
						po.showAfterSave = false;
						
						return false;
					}
					
					return newData;
				},
				success : function(response)
				{
					po.isUnsavedAdd = false;
					
					var dashboard = response.data;
					po.templates = dashboard.templates;
					
					if(po.showAfterSave)
					{
						var editorTabPane = po.getActiveResEditorTabPane();
						var editorData = po.getSingleResourceEditorData(editorTabPane, false);
						
						if(editorData.isTemplate)
							window.open(po.showUrl(dashboard.id, editorData.resourceName), dashboard.id);
						else
							window.open(po.showUrl(dashboard.id), dashboard.id);
					}
					
					var close = po.pageParamCallAfterSave(false);
					if(!close)
						po.refreshResourceListLocal();
				},
				complete: function()
				{
					po.showAfterSave = false;
				}
			});
		},
		errorPlacement : function(error, element)
		{
			error.appendTo(element.closest(".form-item-value"));
		}
	});
	
	po.initDashboardResources();
	po.initDashboardEditors();
	
	po.element(".resize-editor-button-left").click();
	po.newResourceEditorTab(po.element("#${pageId}-initTemplateName").val(), po.element("#${pageId}-initTemplateContent").val(), true);
})
(${pageId});
</script>
</body>
</html>