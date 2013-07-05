<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="css/my.css">
    <link rel="stylesheet" href="css/base.css">

    <script src="js/jquery-1.9.1.js"></script>
    <script src="js/jquery-ui.js"></script>

    <script type="text/javascript" charset="utf-8">
        $(document).ready(function () {
            // make sure only one checkbox is checked at any time
            var $unique = $('input.unique');
            $unique.click(function () {
                $unique.filter(':checked').not(this).removeAttr('checked');
            });

            // randomly allocate attributes
            randomAllocateAttr();

            $('button').hover(// hover the button
                    function () {
                        $(this).addClass('ui-state-hover');
                    },
                    function () {
                        $(this).removeClass('ui-state-hover');
                    }
            );

            $("[id$='_add']").click(function(event){
                var attribute=$(this).attr("id").substring(0,$(this).attr("id").indexOf("_"));
                var attributePoint=parseInt($("#"+attribute).val());
                var remainPoint=parseInt($("#remainPoint").val());

                if(remainPoint>0&&remainPoint<40){
                    remainPoint--;
                    attributePoint++;
                    $("#remainPoint").val(remainPoint);
                    $("#"+attribute).val(attributePoint);
                }
            });

            $("[id$='_minus']").click(function(event){
                var attribute=$(this).attr("id").substring(0,$(this).attr("id").indexOf("_"));
                var attributePoint=parseInt($("#"+attribute).val());
                var remainPoint=parseInt($("#remainPoint").val());

                if(attributePoint>0&&attributePoint<=40){
                    remainPoint++;
                    attributePoint--;
                    $("#remainPoint").val(remainPoint);
                    $("#"+attribute).val(attributePoint);
                }
            });
        });

//        function goBack(hideId, showId) {
//            $("#" + hideId).hide();
//            $("#" + showId).show();
//        }

        function randomAllocateAttr() {
            var randomPowerPoint = Math.floor(Math.random() * 19) // a number between 0-20
            var randomSpeedPoint = Math.floor(Math.random() * (39 - randomPowerPoint - 1));
            var randomWisdomPoint = Math.floor(Math.random() * (39 - randomSpeedPoint - randomPowerPoint - 1));
            var randomAoyiPoint = 40 - randomPowerPoint - randomSpeedPoint - randomWisdomPoint;

            $("#power").val(randomPowerPoint);
            $("#speed").val(randomSpeedPoint);
            $("#wisdom").val(randomWisdomPoint);
            $("#aoyi").val(randomAoyiPoint);

            $("#remainPoint").val(0);
        }
    </script>


    <title>创建忍者</title>
</head>
<body>
<div class="mainDiv">
    <form:form action="">
        <div id="generalInfoDiv" class="container">
            <div class="row">
                <div class="col"><img src="./images/gameicon/feibiao2.png"><span style="font-size: 120%; font-weight: bolder">伊賀流</span></div>
                <div class="col"><span>與雇主間有金錢契約關係,擅长暗杀与情报收集</span></div>
            </div>
            <div class="row">
                <div class="col"><img src="./images/gameicon/feibiao2.png"><span style="font-size: 120%; font-weight: bolder">甲賀流</span></div>
                <div class="col"><span>活躍於戰場上或後方.長於用藥.誓死對主君盡忠</span></div>
            </div>
            <div class="row">
                <div class="col"><img src="./images/gameicon/feibiao2.png"><span style="font-size: 120%; font-weight: bolder">風魔忍</span></div>
                <div class="col"><span>被誉为隐秘修炼者的迷之忍者众,擅长幻术与伪装</span></div>
            </div>
            <div class="row">
                <div class="col"><img src="./images/gameicon/feibiao2.png"><span style="font-size: 120%; font-weight: bolder">轩辕里</span></div>
                <div class="col"><span>源于中国的绿林死士,对武器锻造与使用颇有心得</span></div>
            </div>

            <div class="row">
                <div class="col">
                    男<input type="checkbox" name="male" value="男" checked="true" class="unique"/>
                    女<input type="checkbox" name="female" value="女" class="unique"/>
                </div>
                <div class="col">姓名<input name="name" id="name" maxlength="64" size="16"/></div>
            </div>

            <!-- TODO         <div class="col">上传头像<input type="file" name="icon" id="icon"></div> -->


            <div class="row">&nbsp;</div>
            <div class="row">
                <div class="col" align="center">
                    <button type="button" id="displayAllocateAttrDiv" onclick="randomAllocateAttr()"
                            class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" role="button"
                            aria-disabled="false"><span class="ui-button-text">随机分配属性</span></button>
                </div>
                <div class="col" align="center">剩余点数<input type="text" id="remainPoint" readonly="true" size="3"/></div>
            </div>

            <div class="row">
                <div class="col" align="center">力量<input name="power" id="power" maxlength="2" size="2"/></div>
                <div class="row">
                    <button type="button" id="power_add" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                            role="button" aria-disabled="false" >
                        <span class="ui-button-icon-primary ui-icon ui-icon-plus"></span>
                        <span class="ui-button-text">增加</span></button>
                    <button type="button" id="power_minus" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                            role="button" aria-disabled="false" >
                        <span class="ui-button-icon-primary ui-icon ui-icon-minus"></span>
                        <span class="ui-button-text">减少</span></button>
                </div>
            </div>
            <div class="row">
                <div class="col" align="center">敏捷<input name="speed" id="speed" maxlength="2" size="2"/></div>
                <div class="row">
                    <button type="button" id="speed_add" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                            role="button" aria-disabled="false" >
                        <span class="ui-button-icon-primary ui-icon ui-icon-plus"></span>
                        <span class="ui-button-text">增加</span></button>
                    <button type="button" id="speed_minus" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                            role="button" aria-disabled="false" >
                        <span class="ui-button-icon-primary ui-icon ui-icon-minus"></span>
                        <span class="ui-button-text">减少</span></button>                </div>

            </div>
            <div class="row">
                <div class="col" align="center">智力<input name="wisdom" id="wisdom" maxlength="2" size="2"/></div>
                <div class="row">
                    <button type="button" id="wisdom_add" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                            role="button" aria-disabled="false" >
                        <span class="ui-button-icon-primary ui-icon ui-icon-plus"></span>
                        <span class="ui-button-text">增加</span></button>
                    <button type="button" id="wisdom_minus" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                            role="button" aria-disabled="false" >
                        <span class="ui-button-icon-primary ui-icon ui-icon-minus"></span>
                        <span class="ui-button-text">减少</span></button>                </div>
            </div>
            <div class="row">
                <div class="col" align="center">奥义<input name="aoyi" id="aoyi" maxlength="2" size="2"/></div>
                <div class="row">
                    <button type="button" id="aoyi_add" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                            role="button" aria-disabled="false" >
                        <span class="ui-button-icon-primary ui-icon ui-icon-plus"></span>
                        <span class="ui-button-text">增加</span></button>
                    <button type="button" id="aoyi_minus" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                            role="button" aria-disabled="false" >
                        <span class="ui-button-icon-primary ui-icon ui-icon-minus"></span>
                        <span class="ui-button-text">减少</span></button>                </div>
            </div>
            <div class="row">
                <div class="col">
                    <button type="submit"
                            class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" role="button"
                            aria-disabled="false">
                        <span class="ui-button-icon-primary ui-icon ui-icon-person"></span>
                        <span class="ui-button-text">创建忍者</span></button>
                </div>
            </div>
        </div>
    </form:form>
</div>


</body>
</html>