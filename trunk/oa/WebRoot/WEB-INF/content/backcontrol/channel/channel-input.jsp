<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/backcontrol/form.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <title></title>
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
         var statusData = [{ value: 1, text: '激活' }, { value: 0, text: '未激活'}];
         LG.overrideGridLoading(); 
         LG.setFormDefaultBtn(f_cancel,f_save);
         var mainform = $("#mainform");  
         mainform.ligerForm({ 
         inputWidth: 280,
         fields : [
         {name:"id",type:"hidden"},
         {display:"栏目名称",name:"title",newline:false,labelWidth:100,width:220,space:10,type:"text",validate:{ required: true}},
         {display:"栏目描述",name:"depict",newline:false,labelWidth:100,width:220,space:30,type:"text",validate:{ required: true}},
         {display:"栏目类型",name:"type",newline:false,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:15}},
         {display:"创建人",name:"creater",newline:true,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:15}},
         {display:"状态",name:"status",newline:false,labelWidth:100,width:220,space:30,type: "select",comboboxName: "value",
        	 options: {valueFieldID:"status",textField:"text",valueField: "value", selectBoxHeight: 50,data: statusData}
         }
         ],
		 toJSON:JSON2.stringify
        }); 
        if(isEdit){ 
            mainform.attr("action", "${ctx}/backcontrol/channel/save.htm"); 
        }
        if (isAddNew) {
            mainform.attr("action", "${ctx}/backcontrol/channel/save.htm");
        }else { 
            LG.loadForm(mainform, { url:"${ctx}/backcontrol/channel/getChannel.htm", id: id , data: { id: id} },f_loaded);
        }  
        //表达验证
        $.metadata.setType("attr", "validate");
        LG.validate(mainform, { debug: true });
		function f_loaded()
        {   
            LG.hideLoading();
        }
        function f_save()
        {   
            var win = parent || window;
            LG.submitForm(mainform, function (data) {
            var win = parent || window;
            if (data.IsError) {  
                win.LG.showError('错误:' + data.Message);
            }else { 
                win.LG.showSuccess('保存成功', function () { 
                win.LG.closeAndReloadParent(null, "channel");
            });
                win.LG.clossDialog();
            }
            });
        }
        function f_cancel()
        {    
              var win = parent || window;
              win.LG.clossDialog();
        }
        
    </script>
</body>
</html>

