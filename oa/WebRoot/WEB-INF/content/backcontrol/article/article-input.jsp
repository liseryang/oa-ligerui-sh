<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/backcontrol/form.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <title></title>
	<script charset="utf-8" src="${ctx}/javascripts/kindeditor-v4.0.6/kindeditor-min.js"></script>
    <script charset="utf-8" src="${ctx}/javascripts/kindeditor-v4.0.6/lang/zh_CN.js"></script>
    <script charset="utf-8" src="${ctx}/javascripts/kindeditor-v4.0.6/plugins/code/prettify.js"></script>
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
         {display:"所属栏目",name:"channelId",newline:false,labelWidth:100,width:220,space:10,type: "select",comboboxName: "channelId",
        	 options: {valueFieldID:"channelId",textField:"title",valueField: "id",slide: false,
                 selectBoxWidth: 600,
                 selectBoxHeight: 240,
        		 grid: getGridOptions(false)
        		 }},
         {display:"新闻标题",name:"title",newline:true,labelWidth:100,width:700,space:30,type:"text",validate:{ required: true}},
         {display:"作者",name:"author",newline:true,labelWidth:100,width:150,space:30,type:"text",validate:{maxlength:15}},
         {display:"发布人",name:"releaser",newline:false,labelWidth:100,width:100,space:30,type:"text",validate:{maxlength:15}},
         {display:"创建时间",name:"creteDate",newline:true,labelWidth:100,width:150,space:30,type:"date",validate:{maxlength:15}},
         {display:"状态",name:"status",newline:false,labelWidth:100,width:100,space:30,type: "select",comboboxName: "value",
        	 options: {valueFieldID:"status",textField:"text",valueField: "value", selectBoxHeight: 50,data: statusData}
         },
         {display:"顺序",name:"v",newline:false,labelWidth:50,width:50,space:30,type:"text",validate:{maxlength:15}},
         {display:"内容",name:"content",newline:true,labelWidth:100,width:700,height:400,space:30,type:"textarea",validate:{maxlength:15}}
         
         ],
		 toJSON:JSON2.stringify
        }); 
        if(isEdit){ 
            mainform.attr("action", "${ctx}/backcontrol/article/save.htm"); 
        }
        if (isAddNew) {
            mainform.attr("action", "${ctx}/backcontrol/article/save.htm");
        }else { 
            LG.loadForm(mainform, { url:"${ctx}/backcontrol/article/getChannel.htm", id: id , data: { id: id} },f_loaded);
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
        
        
        function getGridOptions(checkbox)
        {
            var options = {
       		 columns: [
   	                { display: '栏目名称', name: 'title', width: 200 },
   	                { display: '栏目描述', name: 'depict', width: 200 },
   	                { display: '创建时间', name: 'creteDate', width: 150 },
   	                { display: '栏目类型', name: 'type', width: 150 },
   	                { display: '创建人', name: 'creater', width: 150 },
   	                { display: '状态', name: 'status', width: 100, render: function (rowdata, rowindex, value){
   	                	if(value == 1){
   	                		return "激活";
   	                	}else{
   	                		return "未激活";
   	                	}
   	                }}
   	                ], 
   	                dataAction: 'server',
   	                align:'center', 
   	                showTitle:'true',
   	             	//switchPageSizeApplyComboBox: false,
   	                title:'栏目列表',
   	                usePager:true, page:1,pageSize:10,sortName:'id',sortOrder:'desc', 
   	                url: "${ctx}/backcontrol/channel/getJson.htm",
   	                width: '100%', height: '100%',
   	                rownumbers:true,
                checkbox: checkbox
            };
            return options;
        }
    </script>
   <script type="text/javascript">
	    var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="content"]', {
				themeType : 'simple',
				cssPath : '${ctx}/javascripts/kindeditor-4.0.1/plugins/code/prettify.css',
				uploadJson : '${ctx}/javascripts/kindeditor-4.0.1/jsp/upload_json.jsp',
				fileManagerJson : '${ctx}/javascripts/kindeditor-4.0.1/jsp/file_manager_json.jsp?dir=article',
				allowFileManager : true,
				items : [
				         'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
				         'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
				         'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
				         'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
				         'formatblock', 'fontname', '|', 'forecolor', 'hilitecolor', 'bold',
				         'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
				         'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'map', 'code', 'pagebreak',
				         'link', 'unlink', '|', 'about'
				 ],
				afterUpload : function(data) {
					$("#indexImg").val(data);
				},
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['mainForm'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['mainForm'].submit();
					});
				} 
			});
			prettyPrint();
		});
		function check(){
			editor.sync();
		}
		</script>
</body>
</html>

