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
         LG.overrideGridLoading(); 
         LG.setFormDefaultBtn(f_cancel,f_save);
         var mainform = $("#mainform");  
         mainform.ligerForm({ 
         inputWidth: 280,
         fields : [
         {name:"id",type:"hidden"},
         {
             display:"帐号",name:"loginName",newline:false,labelWidth:100,width:220,space:30,type:"text",validate:{ required: true},
             group:"用户信息",groupicon:"${ctx}/images/backcontrol/icons/32X32/communication.gif"
         },
         {display:"姓名",name:"name",newline:false,labelWidth:100,width:220,space:30,type:"text",validate:{ required: true}},
         {display:"密码",name:"password",newline:true,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:60}},
         {display:"性别",name:"sex",newline:false,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:60}},
         {display:"创建日期",name:"creteDate",newline:true,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:60}},
         {display:"邮箱",name:"email",newline:false,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:15}},
         {display:"年龄",name:"age",newline:true,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:15}},
         {display:"部门",name:"depId",newline:false,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:10}},
         {display:"地址",name:"address",newline:true,labelWidth:100,width:220,space:30,type:"text",validate:{maxlength:15}}
         ],
		 toJSON:JSON2.stringify
        }); 
        if(isEdit){ 
            mainform.attr("action", "${ctx}/backcontrol/user/save.htm"); 
        }
        if (isAddNew) {
            mainform.attr("action", "${ctx}/backcontrol/user/save.htm");
        }else { 
            LG.loadForm(mainform, { url:"${ctx}/backcontrol/user/getUserJson.htm", id: id , data: { id: id} },f_loaded);
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
                win.LG.closeAndReloadParent(null, "uesr");
            });
            }
            });
        }
        function f_cancel()
        {    
              var win = parent || window;
              win.LG.closeCurrentTab(null);
        }
        
    </script>
</body>
</html>

