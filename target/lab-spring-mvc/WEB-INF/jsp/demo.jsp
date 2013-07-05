<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/my.css"/>
    <script type="text/javascript" language="javascript" src="js/jquery.js"></script>
    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            // toggle the description div
            $('.hide_show').click(function () {
                $(this).siblings("span").slideToggle();
            });

            // make sure only one checkbox is checked at any time
            var $unique = $('input.unique');
            $unique.click(function() {
                $unique.filter(':checked').not(this).removeAttr('checked');
            });

            //display allocate attribute div
            $("#displayAllocateAttrDiv").click(function() {
                $("#allocateAttr").show();
            });
        });

        function goBack(hideId,showId){
            $("#"+hideId).hide();
            $("#"+showId).show();
        }

        <%-- TODO generate random attribute numbers, fill them in to the input boxes --%>
    </script>

    <title>创建忍者</title>
</head>
<body>
<form:form action="">
<div id="generalInfoDiv" class="container">
    <div class="row">
        <div class="col"><a class="hide_show" href="#">伊賀流</a><span style="display:none;">伊賀忍者與雇主之間僅有金錢契約的僱傭關係</span></div>
        <div class="col"><a class="hide_show" href="#">甲賀流</a><span style="display:none;">甲賀忍者活躍於戰場或後方.在忍術流派之中長於用藥.對主君盡忠</span></div>
        <div class="col"><a class="hide_show" href="#">風魔</a><span style="display:none;">風魔忍者</span></div>
        <div class="col"><a class="hide_show" href="#">轩辕</a><span style="display:none;">轩辕忍者</span></div>
    </div>

    <div class="row">
        <div class="col">姓名<input name="name" id="name" maxlength="64" size="32"/></div>
        <div class="col">
            男<input type="checkbox" name="male" value="男" checked="true" class="unique"/>
            女<input type="checkbox" name="female" value="女" class="unique"/>
        </div>

    </div>
    <div class="row">
        <div class="col"><button type="button" id="displayAllocateAttrDiv">分配属性</button></div>
    </div>
    <!-- TODO         <div class="col">上传头像<input type="file" name="icon" id="icon"></div> -->
</div>

<div id="allocateAttr" class="container" style="display: none">
    <div class="row">
        <div class="col">力量<input name="power" id="power" maxlength="2" size="2"/><a onclick="">+</a>&nbsp;<a onclick="">一</a></div>
    </div>
    <div class="row">
        <div class="col">敏捷<input name="speed" id="speed" maxlength="2" size="2"/><a onclick="">+</a>&nbsp;<a onclick="">一</a></div>
    </div>
    <div class="row">
        <div class="col">智力<input name="wisdom" id="wisdom" maxlength="2" size="2"/><a onclick="">+</a>&nbsp;<a onclick="">一</a></div>
    </div>
    <div class="row">
        <div class="col">奥义<input name="aoyi" id="aoyi" maxlength="2" size="2"/><b><a onclick="">+</a>&nbsp;<a onclick="">-</a></b></div>
    </div>
    <div class="row">
        <div class="col"><a href="#" onclick="goBack('allocateAttr','generalInfoDiv')">返回</a></div>
        <div class="col"><button type="submit"></button></div>
    </div>
</div>


</form:form>

</body>
</html>