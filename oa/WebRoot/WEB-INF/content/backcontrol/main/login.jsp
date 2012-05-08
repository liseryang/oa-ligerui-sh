<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head> 
    <title></title>
    <style type="text/css">
        *{ padding:0; margin:0;}
        body{ text-align:center; background:#4974A4;}
        #login{ width:740px; margin:0 auto; font-size:12px;}
        #loginlogo{ width:700px; height:100px; overflow:hidden; background:url('${ctx}/images/backcontrol/login/logo.jpg') no-repeat; margin-top:50px;   }
        #loginpanel{ width:729px; position:relative;height:300px;}
        .panel-h{ width:729px; height:20px; background:url('${ctx}/images/backcontrol/login/panel-h.gif') no-repeat; position:absolute; top:0px; left:0px; z-index:3;}
        .panel-f{ width:729px; height:13px; background:url('${ctx}/images/backcontrol/login/panel-f.gif') no-repeat; position:absolute; bottom:0px; left:0px; z-index:3;}
        .panel-c{ z-index:2;background:url('${ctx}/images/backcontrol/login/panel-c.gif') repeat-y;width:729px; height:300px;}
        .panel-c-l{ position:absolute; left:60px; top:40px;}
        .panel-c-r{ position:absolute; right:20px; top:50px; width:222px; line-height:200%; text-align:left;}
        .panel-c-l h3{ color:#556A85; margin-bottom:10px;}
        .panel-c-l td{ padding:7px;}
        .login-text{ height:24px; left:24px; border:1px solid #e9e9e9; background:#f9f9f9;}
        .login-text-focus{ border:1px solid #E6BF73;}
        .login-btn{width:114px; height:29px; color:#E9FFFF; line-height:29px; background:url('${ctx}/images/backcontrol/login/login-btn.gif') no-repeat; border:none; overflow:hidden; cursor:pointer;}
        #txtUsername,#txtPassword{ width:191px;} 
        #logincopyright{ text-align:center; color:White; margin-top:50px;}
    </style>
    <script src="${ctx}/javascripts/backcontrol/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Aqua/css/ligerui-dialog.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/javascripts/backcontrol/ligerUI/skins/Gray/css/dialog.css" rel="stylesheet" type="text/css" />
    <script src="${ctx}/javascripts/backcontrol/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${ctx}/javascripts/backcontrol/common.js" type="text/javascript"></script>
    <script src="${ctx}/javascripts/backcontrol/LG.js" type="text/javascript"></script>
</head>
<body style="padding:10px"> 
    <div id="login">
        <div id="loginlogo"></div>
        <div id="loginpanel">
            <div class="panel-h"></div>
            <div class="panel-c">
                <div class="panel-c-l">
                   ${fail_key }<br/>
                    <form action="${ctx}/backcontrol/checkLogin.htm" method="post">
                    <table cellpadding="0" cellspacing="0">
                        <tbody>
                         <tr>
                            <td align="left" colspan="2"> 
                             <h3>请使用LigerUI 权限管理系统账号登陆</h3>
                            </td>
                            </tr> 
                            <tr>
                            <td align="right">账号：</td><td align="left"><input type="text" name="loginName" id="loginName" value="user" class="login-text" /></td>
                            </tr>
                            <tr>
                            <td align="right">密码：</td><td align="left"><input type="password" name="password" id="password" value="user" class="login-text" /></td>
                            </tr> 
                            <tr>
                            <td align="center" colspan="2">
                                <input type="submit" id="btnLogin" value="登陆" class="login-btn" />
                                 <a href="${ctx}/backcontrol/user/user-register.htm" >注册</a>
                            </td>
                            </tr> 
                        </tbody>
                    </table>
                   </form>
                </div>
                <div class="panel-c-r">
                <p>请从左侧输入登录账号和密码登录</p>
                <p>如果遇到系统问题，请联系网络管理员。</p>
                <p>如果没有账号，请联系网站管理员。 </p>
                <p>......</p>
                </div>
            </div>
            <div class="panel-f"></div>
        </div>
         <div id="logincopyright">Copyright © 2012 LigerUI </div>
    </div>
</body>
</html>