<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/backcontrol/grid.jsp"%>
<head>
<title>
</title>
	 <script>
		var grid;
        $(function ()
        {   //展现表格
            grid = $("#maingrid").ligerGrid({
                columns: [
                { display: '帐号', name: 'loginName', width: 100 },
                { display: '姓名', name: 'name', width: 100 },
                { display: '密码', name: 'password', width: 100 },
                { display: '邮箱', name: 'email', width: 120 }
                ], 
                dataAction: 'server',
                align:'center', 
                showTitle:'true',
                title:'用户列表',
                usePager:true, page:1,pageSize:10,sortName:'id',sortOrder:'desc', 
                url: "${ctx}/backcontrol/account/user/getJson.htm",
                width: '100%', height: '100%',
                checkbox: true,rownumbers:true,
                toolbar: { 
                }
            });
            $("#pageloading").hide();
            //加载工具条
            LG.loadToolbar(grid, toolbarBtnItemClick,
                  '${ctx}',"增加用户","修改用户","查看用户","删除用户",null,
                  "user/input.htm","user/detail.htm","user/delete.htm",null);
           //展现搜索条件
           $("#formsearch").ligerForm({
             fields:[
                      {display:"帐号",name:"name",newline:false,labelWidth:60,width:120,space:30,type:"text",cssClass:"field"},
                      {display:"姓名",name:"name",newline:false,labelWidth:60,width:120,space:30,type:"text",cssClass:"field"}
                      ],
             appendID: false,
             toJSON: JSON2.stringify
           });
           LG.appendSearchButtons("#formsearch", grid);
        });
     </script>
     </head>   
	<body style="padding:10px;height:100%; text-align:center;">
         <input type="hidden" id="MenuNo" value="user" />
         <%@ include file="/common/backcontrol/list.jsp"%>
	</body>
</html>
