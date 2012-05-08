
//批量删除
function f_delete(url,selecteds) {
  var ids=initIds(selecteds);
  if (selecteds) {
  $.ajax({
        type: "POST",
		url : url,
		data: { ids: ids},
		success : function(data){
		    LG.tip(data.Message);
		}
	});
      f_reload();
  }
  else {
      LG.tip('请选择行!');
  }
         
}
//刷新当前表格页
function f_reload() {
     grid.loadData();
}

//工具条点击事件触发
function toolbarBtnItemClick(item) {
  var selecteds = grid.getSelecteds();
  var selected = grid.getSelected();
  switch (item.id) {
      case "add":
          top.f_addTab(null, item.tabName, item.url+"?id=");
          break;
      case "modify":
          top.f_addTab(null, item.tabName, item.url+"?id="+selected.id);
          break;
      case "detail":
          top.f_addTab(null, item.tabName, item.url+"?id="+selected.id);
          break;
      case "delete":
          jQuery.ligerDialog.confirm("确定"+item.tabName+"吗？", function (confirm) {
          if (confirm)
              f_delete(item.url,selecteds);
           });
          break;
    }
}

//初始化批量删除id集合
function initIds(selecteds){
	var i,ids="",id;
	for(i=0;i<selecteds.length;i++){
		id = selecteds[i].id;
	    ids = ids+","+id;
	}
	return ids.substring(1,ids.length);
}

//加载隐藏数据加载提示
function f_loaded()
{   
    LG.hideLoading();
}
//表单提交验证
function f_save()
{   
    var win = parent || window;
    LG.submitForm(mainform, function (data) {
    var win = parent || window;
    if (data.IsError) {  
        win.LG.showError('错误:' + data.Message);
    }else { 
        win.LG.showSuccess('保存成功', function () { 
        win.LG.closeAndReloadParent(null);//指定null关闭当前页刷新父页面
    });
    }
    });
}

//表单取消关闭
function f_cancel()
{    
      var win = parent || window;
      win.LG.closeCurrentTab(null);//指定null关闭当前页
}
