<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/backcontrol/grid.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>个人通讯录</title>
      
      <script type="text/javascript">
            var tab = null;
            var accordion = null;
            var tree = null;
        	var menu=null;
        	var actionNodeId;
        	//右键实现函数
        	function itemclick(item,i){
        		var node=tree.getSelected();
        		//增加
        		if(i==0){
        			//判断是否选择节点
        			if(node){
        			 $.ligerDialog.prompt('增加内容', '初始化值', true, function (yes, value)
                             {
                                 if (yes){
                                	 $.ligerDialog.open({ url: "${ctx}/backcontrol/depts/saves.htm?pId="+node.data.id+"&deptName="+value,
                                		 buttons:[{text:'关闭',onclick:function(item,dialog){  refresh(dialog);}}]});
                                 }
                                 
                             });
        		}else{
        			alert("请选择节点");
        		}
        		}
        		
        		//修改
        		if(i==1){
        			if(node){
        			$.ligerDialog.prompt('修改内容',node.data.deptName,true,function(yes,value){
        				if(yes){
        					$.ligerDialog.open({ url: "${ctx}/backcontrol/depts/saves.htm?id="+node.data.id+"&deptName="+value+"&pId="+node.data.parentId, height: 300,
        						width: null,title:'修改', buttons: [ { text: '关闭', 
        							onclick: function (item, dialog) { refresh(dialog); }
        					   }] });
        				}
        			});
        			}else{
        				alert("请选择节点");
        			}
        		}
        		//删除
        		if(i==2){
        			if(node){
        				//manager.remove(node.targer);
                             $.ligerDialog.confirm('确定要删除'+node.data.deptName+"?",function(yes){
             					if(yes){
             					$.ligerDialog.open({ url: "${ctx}/backcontrol/depts/delete.htm?id="+node.data.id,
             							 buttons:[{text:'关闭',onclick:function(item,dialog){ refresh(dialog);}}]});
             					}else{
             						dialog.close();
             					}
             				});
        			}else{
        				alert('请选择节点');
        			}
        		}
        	}
        	
        	
        	
            $(function ()
            {
                //布局
                $("#layout1").ligerLayout({ leftWidth: 150, height: '100%', onHeightChanged: f_heightChanged });
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
                
                //右键功能
                menu=$.ligerMenu({top: 100, left: 100, width: 120, items:
						[
						 {text:'增加',click:itemclick,icon:'add'},
						 {text:'修改',click:itemclick,icon:'modify'},
						 {line:true},
						 {text:'删除',click:itemclick,icon:'delete'}
						]
					});
                //树
              $("#tree1").ligerTree({
                	url : '${ctx}/backcontrol/depts/getJsonTree.htm?pId=0',
                	textFieldName :"deptName",
        			idFieldName:"id",
                    parentIDFieldName:"parentId",
                    checkbox: false,
                    slide: false,
                    nodeWidth: 120,
                  //  attribute: ['nodename', 'url'],
                    onSelect: onSelect,
                    onContextmenu:function(node,e){
            			actionNodeId=node.data.text;
            				menu.show({
            					top:e.pageY,
            					left:e.pageX
            				});
            				return false;
            		}
                });

                tab = $("#framecenter").ligerGetTabManager();
                accordion = $("#accordion1").ligerGetAccordionManager();
                tree = $("#tree1").ligerGetTreeManager();
                $("#pageloading").hide();

            });
            	
            
         	 //这里的异步加载逻辑取决于你的数据库设计，把选中节点的id传回去，传回子节点json然后加载  
            function onSelect(node) 
        	{
        		if (node.data.id == "0") {
        			if (node.data.children && node.data.children.length == 0) {
        				tree.loadData(node.target, "${ctx}/backcontrol/depts/getJsonTree.htm?pId=0"); //加载第一级栏目            
        			}
        		} else {
        			if (node.data.children == undefined) {
        				tree.loadData(node.target, "${ctx}/backcontrol/depts/getJsonTree.htm?pId="
        						+ node.data.id); //加载下一级 
        			}
        		}
        		
        		//判断新增一个新tab
       			//if (!node.data.url) return;
                	var tabid = $(node.target).attr("tabid");
                if (!tabid)
                {
                    //tabid = new Date().getTime();
                    tabid=node.data.deptName;
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
                
                f_addTab(tabid, node.data.text, "${ctx}/backcontrol/book/main.htm?id="+node.data.id);
        	}
         	 
            function f_heightChanged(options)
            {
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            //新增tab方法
            function f_addTab(tabid,text, url)
            { 
                tab.addTabItem({ tabid : tabid,text: text, url: url });
            } 
            
            
            //进行树的刷新
            function refresh(dialog){
            	 tree.clear();//先清空数据
                 tree.loadData(null,"${ctx}/backcontrol/depts/getJsonTree.htm?pId=0",null);//重新加载数据            	
                 dialog.close();
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
        <div position="left"  title="我的通讯录分组"> 
          <div class="l-layout-header" name="caozuo" style="color:#D7D7D7;">
          <button id="refresh"  type="button" onclick="refresh();">刷新</button>
          <button id="refresh"  type="button" onclick="expandAll();">展开</button>
          <button id="refresh"  type="button" onclick="collapseAll();">缩收</button>
          </div>
                <ul id="tree1" style="margin-top:3px;">
               	
               	<!-- 
                   <ul>
                      <li url="${ctx}/backcontrol/book/main.htm?linkman='同事'"><span>同事列表</span></li>
                      <li url="${ctx}/backcontrol/book/friend.htm?linkman='朋友'""><span>朋友列表</span></li>
                      <li url="${ctx}/backcontrol/book/main.htm?linkman='同学'""><span>同学列表</span></li>
                    </ul>
                    -->
              </ul>
       		 
        </div>
        <div position="center" id="framecenter"> 
            <div tabid="home" title="联系人列表" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="${ctx}/backcontrol/book/main.htm"></iframe>
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
