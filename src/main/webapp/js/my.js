function randomAllocateAttr() {
    var randomPowerPoint = Math.floor(Math.random() * 19) // a number between 0-20
    var randomSpeedPoint = Math.floor(Math.random() * (39 - randomPowerPoint - 1));
    var randomWisdomPoint = Math.floor(Math.random() * (39 - randomSpeedPoint - randomPowerPoint - 1));
    var randomBloodPoint = 40 - randomPowerPoint - randomSpeedPoint - randomWisdomPoint;

    $("#power").text(randomPowerPoint);
    $("#speed").text(randomSpeedPoint);
    $("#wisdom").text(randomWisdomPoint);
    $("#blood").text(randomBloodPoint);

    $("#remainPoint").text(0);
}

function goBack(hideId, showId) {
    $("#" + hideId).hide();
    $("#" + showId).show();
}

function prepareSubmit(){
    // check li
    var selected_li_count=0;
    var selected_li_id="1";
    $("[id^='li_']").each(function () {
        if($(this).hasClass("ui-selected")){
            selected_li_count=selected_li_count+1;
            selected_li_id=$(this).attr("id").substring(3,4);
        }
    });

    if(selected_li_count!=1){
        alert("请选择修炼者流派");
        return false;
    }
    // check name
    // [\u4E00-\uFA29]|[\uE7C7-\uE7F3]汉字编码范围
    var re1 = new RegExp("^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z0-9]){3,15}$");
    if (!re1.test($("#name").val())){
        alert("请输入合法用户名");
        return false;
    }

    // check remain attribute point
    if($("#remainPoint").text()!="0"){
        alert("请完全分配属性点数");
        return false;
    }

    // assign hidden values
    $("#selectedLiId").val(selected_li_id);
    if($('#male').is(":checked")){
        $("#selectedSex").val("男");
    }else{
        $("#selectedSex").val("女");
    }
    $("#h_power").val($("#power").text());
    $("#h_speed").val($("#speed").text());
    $("#h_wisdom").val($("#wisdom").text());
    $("#h_blood").val($("#blood").text());

    return true;
}