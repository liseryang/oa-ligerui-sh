<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/backcontrol/grid.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>表格带树</title>
    <script type="text/javascript">
    
    var manager,gridRole;
    $(function ()
    {
    	manager=gridRole=$("#rolegrid").ligerGrid({
    		 columns:
                 [
                  { display: '主键', name: 'id', width: 150, align: 'left' },
                  { display: '部门名称', name: 'deptName', width: 150, align: 'left' },
                  { display: '部门父ID', name: 'parentId', width: 150, align: 'left' }
                 ], showToggleColBtn: false, width: '99%', 
                 height: 200, rowHeight: 20, fixedCellHeight: true,
             	columnWidth: 100, frozen: false, sortName: 'id', 
             	usePager: false, checkbox: false, rownumbers: true,
             	title:'部门名称', url: "${ctx}/backcontrol/depts/getJson.htm?id=0"
    	
    	});
    	
    	var node=manager.getSelected();
    	$("#maingrid").ligerGrid({
    		 columns:
                 [
                  { display: '主键', name: 'id', width: 150, align: 'left' },
                  { display: '部门名称', name: 'deptName',id:'id1', width: 150, align: 'left' },
                  { display: '部门父ID', name: 'parentId', width: 150, align: 'left',tree:{columnId: 'id1'} }
                 ], showToggleColBtn: false, width: '99%', 
                 height: 200, rowHeight: 20, fixedCellHeight: true,
             	columnWidth: 100, frozen: false, sortName: 'id', 
             	usePager: false, checkbox: false, rownumbers: true,
             	title:'部门名称', url: "${ctx}/backcontrol/depts/getJson.htm?id=0"
    	});
    	
    	
    	
    });
    
    </script>
  </head>
  
 <body style=" overflow:hidden;"> 
   <div id="layout" style="margin:2px; margin-right:3px;">
         <div position="center" id="mainmenu" title="用户角色"> 
              <div id="tabcontainer" style="margin:2px;">
              <div title="部门" tabid="rolelist">
                    <div id="rolegrid" style="margin:2px auto;">
                    </div>
                 </div>
                 <div title="用户"  tabid="userlist">
                     <div id="usergrid" style="margin:2px auto;"></div>
                 </div> 
               </div>
          </div>
          <div position="bottom" title="所属部门角色">
                <div id="maingrid" style="margin:2px auto;"></div>
          </div>
    </div>
  </body>
</html>
