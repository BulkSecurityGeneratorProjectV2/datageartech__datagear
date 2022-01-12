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
				<button type="submit"><@spring.message code='confirm' /></button>
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
				<button type="submit"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class="veditor-content-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<form action="#" method="POST">
			<div class="panel-head ui-widget-header ui-corner-all">
				<@spring.message code='dashboard.veditor.editContent' />
			</div>
			<div class="panel-content">
				<div class="content-item">
					<div class="label-wrapper">
						<label><@spring.message code='dashboard.veditor.editContent.content' /></label>
					</div>
					<input type="text" name="content" value="" class="ui-widget ui-widget-content" />
				</div>
			</div>
			<div class="panel-foot">
				<button type="submit"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class="veditor-style-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<form action="#" method="POST" class="display-46">
			<div class="panel-head ui-widget-header ui-corner-all">
				<@spring.message code='dashboard.veditor.editStyle' />
			</div>
			<div class="panel-content form-content">
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editStyle.color' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="color" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editStyle.bgColor' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="background-color" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editStyle.bgImage' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="background-image" class="ui-widget ui-widget-content" size="200" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editStyle.fontSize' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="font-size" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editStyle.textAlign' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="text-align" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editStyle.syncChartTheme' /></label>
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
				<button type="submit"><@spring.message code='confirm' /></button>
			</div>
		</form>
	</div>
	<div class="veditor-chartTheme-panel auto-close-panel minor-panel ui-widget ui-widget-content ui-corner-all ui-widget-shadow ui-front">
		<form action="#" method="POST" class="display-46">
			<div class="panel-head ui-widget-header ui-corner-all">
				<@spring.message code='dashboard.veditor.editChartTheme' />
			</div>
			<div class="panel-content form-content">
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editChartTheme.color' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="color" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editChartTheme.bgColor' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="backgroundColor" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editChartTheme.actualBgColor' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="actualBackgroundColor" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editChartTheme.graphColors' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="graphColors" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
				<div class="form-item">
					<div class="form-item-label">
						<label><@spring.message code='dashboard.veditor.editChartTheme.graphRangeColors' /></label>
					</div>
					<div class="form-item-value">
						<input type="text" name="graphRangeColors" class="ui-widget ui-widget-content" size="100" />
					</div>
				</div>
			</div>
			<div class="panel-foot form-foot">
				<button type="submit"><@spring.message code='confirm' /></button>
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
	po.element("#${pageId}-syncChartTheme").checkboxradiogroup();
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
		return po.url("show/"+dashboardId+"/" + resName);
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
						window.open(po.showUrl(dashboard.id), dashboard.id);
					
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