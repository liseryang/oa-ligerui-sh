<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <title>jQuery ligerUI Demos 导航页</title>
    <link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    </style>
    <script src="${ctx}/javascripts/backcontrol/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>    
    <script src="${ctx}/javascripts/backcontrol/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
    <script src="${ctx}/javascripts/backcontrol/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
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
    .l-link2{text-decoration:underline; color:white;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:20px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;}
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
                     <div title="功能列表" class="l-scroll">
                         <ul id="tree1" style="margin-top:3px;">
                            <li isexpand="false"><span>基础</span><ul> 
                                <li url="demos/base/resizable.htm"><span>改变大小</span></li>
                                <li url="demos/base/drag.htm"><span>拖动</span></li>
                                <li url="demos/base/drag2.htm"><span>拖动2</span></li>
                                <li url="demos/base/dragresizable.htm"><span>拖动并改变大小</span></li>
                                <li url="demos/base/tip.htm"><span>气泡</span></li>
                            </ul></li>
                            <li isexpand="false"><span>弹窗</span><ul>
                                <li url="demos/dialog/dialogAll.htm"><span>弹出框</span></li>
                                <li url="demos/dialog/dialogTarget.htm"><span>载入目标DIV</span></li>
                                <li url="demos/dialog/dialogUrl.htm"><span>窗口</span></li> 
                            </ul></li>
                            <li isexpand="false"><span>菜单</span><ul>
                                <li url="demos/menu/menu.htm"><span>菜单</span></li>
                                <li url="demos/menu/evenmenu.htm"><span>事件支持</span></li>
                                <li url="demos/menu/menubar.htm"><span>菜单条/工具条</span></li> 
                                <li url="demos/menu/mulmenu.htm"><span>多个菜单同时存在</span></li>
                            </ul></li>
                            <li isexpand="false"><span>下拉框</span><ul>
                                <li url="demos/comboBox/comboBoxSelect.htm"><span>select表单</span></li>
                                <li url="demos/comboBox/comboBoxSingle.htm"><span>单选</span></li>
                                <li url="demos/comboBox/comboBoxSingleCheckBox.htm"><span>单选(复选框)</span></li>
                                <li url="demos/comboBox/comboBoxMul.htm"><span>多选</span></li>
                                <li url="demos/comboBox/comboBoxTable.htm"><span>表格</span></li>
                                <li url="demos/comboBox/comboBoxTableMul.htm"><span>表格(多选)</span></li>
                                <li url="demos/comboBox/comboBoxInterface.htm"><span>接口方法</span></li>
                                <li url="demos/comboBox/comboBoxEven.htm"><span>事件支持</span></li>
                                <li url="demos/comboBox/comboBoxCase001.htm"><span>联动效果</span></li>
                                <li url="demos/comboBox/comboBoxTree.htm"><span>下拉框 - 树</span></li>
                                <li url="demos/comboBox/comboBoxGrid.htm"><span>下拉框 - 分页表格</span></li>
                                <li url="demos/comboBox/comboBoxPop.htm"><span>下拉框 - 新页面选取数据</span></li>
                            </ul></li>
                            <li isexpand="false"><span>树</span><ul>
                                <li url="demos/tree/expandable.htm"><span>可扩展支持</span></li> 
                                <li url="demos/tree/treehtml.htm"><span>树(html初使化)</span></li>
                                <li url="demos/tree/treedata.htm"><span>树(data初使化)</span></li>
                                <li url="demos/tree/treeurl.htm"><span>树(url初使化)</span></li>
                                <li url="demos/tree/treeedit.htm"><span>可编辑</span></li>
                                <li url="demos/tree/treeselect.htm"><span>树 选择节点</span></li>
                                <li url="demos/tree/treemanager.htm"><span>接口方法</span></li>
                                <li url="demos/tree/treeeven.htm"><span>丰富的事件支持</span></li>
                                <li url="demos/tree/treecase.htm"><span>模拟异步动态加载节点</span></li>
                                <li url="demos/tree/treemenu.htm"><span>右键菜单</span></li>
                                 <li url="demos/tree/treecheckboxinit.htm"><span>选择初始化</span></li>
                                 <li url="demos/tree/treedbdata.htm"><span>ID PID数据格式</span></li> 
                            </ul></li>
                            <li isexpand="false"><span>表单</span><ul>
                                <li url="demos/form/button.htm"><span>按钮</span></li>
                                <li url="demos/form/checkbox.htm"><span>复选框</span></li>
                                <li url="demos/form/checkbox2.htm"><span>复选框2</span></li>
                                <li url="demos/form/radio.htm"><span>单选框</span></li>
                                 <li url="demos/form/radio2.htm"><span>单选框2</span></li>
                                <li url="demos/form/spinner.htm"><span>调整器</span></li>
                                <li url="demos/form/spinner2.htm"><span>调整器2</span></li>
                                <li url="demos/form/dateEditor.htm"><span>日期</span></li> 
                                <li url="demos/form/textbox.htm"><span>文本框</span></li>
                                 <li url="demos/form/textbox2.htm"><span>文本框2</span></li>
                                <li url="demos/form/form1.htm"><span>综合</span></li>
                                <li url="demos/form/form2.htm"><span>表单验证</span></li>
                            </ul></li>
                            <li isexpand="false"><span>表格</span><ul> 
                                <li isexpand="false"><span>固定列</span>
                                    <ul>
                                       <li url="demos/grid/frozen/frozengrid.htm"><span>固定列</span></li> 
                                       <li url="demos/grid/frozen/treefrozengrid.htm"><span>兼容树</span></li> 
                                       <li url="demos/grid/frozen/mulheaders.htm"><span>兼容多表头</span></li> 
                                    </ul>
                                </li> 
                                 <li isexpand="false"><span>可扩展支持</span>
                                    <ul>
                                       <li url="demos/grid/expandable/method.htm"><span>方法</span></li> 
                                       <li url="demos/grid/expandable/editor.htm"><span>编辑器</span></li>
                                       <li url="demos/grid/expandable/editor_numberbox.htm"><span>编辑器2</span></li>
                                        <li url="demos/grid/expandable/formatter.htm"><span>格式化器</span></li>
                                        <li url="demos/grid/expandable/sorter.htm"><span>自定义排序</span></li>
                                    </ul>
                                </li> 
                                 <li isexpand="false"><span>编辑(行)</span>
                                    <ul> 
                                        <li url="demos/grid/editrow/editrow.htm"><span>编辑</span></li> 
                                        <li url="demos/grid/editrow/editrow2.htm"><span>编辑2</span></li> 
                                    </ul>
                                </li>
                                 <li isexpand="false"><span>编辑(明细)</span>
                                    <ul> 
                                        <li url="demos/grid/editdetail/detail.htm"><span>编辑</span></li> 
                                        <li url="demos/grid/editdetail/detail2.htm"><span>编辑2</span></li> 
                                    </ul>
                                </li>
                                <li isexpand="false"><span>编辑表格</span>
                                    <ul> 
                                        <li url="demos/grid/editgrid/addrow.htm"><span>编辑支持</span></li> 
                                        <li url="demos/grid/editgrid/addrowcombobox.htm"><span>下拉框在弹出框选择</span></li>
                                         <li url="demos/grid/editgrid/addrowwithdata.htm"><span>增加行</span></li>
                                         <li url="demos/grid/editgrid/addrowwithdata2.htm"><span>增加行2</span></li> 
                                         <li url="demos/grid/editgrid/editgrideven.htm"><span>编辑器事件</span></li>
                                         <li url="demos/grid/editgrid/editgridupdatecell.htm"><span>更新单元格</span></li> 
                                         <li url="demos/grid/editgrid/updaterow.htm"><span>更新行</span></li> 
                                         <li url="demos/grid/editgrid/getdata.htm"><span>获取更新数据</span></li> 
                                    </ul>
                                </li> 
                                <li isexpand="false"><span>复选框支持</span>
                                    <ul>
                                        <li url="demos/grid/checkbox/default.htm"><span>带复选框</span></li> 
                                        <li url="demos/grid/checkbox/init.htm"><span>复选框初始化</span></li> 
                                        <li url="demos/grid/checkbox/memory.htm"><span>复选框分页记忆</span></li>
                                    </ul>
                                </li>
                                 <li isexpand="false"><span>表头/列</span>
                                    <ul>
                                        <li url="demos/grid/header/changeheadertext.htm"><span>改变表头文本</span></li> 
                                        <li url="demos/grid/header/columnpercentage.htm"><span>列 宽度百分比</span></li> 
                                        <li url="demos/grid/header/hidecolumn.htm"><span>显示/隐藏 列</span></li>  
                                        <li url="demos/grid/header/setcolumnwidth.htm"><span>列 调整宽度</span></li>  
                                        <li url="demos/grid/mulheader/grid1.htm"><span>多表头1</span></li>
                                        <li url="demos/grid/mulheader/grid2.htm"><span>多表头2</span></li>
                                        <li url="demos/grid/mulheader/grid3.htm"><span>多表头3</span></li> 
                                    </ul>
                                </li>
                                <li isexpand="false"><span>汇总</span>
                                    <ul>
                                        <li url="demos/grid/total/totalgrid.htm"><span>汇总表格</span></li>
                                         <li url="demos/grid/total/totalgrid2.htm"><span>汇总表格2</span></li>
                                        <li url="demos/grid/total/totalgridall.htm"><span>汇总表格3(全部数据)</span></li>
                                         <li url="demos/grid/total/group.htm"><span>带分组</span></li>
                                    </ul>
                                </li>
                                 <li isexpand="false"><span>行事件</span>
                                    <ul>
                                         <li url="demos/grid/rowgrid/allowUnSelectRow.htm"><span>选择行(支持Ctrl)</span></li> 
                                        <li url="demos/grid/rowgrid/checkrowgrid.htm"><span>选择行支持(复选框)</span></li> 
                                        <li url="demos/grid/rowgrid/selectRowButtonOnly.htm"><span>点击复选框才能选择行</span></li> 
                                        <li url="demos/grid/rowgrid/selectrowgrid.htm"><span>选择行支持</span></li>                                                  <li url="demos/grid/rowgrid/dbclickrowgrid.htm"><span>双击行支持</span></li> 
                                        <li url="demos/grid/rowgrid/contextmenurowgrid.htm"><span>右击支持</span></li>   
                                    </ul>
                                </li>
                                <li isexpand="false"><span>分组</span>
                                    <ul>
                                        <li url="demos/grid/groupable/default.htm"><span>默认</span></li>   
                                        <li url="demos/grid/groupable/checkbox.htm"><span>带复选框</span></li>   
                                        <li url="demos/grid/groupable/detail.htm"><span>明细</span></li>  
                                        <li url="demos/grid/groupable/total.htm"><span>汇总</span></li>    
                                    </ul>
                                </li>
                                <li isexpand="false"><span>树</span>
                                    <ul>
                                        <li url="demos/grid/treegrid/treegrid.htm"><span>树 表格</span></li>
                                        <li url="demos/grid/treeeditgrid/addrow.htm"><span>树 可编辑</span></li>
                                        <li url="demos/grid/treeeditgrid/deleterow.htm"><span>树 可编辑2</span></li>
                                        <li url="demos/grid/treeeditgrid/editor.htm"><span>启用编辑器</span></li>
                                    </ul>
                                </li>  
                                <li isexpand="false"><span>基本功能</span>
                                    <ul>
                                       <li url="demos/grid/search/search.htm"><span>查询 表格</span></li>
                                       <li url="demos/grid/base/rownumbers.htm"><span>行序号</span></li>
                                        <li url="demos/grid/base/fullgrid.htm"><span>百分比高度表格</span></li> 
                                        <li url="demos/grid/base/templategrid.htm"><span>自定义单元格</span></li>  
                                        <li url="demos/grid/base/normalgrid.htm"><span>高度宽度设置</span></li>   
                                        <li url="demos/grid/base/delaydata.htm"><span>延时加载</span></li> 
                                    </ul>
                                </li>  
                                <li isexpand="false"><span>明细</span>
                                    <ul>
                                       <li url="demos/grid/detailgrid/default.htm"><span>明细 表格</span></li> 
                                       <li url="demos/grid/detailgrid/height.htm"><span>设置高度</span></li> 
                                    </ul>
                                </li>  
                            </ul></li>
                            <li isexpand="false"><span>Tab</span><ul>
                                <li url="demos/tab/tabHtml.htm"><span>Tab</span></li>
                                <li url="demos/tab/tabEven.htm"><span>事件</span></li>
                                <li url="demos/tab/tabManager.htm"><span>接口</span></li> 
                            </ul></li>
                            <li isexpand="false"><span>面板</span><ul>
                                <li url="demos/accordion/accordion.htm"><span>面板</span></li> 
                            </ul></li>
                            <li isexpand="false"><span>布局</span><ul>
                                <li url="demos/layout/layoutAutoHeight.htm"><span>自动高度</span></li>
                                <li url="demos/layout/layoutAutoHeightAndDiff.htm"><span>高度补差</span></li>
                                <li url="demos/layout/layoutCenterOnly.htm"><span>只显示中间部分</span></li>
                                <li url="demos/layout/layoutFixedHeight.htm"><span>固定高度</span></li>
                                <li url="demos/layout/layoutFullHeight.htm"><span>全屏高度</span></li>
                                <li url="demos/layout/layoutHalfHeight.htm"><span>百分比高度</span></li>
                                <li url="demos/layout/layoutLeftMiddleOnly.htm"><span>只显示左侧和中间</span></li>
                                <li url="demos/layout/layoutLeftWidth.htm"><span>限制左边宽度</span></li>
                                <li url="demos/layout/layoutLeftHide.htm"><span>左边刚开始隐藏</span></li> 
                                <li url="demos/layout/layoutHideToggle.htm"><span>左边右边不允许隐藏</span></li>  
                                <li url="demos/layout/layoutResizeDisable.htm"><span>左边底部不允许调整大小</span></li>  
                            </ul></li>
                         </ul>
                    </div>
                    <div title="应用场景">
                    <div style=" height:7px;"></div>
                         <a class="l-link" href="javascript:f_addTab('listpage','列表页面','demos/case/listpage.htm')">列表页面</a> 
                    </div>    
        </div>
        <div position="center" id="framecenter"> 
            <div tabid="home" title="我的主页" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="welcome.jsp"></iframe>
            </div> 
        </div> 
        <div position="bottom">
            Copyright © 2012 www.ligerui.com
        </div>
    </div> 
        <div style="display:none">
    <!-- 流量统计代码 --> 
    </div>
</body>
</html>
