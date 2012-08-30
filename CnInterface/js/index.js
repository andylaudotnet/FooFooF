
//div定位通用函数 (showname:需定位div ID，positionname：相对标签ID)
function showDivStage(showname,positionname) {
    var cf = document.getElementById(showname);
    var oImg = document.getElementById(positionname);

    var eT = 0, eL = 0, p = oImg;
    var sT = document.body.scrollTop, sL = document.body.scrollLeft;
    var eH = oImg.height + 25, eW = oImg.width;
    while (p && p.tagName != "BODY") { eT += p.offsetTop; eL += p.offsetLeft; p = p.offsetParent; }
    cf.style.top = ((document.body.clientHeight - (eT - sT) - eH >= cf.style.posHeight) ? (eT + eH) : (eT - cf.style.posHeight)) - 116;
    cf.style.left = ((document.body.clientWidth - (eL - sL) >= cf.style.posWidth) ? (eL + eW) : (eL - cf.style.posWidth))+13;
}

//显示各种接口区别
function showInterfaceDiff() {
        showDivStage("DivInterfaceDiff", "txtDivInterfaceDiff");
        document.getElementById("DivInterfaceDiff").style.display = "block";
}
//隐藏各种接口区别
function noShowInterfaceDiff() {
        document.getElementById("DivInterfaceDiff").style.display = "none";
}

//接口类型选择显示逻辑
function setSelectList(id) {
    var showname="";
    switch (id) {
        case "aWebservice":
            showname = "Webservice";
            document.getElementById("aHTTP").innerHTML = "<font size=2>HTTP</font>";
            document.getElementById("aDLL").innerHTML = "<font size=2>普通DLL</font>";
            document.getElementById("aADLL").innerHTML = "<font size=2>ActiveX DLL</font>";
            document.getElementById("aData").innerHTML = "<font size=2>数据库</font>";
            break;
        case "aHTTP":
            showname = "HTTP";
            document.getElementById("aWebservice").innerHTML = "<font size=2>Webservice</font>";
            document.getElementById("aDLL").innerHTML = "<font size=2>普通DLL</font>";
            document.getElementById("aADLL").innerHTML = "<font size=2>ActiveX DLL</font>";
            document.getElementById("aData").innerHTML = "<font size=2>数据库</font>";
        break;
        case "aDLL":
            showname = "普通DLL";
            document.getElementById("aHTTP").innerHTML = "<font size=2>HTTP</font>";
            document.getElementById("aWebservice").innerHTML = "<font size=2>Webservice</font>";
            document.getElementById("aADLL").innerHTML = "<font size=2>ActiveX DLL</font>";
            document.getElementById("aData").innerHTML = "<font size=2>数据库</font>";
        break;
        case "aADLL":
            showname = "ActiveX DLL";
            document.getElementById("aHTTP").innerHTML = "<font size=2>HTTP</font>";
            document.getElementById("aDLL").innerHTML = "<font size=2>普通DLL</font>";
            document.getElementById("aWebservice").innerHTML = "<font size=2>Webservice</font>";
            document.getElementById("aData").innerHTML = "<font size=2>数据库</font>";
        break;
        case "aData":
            showname = "数据库";
            document.getElementById("aHTTP").innerHTML = "<font size=2>HTTP</font>";
            document.getElementById("aDLL").innerHTML = "<font size=2>普通DLL</font>";
            document.getElementById("aADLL").innerHTML = "<font size=2>ActiveX DLL</font>";
            document.getElementById("aWebservice").innerHTML = "<font size=2>Webservice</font>";
        break;
        default:
            showname = "Webservice";
            document.getElementById("aHTTP").innerHTML = "<font size=2>HTTP</font>";
            document.getElementById("aDLL").innerHTML = "<font size=2>普通DLL</font>";
            document.getElementById("aADLL").innerHTML = "<font size=2>ActiveX DLL</font>";
            document.getElementById("aData").innerHTML = "<font size=2>数据库</font>";
        break;
    }
    document.getElementById(id).innerHTML = "<font size=2 color=\"#003399\"><b>" + showname + "</b></font>";
    document.getElementById(id).style.textDecoration = "none";
    document.getElementById("hiddenInterfaceName").value = id;
    document.getElementById("txtInterfaceName").value = "";
    document.getElementById("txtInterfaceName").focus();
}