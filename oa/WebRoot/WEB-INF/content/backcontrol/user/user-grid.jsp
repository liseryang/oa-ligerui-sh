<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>表格工具条操作</title>
    <%@ include file="/common/backcontrol/grid.jsp"%>
  </head>
 <body style="padding:10px;height:100%; text-align:center;">
	   <input type="hidden" id="MenuNo" value="user" />
	    <%@ include file="/common/backcontrol/list.jsp"%>
		<form id="mainform">
			<div id="maingrid" style="margin: 2px;"></div>
		</form>
		<script>
  		var sexData=[{sex:1,text:'男'},{sex:2,text:'女'}];
  		//验证
        var mainform = $("#mainform");
        $.metadata.setType("attr", "validate");
        LG.validate(mainform, { debug: true });
        //覆盖本页面grid的loading效果
        LG.overrideGridLoading(); 
        
        //增删改方法
        function itemclick(item)
        {
            var editingrow = grid.getEditingRow();
            var selected = grid.getSelected();//获取选中的行数据
            if(editingrow!=null)
            alert("editingrow="+editingrow.name);
            switch (item.text)
            {
                case "增加":
                    if (selected == null)
                    {
                        addNewRow();
                    } else
                    {
                        LG.tip('请先提交或取消修改');
                    }
                    break;
                case "修改":
                    if (selected == null)
                    {
                        beginEdit();
                    } else
                    {
                        LG.tip('请先提交或取消修改');
                    }
                    break;
                case "取消":
                    if (editingrow != null)
                    {
                        grid.cancelEdit(selected); 
                    } else
                    {
                        LG.tip('现在不在编辑状态!');
                    }
                    break;
                case "删除": 
                	if(selected!=null){
                    $.ligerDialog.confirm('确定删除吗?', function (confirm) {
                        if (confirm)
                            f_delete();
                    });
                    break;
            		}else{
            			LG.tip('现在不在编辑状态!');
            		}
                case "保存":
                    if (selected != null)
                    {  
                    	  alert(selected);

                    } else
                    {
                        LG.tip('现在不在编辑状态!');
                    }
                    break;
            }
        }
        
        
	  
		//工具条
	  var toolbarOptions = { 
	          items: [ 
	  			{ text: '保存', click: itemclick, img: "${ctx}/javascripts/backcontrol/ligerUI/skins/icons/save.gif" },
	  			{ line: true },
	              { text: '增加', click: itemclick , img:"${ctx}/javascripts/backcontrol/ligerUI/skins/icons/add.gif"}, 
	              { line:true },
	              { text: '修改', click: itemclick, img: "${ctx}/javascripts/backcontrol/ligerUI/skins/icons/edit.gif" },
	              { line: true },
	              { text: '删除', click: itemclick, img: "${ctx}/javascripts/backcontrol/ligerUI/skins/icons/delete.png"},
	              { line: true },
	              { text: '取消', click: itemclick, img: "${ctx}/javascripts/backcontrol/ligerUI/skins/icons/candle.gif" }
	          ]
	      };
	  //展现表格
     var grid=manager = $("#maingrid").ligerGrid({
          columns: [
			{
				display : '主键',
				name : 'id',
				width : 50,
				type : 'int'
			},
          { display: '帐号', name: 'loginName', width: 100,validate: { required: true },
        	editor : {type : 'text'} },
          { display: '姓名', name: 'name', width: 100 ,validate: { required: true },
        	editor : {type : 'text'}},
          { display: '密码', name: 'password', width: 100,validate: { required: true },
        	editor : {type : 'text'}},
          { display: '性别', name: 'sex', width: 100,
        	editor : {
					type : 'select',
					data : sexData,
					valueColumnName : 'sex'
				},
				render : function(item) {
					if (parseInt(item.sex) == 1)
						return '男';
					return '女';
				}
        	},
          { display: '年龄', name: 'age', width: 120,type : 'int',
				editor : {type : 'int'}},
          { display: '邮箱', name: 'email', width: 120,
			editor : {type : 'text'} },
          { display: '注册时间', name: 'creteDate', width: 100,type:'date',format:'yyyy-MM-dd',
				editor:{type:'date'} },
          { display: '归属部门', name: 'depId', width: 120,
			editor:{type:'select'} }, 
          { display: '表名', name: 'tableName', width: 120 }, 
          { display: '键名', name: 'keyColumns' }
          ], 
          dataAction: 'server',
          align:'center', 
          showTitle:'true',
          title:'用户列表',
          usePager:true, page:1,pageSize:10,sortName:'id',sortOrder:'desc', 
          url: "${ctx}/backcontrol/user/getJson.htm",
          width: '100%', height: '100%',
          checkbox: false,rownumbers:true,enabledEdit: true,
          toolbar: toolbarOptions,clickToEdit:true
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
     
    
    //删除方法
   function f_delete()
    { 
        var selected = grid.getSelected();//获取选中的行数据
        alert("选中行id="+selected.id);
        if (selected)
        {
            if (!selected.id)
            {
                grid.deleteRow(selected);
                return;
            }
            $.ajax({
                url: "${ctx}/backcontrol/user/delete.htm",
                method: 'delete',
                loading:'正在删除中..',
                data: { id: selected.id },
                success: function () { 
                    LG.showSuccess('删除成功');
                    f_reload();
                },
                error: function ()
                {
                    LG.showError("删除失败");
                }
            });
        }
        else
        {
            LG.tip('请选择行!');
        }
    }
    
  	 grid.bind('beforeSubmitEdit', function (e)
		    {
  		 	alert("beforeSubmitEdit");
		        if (!LG.validator.form())
		        {
		        	alert(LG.showInvalid());
		            LG.showInvalid();
		            return false;
		        }
		        return true;
		    });
    
   //刷新
   function f_reload()
   {
       grid.loadData();
   }
   
    function beginEdit()
    {
        var row = grid.getSelectedRow();
        if (!row) { LG.tip('请选择行'); return; }
        grid.beginEdit(row); 
    }
    //添加编辑行
    function addNewRow()
    {
        grid.addEditRow();
    }
  </script>
	</body>
</html>
