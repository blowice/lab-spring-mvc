<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>
<html>
<head>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="/css/my.css">
    <link rel="stylesheet" href="/css/base.css">

    <script src="/js/jquery-1.9.1.js"></script>
    <script src="/js/jquery-ui.js"></script>
    <script src="/js/my.js"></script>

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
                var attributePoint=parseInt($("#"+attribute).text());
                var remainPoint=parseInt($("#remainPoint").text());

                if(remainPoint>0&&remainPoint<40){
                    remainPoint--;
                    attributePoint++;
                    $("#remainPoint").text(remainPoint);
                    $("#"+attribute).text(attributePoint);
                }
            });

            $("[id$='_minus']").click(function(event){
                var attribute=$(this).attr("id").substring(0,$(this).attr("id").indexOf("_"));
                var attributePoint=parseInt($("#"+attribute).text());
                var remainPoint=parseInt($("#remainPoint").text());

                if(attributePoint>0&&attributePoint<=40){
                    remainPoint++;
                    attributePoint--;
                    $("#remainPoint").text(remainPoint);
                    $("#"+attribute).text(attributePoint);
                }
            });


            $("[id^='li_']")
                    .hover(
                    function(){
                        $(this).addClass('ui-selecting');
                    },
                    function() {
                        $(this).removeClass('ui-selecting');
                    })
                    .click(function() {
                        $("[id^='li_']").removeClass('ui-selected');
                        $(this).addClass('ui-selected');
                    });
        });

    </script>

    <title>创建忍者</title>
</head>
<body>
<div class="mainDiv">
    <form action="persistPlayer.do" onSubmit='return prepareSubmit()' method="post">
        <div id="generalInfoDiv" class="container">
            <c:forEach items="${ninjaLiList}" var="ninjaLi">
                <div class="row" id="li_${ninjaLi.liId}">
                    <div class="col"><img src="./images/gameicon/feibiao2.png"><span style="font-size: 120%; font-weight: bolder">${ninjaLi.liName}</span></div>
                    <div class="col"><span>${ninjaLi.liDescription}</span></div>
                </div>
            </c:forEach>
            <div class="row"><br/></div>

            <div class="row">
                <div class="col">
                    男<input type="checkbox" name="male" id="male" value="男" checked="true" class="unique"/>
                    女<input type="checkbox" name="female" id="female" value="女" class="unique"/>
                </div>
                <div class="col">姓名<input name="name" id="name" maxlength="64" size="16"/></div>
            </div>

            <!-- TODO         <div class="col">上传头像<input type="file" name="icon" id="icon"></div> -->

            <div class="row"><br/></div>
            <div class="row">
                <div class="col" align="center">
                    <button type="button" id="displayAllocateAttrDiv" onclick="randomAllocateAttr()"
                            class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" role="button"
                            aria-disabled="false"><span class="ui-button-text">随机分配属性</span></button>
                </div>
                <div class="col" align="center">剩余点数<label id="remainPoint"></label></div>
            </div>

            <c:forEach items="${attributeList}" var="attribute">
            <div class="row">
                <div class="col" align="center">
                    <div class="row">
                        <div class="col" style="text-align: left">${attribute.attributeDisplayText}:</div>
                        <div class="col" style="text-align: right"><label name="${attribute.attributeName}" id="${attribute.attributeName}"></label></div>
                    </div>
                </div>
                <div class="col" align="center">
                    <div class="row">
                        <div class="col"><button type="button" id="${attribute.attributeName}_add" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                                                 role="button" aria-disabled="false" >
                            <span class="ui-button-icon-primary ui-icon ui-icon-plus"></span>
                            <span class="ui-button-text">增加</span></button></div>
                        <div class="col"><button type="button" id="${attribute.attributeName}_minus" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only"
                                                 role="button" aria-disabled="false" >
                            <span class="ui-button-icon-primary ui-icon ui-icon-minus"></span>
                            <span class="ui-button-text">减少</span></button></div>
                    </div>
                </div>
            </div>
            </c:forEach>

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
        <input type="hidden" id="h_power" name="h_power" value=""/>
        <input type="hidden" id="h_speed" name="h_speed" value=""/>
        <input type="hidden" id="h_wisdom" name="h_wisdom" value=""/>
        <input type="hidden" id="h_blood" name="h_blood" value=""/>
        <input type="hidden" id="selectedLiId" name="selectedLiId" value=""/>
        <input type="hidden" id="selectedSex" name="selectedSex" value=""/>
    </form>
</div>
</body>
</html>