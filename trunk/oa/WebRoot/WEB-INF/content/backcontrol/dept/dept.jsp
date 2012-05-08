<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人通讯录</title>
    <link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
      <link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />  
      <script src="${ctx}/javascripts/backcontrol/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
      <script src="${ctx}/javascripts/backcontrol/ligerUI/js/ligerui.min.js" type="text/javascript"></script>  
      <script src="${ctx}/javascripts/backcontrol/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
	  <link href="${ctx}/css/backcontrol/common.css" rel="stylesheet" type="text/css" />
	  <link href="${ctx}/css/backcontrol/index.css" rel="stylesheet" type="text/css" />
	  <script src="${ctx}/javascripts/backcontrol/common.js" type="text/javascript"></script>
	  <script src="${ctx}/javascripts/backcontrol/LG.js" type="text/javascript"></script>
	  <script src="${ctx}/javascripts/backcontrol/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
	  <script src="${ctx}/javascripts/backcontrol/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
	  <script src="${ctx}/javascripts/backcontrol/jquery-validation/messages_cn.js" type="text/javascript"></script>
      <script src="${ctx}/javascripts/backcontrol/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
      
      <script type="text/javascript">
            var tab = null;
            var accordion = null;
            var tree = null;
            $(function ()
            {
                //布局
                $("#layout1").ligerLayout({ leftWidth: 220, height: '100%', onHeightChanged: f_heightChanged });
                var height = $(".l-layout-center").height();
                //Tab
                $("#framecenter").ligerTab({ height: height });
                //面板
                $("#accordion1").ligerAccordion({ height: height - 24, speed: null });
                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
                
                //树
                $("#tree1").ligerTree({
                    checkbox: false,
                    slide: false,
                    nodeWidth: 120,
                    //url:'${ctx}/backcontrol/dept/getTreeJson.htm',
                    url:'${ctx}/common/tree.json',
                    //attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {   
                        //if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid);
                        }
                        /*
                       if ($(">ul >li", tab.tab.links).length < 4)
                        {
                            var currentTabid = $("li.l-selected", tab.tab.links).attr("tabid"); //当前选择的tabid
                            if (currentTabid == "home"){
                            	tab.overrideTabItem(currentTabid, 
                                		{ tabid: tabid, url: node.data.url, text: node.data.text+"列表" });//覆盖指定tab
                            	return;
                            }else{
                            	var datas=node.data.text+"列表";
                            tab.overrideTabItem(currentTabid, 
                            		{ tabid: tabid, url: node.data.url, text: datas});//覆盖指定tab
                            return;
                            }
                        }
                        */
                        f_addTab(tabid, node.data.text,"${ctx}/backcontrol/dept/input.htm?id="+node.data.id);
                    }
                });
                tab = $("#framecenter").ligerGetTabManager();
                accordion = $("#accordion1").ligerGetAccordionManager();
                tree = $("#tree1").ligerGetTreeManager();
                $("#pageloading").hide();

            });
            function f_heightChanged(options)
            {
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid,text, url)
            { 
                tab.addTabItem({ tabid : tabid,text: text, url: url });
            } 
            
            //进行树的刷新
            function refresh(){
            	 //tree.clear();//先清空数据
                 tree.loadData(null,"${ctx}/backcontrol/book/list.htm",null);//重新加载数据            	
            }
            //全部展开事件
             function  expandAll(){
            	 tree.expandAll();
            }
             //全部折叠事件
             function  collapseAll(){
            	 tree.collapseAll();
            }
     </script> 
     
     <style>
     		#x-btn-text-icon{		
     		background-position: 0 center;
    background-repeat: no-repeat;
    height: 16px;
    padding-left: 18px;}
     </style>
  </head>
  
 <body style="padding:0px;">  
<div id="pageloading"></div> 
  <div id="layout1" style="width:100%">
        <div position="left"  title="部门管理"> 
                <ul id="tree1" style="margin-top:3px;">
              </ul>
        </div>
        <div position="center" id="framecenter"> 
            <div tabid="home" title="全部" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="${ctx}/backcontrol/dept/input.htm?id="></iframe>
            </div> 
        </div> 
        <!-- 不现实底部信息 
        <div position="bottom">
        </div>
        -->
    </div> 
        <div style="display:none">
    <!-- 流量统计代码 --> 
    </div>
</body>
</html>

</html>
