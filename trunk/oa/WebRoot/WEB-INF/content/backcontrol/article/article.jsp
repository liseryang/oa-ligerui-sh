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
		var dialog;
        $(function ()
        {   //展现表格
            grid = $("#maingrid").ligerGrid({
                columns: [
                { display: '标题', name: 'title', width: 250 },
                { display: '所述栏目', name: 'channelName', width: 150 },
                { display: '作者', name: 'author', width: 150 },
                { display: '发布人', name: 'releaser', width: 150 },
                { display: '创建日期', name: 'creteDate', width: 150 },
                { display: '状态', name: 'status', width: 100, render: function (rowdata, rowindex, value){
                	if(value == 1){
                		return "激活";
                	}else{
                		return "未激活";
                	}
                }},
                { display: '管理',name: 'id', width: 120 , render: function (rowdata, rowindex, value)
                    {
                    var h = "";                   
                    h += "<a href='javascript:edit(" + value + ")'>修改</a> ";
                    h += "<a href='javascript:deleteRow(" + value + ")'>删除</a> ";                   
                    return h;
                }},
                ], 
                dataAction: 'server',
                align:'center', 
                showTitle:'true',
                title:'用户列表',
                usePager:true, page:1,pageSize:10,sortName:'id',sortOrder:'desc', 
                url: "${ctx}/backcontrol/article/getJson.htm",
                width: '100%', height: '100%',
                checkbox: true,rownumbers:true,
                toolbar: { 
                }
            });
            $("#pageloading").hide();
            //加载工具条
            var items =[{
            	//click: toolbarBtnItemClick,
                text: '增加',
                icon: 'add',
                id:'add',
                img:'${ctx}/javascripts/backcontrol/ligerUI/skins/icons/add.gif',
                tabName:'栏目增加',
                //url:'${ctx}/backcontrol/channel/input.htm'
                click: add
            },{
            	click: toolbarBtnItemClick,
                text: '删除',
                icon: 'delete',
                id:'delete',
                img:'${ctx}/javascripts/backcontrol/ligerUI/skins/icons/delete.gif',
                tabName:'删除',
                url:'${ctx}/backcontrol/channel/delete.htm'
            }];
             grid.toolbarManager.set('items', items);
          //  LG.loadToolbar(grid, toolbarBtnItemClick,
          //        '${ctx}',"增加用户","修改用户","查看用户","删除用户",
          //        null,"user/input.htm","user/detail.htm","user/delete.htm");
           //展现搜索条件
           $("#formsearch").ligerForm({
             fields:[
                      {display:"栏目名称",name:"name",newline:false,labelWidth:60,width:150,space:50,type:"text",cssClass:"field"},
                      {display:"创建时间",name:"name",newline:false,labelWidth:60,width:150,space:50,type:"date"},
                      {display:"栏目类型",name:"name",newline:false,labelWidth:60,width:150,space:50, type: "select", comboboxName: "CompanyName", options: { valueFieldID: "SupplierID" } },
                      {display:"创建人",name:"name",newline:true,labelWidth:60,width:150,space:50,type:"text",cssClass:"field"},
                      {display:"状态",name:"name",newline:false,labelWidth:60,width:150,space:50,type:"text",cssClass:"field"},
                      {display:"描述",name:"name",newline:false,labelWidth:60,width:150,space:50,type:"text",cssClass:"field"}
                      ],
             appendID: false,
             toJSON: JSON2.stringify
           });
           LG.appendSearchButtons("#formsearch", grid);
       });
        
        function add(){
        	LG.toAddDialog("${ctx}/backcontrol/article/input.htm?id=",500,900,grid,"添加新闻");
        }
       
        function edit(id){
        	LG.toAddDialog("${ctx}/backcontrol/article/input.htm?id="+id,500,900,grid,"修改新闻");
        }
       
        function deleteRow(id)
        {
            if (confirm('确定删除?'))
            {
	           	  $.ajax({
	           	        type: "POST",
	           			url : "${ctx}/backcontrol/channel/delete.htm",
	           			data: { ids: id},
	           			success : function(data){
	           			    LG.tip(data.Message);
	           			}
	           		});
	           	  grid.loadData();
            }
        }
     </script>
     </head>   
	<body style="padding:10px;height:100%; text-align:center;">
         <input type="hidden" id="MenuNo" value="user" />
         <%@ include file="/common/backcontrol/list.jsp"%>
	</body>
</html>
