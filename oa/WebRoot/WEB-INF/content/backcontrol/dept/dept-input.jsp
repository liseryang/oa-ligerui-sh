<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
<link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />  
<script src="${ctx}/javascripts/backcontrol/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${ctx}/javascripts/backcontrol/ligerUI/js/ligerui.min.js" type="text/javascript"></script>  
<link href="${ctx}/css/backcontrol/common.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/javascripts/backcontrol/common.js" type="text/javascript"></script>
<script src="${ctx}/javascripts/backcontrol/LG.js" type="text/javascript"></script>
<script src="${ctx}/javascripts/backcontrol/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
<script src="${ctx}/javascripts/backcontrol/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
<script src="${ctx}/javascripts/backcontrol/jquery-validation/messages_cn.js" type="text/javascript"></script>
<script src="${ctx}/javascripts/backcontrol/jquery.form.js" type="text/javascript"></script>
<script src="${ctx}/javascripts/backcontrol/json2.js" type="text/javascript"></script>
<script src="${ctx}/javascripts/backcontrol/validator.js" type="text/javascript"></script>
<script src="${ctx}/javascripts/backcontrol/ligerui.expand.js" type="text/javascript"></script> 
<script src="${ctx}/javascripts/backcontrol/public.js" type="text/javascript"></script>
</head>
  <body style="padding-bottom:31px;"> 
    <div id="tabcontainer" style="margin:3px;">
        <form id="mainform" method="post">
         </form>
    </div>
        <script type="text/javascript"> 
         var id = '${id}';
         var isAddNew = id == "" || id == "0";
         var isEdit = !isAddNew;
         LG.overrideGridLoading(); 
         var mainform = $("#mainform");  
         mainform.ligerForm({ 
         inputWidth: 240,
         fields : [
         {name:"id",type:"hidden"},
         {
             display:"部门名称",name:"name",newline:false,labelWidth:100,width:240,space:30,
             group:"部门信息",groupicon:"${ctx}/images/backcontrol/icons/32X32/communication.gif"
         },
         {display:"上级部门",name:"parentName",newline:true,labelWidth:100,width:240,space:30,type:"text"},
         {display:"部门描述",name:"memo",newline:true,labelWidth:100,width:340,space:30,type:"textarea"}
         ]
        }); 
        if(isEdit){ 
            mainform.attr("action", "${ctx}/backcontrol/dept/save.htm"); 
        }
        if (isAddNew) {
            mainform.attr("action", "${ctx}/backcontrol/dept/save.htm");
        }else { 
            LG.loadForm(mainform, { url:"${ctx}/backcontrol/dept/getDeptJson.htm", id: id , data: { id: id} },f_loaded);
        }  
		
    </script>
</body>
</html>

