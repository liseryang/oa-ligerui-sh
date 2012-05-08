<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <title>jQuery ligerUI Demos 导航页</title>

	  <link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
      <link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />  
      <script src="${ctx}/javascripts/backcontrol/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
      <script src="${ctx}/javascripts/backcontrol/ligerUI/js/ligerui.min.js" type="text/javascript"></script>  
      <script src="${ctx}/javascripts/backcontrol/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
      <script src="${ctx}/javascripts/backcontrol/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
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
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%', onHeightChanged: f_heightChanged });

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
                    attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid);
                        }
                        /*if ($(">ul >li", tab.tab.links).length >= 4)
                        {
                            var currentTabid = $("li.l-selected", tab.tab.links).attr("tabid"); //当前选择的tabid
                            if (currentTabid == "home") return;
                            tab.overrideTabItem(currentTabid, { tabid: tabid, url: node.data.url, text: node.data.text });
                            return;
                        }*/
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
                });
                
                //树2
                $("#tree2").ligerTree({
                    checkbox: false,
                    slide: false,
                    nodeWidth: 120,
                    attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        }
                        /*if ($(">ul >li", tab.tab.links).length >= 4)
                        {
                            var currentTabid = $("li.l-selected", tab.tab.links).attr("tabid"); //当前选择的tabid
                            if (currentTabid == "home") return;
                            tab.overrideTabItem(currentTabid, { tabid: tabid, url: node.data.url, text: node.data.text });
                            return;
                        }*/
                        f_addTab(tabid, node.data.text, node.data.url);
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
             
            
     </script> 
	<style type="text/css"> 
    body,html{height:100%;}
    body{ padding:0px; margin:0;   overflow:hidden;}  
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('${ctx}/images/backcontrol/loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:31px; line-height:31px; background:url('${ctx}/images/backcontrol/top.jpg') repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:26px;background:url('${ctx}/images/backcontrol/topicon.gif') no-repeat 10px 5px;}
    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:underline} 

 </style>
</head>
<body style="padding:0px;">  
<div id="pageloading"></div> 
  <div id="layout1" style="width:100%">
        <div position="top" style="background:#102A49; color:White; ">
            <div style="margin-top:10px; margin-left:10px">
            
                    <span>jQuery ligerUI 中文官方网站</span> 
           <a href="index.htm" class="l-link2">本地版本</a>
            <a href="index.aspx" class="l-link2">服务器版本</a>
            </div>
     
        </div>
        <div position="left"  title="主要菜单" id="accordion1"> 
                     <div title="系统管理" class="l-scroll">
                         <ul id="tree1" style="margin-top:3px;">
                            <li isexpand="false"><span>用户管理</span><ul> 
                                <li url="${ctx}/backcontrol/account/user/list.htm"><span>用户列表</span></li>
                            </ul></li>
                             <li isexpand="false"><span>部门管理</span><ul> 
                                <li url="${ctx}/backcontrol/dept/list.htm"><span>部门列表</span></li>
                            </ul></li>
                            <li isexpand="false"><span>角色管理</span><ul>
                                <li url="demos/dialog/dialogAll.htm"><span>角色列表</span></li>
                            </ul></li>
                            <li isexpand="false"><span>权限管理</span><ul>
                                <li url="demos/menu/menu.htm"><span>权限列表</span></li>
                            </ul></li>
                            <li isexpand="false"><span>信息管理</span><ul> 
                                <li url="${ctx}/backcontrol/channel/list.htm"><span>栏目管理</span></li>
                                <li url="${ctx}/backcontrol/article/list.htm"><span>新闻管理</span></li>
                            </ul></li>
                            <li isexpand="false"><span>菜单管理</span>
                              <ul>
                                <li url="demos/comboBox/comboBoxSelect.htm"><span>菜单列表</span></li>
                              </ul>
                            </li>
                             <li isexpand="false"><span>表格操作</span>
                              <ul>
                              	<li url="${ctx}/backcontrol/user/gridedit.htm"><span>单元格编辑模式例子</span></li>
                                <li url="${ctx}/backcontrol/user/grid.htm"><span>表格带工具条</span></li>
                                <li url="${ctx}/backcontrol/depts/list.htm"><span>表格带树</span></li>
                              </ul>
                            </li>
                 </ul>
             </div>
             <div title="通讯录管理" class="l-scroll">
                <ul id="tree2" style="margin-top:3px;">
               	<li isexpand="false"><span>通讯簿</span>
                   <ul>
                      <li url="${ctx}/backcontrol/book/list.htm"><span>个人通讯簿</span></li>
                      <li url="demos/comboBox/comboBoxSelect.htm"><span>共享通讯录</span></li>
                      <li url="demos/comboBox/comboBoxSelect.htm"><span>公共通讯簿</span></li>
                    </ul>
              </li>
              </ul>
       		 </div>
        </div>
        <div position="center" id="framecenter"> 
            <div tabid="home" title="我的主页" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="${ctx}/backcontrol/welcome.htm"></iframe>
            </div> 
        </div> 
        <div position="bottom">
          
        </div>
    </div> 
        <div style="display:none">
    <!-- 流量统计代码 --> 
    </div>
</body>
</html>
