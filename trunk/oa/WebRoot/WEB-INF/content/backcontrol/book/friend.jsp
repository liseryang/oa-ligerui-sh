<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/backcontrol/grid.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>朋友详细页面</title>
	<script type="text/javascript">
	var grid;
    $(function ()
    {   //展现表格
        grid = $("#maingrid").ligerGrid({
            columns: [], 
            dataAction: 'server',
            align:'center', 
            showTitle:'true',
            title:'用户列表',
            usePager:true, page:1,pageSize:10,sortName:'id',sortOrder:'desc', 
            url: "",
            data:"暂无数据",
            width: '100%', height: '100%',
            checkbox: false,rownumbers:true,
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
	              { text: '删除', click: itemclick, img: "${ctx}/javascripts/backcontrol/ligerUI/skins/icons/delete.gif"},
	              { line: true }
	          ]
	      };
    
    //增加的函数
    function itemclick(item){
    	if(item.text=="增加"){
    		
    		$.ligerDialog.open({ url: "${ctx}/backcontrol/book/input.htm?id=", height: 350,width: 730,title:'用户详细信息'});
    	}
    }
    </script>
	</script>
  </head>
  
 <body style="padding:10px;height:100%; text-align:center;">
	   <input type="hidden" id="MenuNo" value="user" />
       <%@ include file="/common/backcontrol/list.jsp"%>
	</body>
</html>
