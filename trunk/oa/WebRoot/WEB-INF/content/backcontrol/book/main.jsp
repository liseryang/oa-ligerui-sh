<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/backcontrol/grid.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>同事组列表操作页面</title>
    <script type="text/javascript">
    var grid;
    $(function ()
    {   //展现表格
        grid = $("#maingrid").ligerGrid({
            columns: [
            { display: '帐号', name: 'loginName', width: 100 },
            { display: '姓名', name: 'name', width: 100 },
            { display: '密码', name: 'password', width: 100 },
            { display: '性别', name: 'sex', width: 100 },
            { display: '年龄', name: 'age', width: 120 },
            { display: '邮箱', name: 'email', width: 120 },
            { display: '注册时间', name: 'creteDate', width: 100 },
            { display: '归属部门', name: 'depId', width: 120 }, 
            { display: '表名', name: 'tableName', width: 120 }, 
            { display: '键名', name: 'keyColumns' }
            ], 
            dataAction: 'server',
            align:'center', 
            showTitle:'true',
            title:'用户列表',
            usePager:true, page:1,pageSize:10,sortName:'id',sortOrder:'desc', 
            url: "${ctx}/backcontrol/book/getJson.htm",
            width: '100%', height: '100%',
            checkbox: true,rownumbers:true,
            toolbar:toolbarOptions
        });
        $("#pageloading").hide();
    	
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
    
    //加载工具条
	  var toolbarOptions = { 
	          items: [ 
	              { text: '增加', click: itemclick , img:"${ctx}/javascripts/backcontrol/ligerUI/skins/icons/add.gif"}, 
	              { line:true },
	              { text: '修改', click: itemclick , img:"${ctx}/javascripts/backcontrol/ligerUI/skins/icons/modify.gif"}, 
	              { line:true },
	              { text: '删除', click: itemclick, img: "${ctx}/javascripts/backcontrol/ligerUI/skins/icons/delete.gif"},
	              { line: true }
	          ]
	      };
    
    //增加的函数
    function itemclick(item){
    	var selected = grid.getSelected();//获取选中的行数据
    	if(item.text=="增加"){
            //弹出窗口
            LG.toAddDialog("${ctx}/backcontrol/book/input.htm?id=",400,600,grid,'用户详细信');
    	}
    	
    	if(item.text=="修改"){
    		if(selected!=null){
	    		//弹出窗口
	            LG.toAddDialog("${ctx}/backcontrol/book/input.htm?id="+selected.id,400,600,grid,'用户详细信');
    		}else{
    			LG.tip("请选择要修改的行！");
    		}
    	}
    	
    	if(item.text=="删除"){
    		if(selected!=null){
    			$.ligerDialog.confirm("确定要删除吗?",function(confirm){
    				if(confirm){
    					LG.f_delete(selected,"${ctx}/backcontrol/book/delete.htm");
    				}
    			});
    		}else{
    			LG.tip("请选择要删除的行！");
    		}
    	}
    }
    </script>
  </head>
  
  <body style="padding:10px;height:100%; text-align:center;">
	   <input type="hidden" id="MenuNo" value="user" />
       <%@ include file="/common/backcontrol/list.jsp"%>
	</body>
</html>
