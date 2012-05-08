<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ include file="/common/backcontrol/form.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户新增修改页</title>

  </head>
  
  <body style="padding-bottom:55px;"> 
 <div id="tabcontainer" style="margin:3px;">
        <form id="mainform" method="post">
		 
		    <div id="navtab1" style="width: 550px;overflow:hidden; border:1px solid #A3C0E8;margin-left: 5px;list-style: left;">
			<div tabid="home" title="联系方式" lselected="true"  style="height:150px" >
			<iframe frameborder="0" name="showmessage" src="${ctx}/backcontrol/book/form.htm"></iframe>
			</div>
			<div  title="公司" showClose="true">
			<div id="maingrid2" style="margin:10px; height:150px;">
			公司:	<input type="text" name="email"/>
			</div>
			</div>
			<div  title="家庭"  showClose="true">
			<div id="Div1" style="margin:10px;height:150px;">家庭</div>
			</div>
			<div  title="备注" showClose="true">
			<div id="Div2" style="margin:10px;height:150px;">备注</div>
		   </div>
		 </div>
		</form>
   </div>
    <script type="text/javascript"> 
    	var sexData=[{sex:1,text:'男'},{sex:2,text:'女'}];
         var id = '${id}';
         var isAddNew = id == "" || id == "0";
         var isEdit = !isAddNew && !isView;
         LG.overrideGridLoading(); 
         LG.setFormDefaultBtn(f_cancel,f_save);
         var isView = true;
         var mainform = $("#mainform");  
         mainform.ligerForm({ 
         inputWidth: 250,
         fields : [
         {name:"id",type:"hidden"},
         {
             display:"帐号",name:"loginName",newline:false,labelWidth:50,width:200,space:30,type:"text",validate:{required:true},
             group:"用户信息",groupicon:"${ctx}/images/backcontrol/icons/32X32/communication.gif"
         },
         {display:"姓名",name:"name",newline:false,labelWidth:50,width:200,space:30,type:"text",validate:{required:true,maxlength:40}},
         {display:"密码",name:"password",newline:true,labelWidth:50,width:200,space:30,type:"password",validate:{required:true,maxlength:10}},
         { display: "性别", name: 'sex', width: 200,validate:{maxlength:60},newline:false,labelWidth:50,space:30,type : "select"},
         {display:"创建日期",name:"creteDate",newline:true,labelWidth:70,width:180,space:30,type:"date",validate:{required:true}},
         {display:"部门",name:"deptId",newline:false,labelWidth:50,width:200,space:30,type:"select",validate:{maxlength:10}},
         {display:"年龄",name:"age",newline:true,labelWidth:50,width:200,space:30,type:'int'}
         
         ],
		 toJSON:JSON2.stringify
         }
         ); 
        
        
         
         //验证
        $.metadata.setType("attr", "validate");
        LG.validate(mainform, { debug: true });
        
        if(isEdit){ 
            mainform.attr("action", "${ctx}/backcontrol/book/save.htm"); 
        }
        if (isAddNew) {
            mainform.attr("action", "${ctx}/backcontrol/book/save.htm");
        }else { 
            LG.loadForm(mainform, { url:"${ctx}/backcontrol/user/getUserJson.htm", id: id , data: { id: id} },f_loaded);
        }  
        if(!isView) 
        {
            jQuery.metadata.setType("attr", "validate"); 
            LG.validate(mainform);
        } 
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
               }
               else { 
                   win.LG.showSuccess('保存成功', function () { 
                	   win.LG.clossDialog();//关闭
                       //win.LG.closeAndReloadParent(null, "uesr");
                   });
               }
            });
        }
        
        $("#navtab1").ligerTab();
        
        function f_cancel()
        {    
        	var win = parent || window;
        	win.LG.clossDialog();//关闭
            
        }
    </script>
</body>
</html>
