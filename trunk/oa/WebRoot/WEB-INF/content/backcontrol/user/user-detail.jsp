<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/backcontrol/form.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head>
   <title></title>
   <script type="text/javascript">
        $(function (){
            $("form").ligerForm();
        }); 
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
         .errorClass{color:red}
    </style>

</head>
  <body style="padding:10px">
   <div>
   </div> 
          <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">帐号:</td>
                <td align="left" class="l-table-edit-td">
                     ${user.loginName}
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">姓名:</td>
                <td align="left" class="l-table-edit-td">
                   ${user.name}
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">邮箱:</td>
                <td align="left" class="l-table-edit-td">
                   ${user.email}
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">年龄:</td>
                <td align="left" class="l-table-edit-td">
                   ${user.age}
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">地址:</td>
                <td align="left" class="l-table-edit-td">
                   ${user.address}
                </td>
                <td align="left"></td>
            </tr>
        </table>
    
    <br/>
    <input type="submit" value="关闭" id="Button1" class="l-button l-button-submit" /> 
    <div style="display:none">
  </body>
</html>
