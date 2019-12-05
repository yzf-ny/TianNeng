<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html lang="en" class="fixed">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <title>天能物业</title>
    <link rel="apple-touch-icon" sizes="120x120" href="favicon/apple-icon-120x120.png">
    <link rel="icon" type="image/png" sizes="192x192" href="favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="vendor/animate.css/animate.css">
    <link rel="stylesheet" href="vendor/toastr/toastr.min.css">
    <link rel="stylesheet" href="vendor/magnific-popup/magnific-popup.css">
    <link rel="stylesheet" href="stylesheets/css/style.css">

    //弹出层
    <script src="vendor/js/Jquery-3.4.1.js"></script>
    <script src="layer-v3.1.1/layer/layer.js"></script>
    <script src="release/wangEditor.min.js"></script>
    <script>
        //保存内容
        var text = "";
        //保存页数
        var num = 1;
        $(function () {
            $("#ok").hide();
            $.ajax({
                url: "../showCu"
                , type: 'POST'
                , success: function (json) {
                    text = json.ctext;
                    $("#culture").html(json.ctext);
                    repeat(num);
                }
            });

            //保存初始内容定义
            var editor;
            $("#update").click(function () {
                $(this).hide();
                var op = "<div  id='div1' class='toolbar'></div>"
                    + "<div style='padding: 10px 0; color: #ccc'></div>"
                    + "<div id='div2' class='text' style='height:950px;border:1px solid #cccccc'>"
                    + "<font id='content'>"
                    + text
                    + "</font></div>"

                var char = $("#edit").children();
                $("#edit").html("")
                // alert($("#edit").html())
                char.remove();//隐藏显示
                //富文本编辑器
                $("#edit").append(op);
                var E = window.wangEditor;
                editor = new E('#div1', '#div2')  // 两个参数也可以传入 elem 对象，class 选择器
                editor.customConfig.uploadImgShowBase64 = true;
                editor.create();
                //隐藏时间线
                // var line=$("#timeline").children();
                // line.hide();
                //显示提交按钮
                $("#ok").show();
            });


            $("#ok").click(function () {
                //点击提交时的内容
                var txt1 = editor.txt.html();
                $.ajax({
                    url: "../updateCul"
                    , type: 'POST'
                    , data: {'txt': txt1}
                    , success: function (cul) {
                        text = cul.ctext;
                        if (cul != null) {

                            var child = $("#edit").children();
                            var t = cul.ctext;
                            child.remove();
                            $("#edit").append(cul.ctext);
                            $("#update").show();
                            $("#ok").hide();
                            layer.msg("修改成功",{icon:1,time:3000});
                            repeat(num);
                        }
                    }
                })
            })

        });

        //显示详情
        function showhis(obj) {
            var v = $(obj);
            var ne = v.next().next();
            //判断是否隐藏或显示
            if (ne.css("display") == "none") {
                ne.css("display", "block")
            } else {
                ne.css("display", "none")
            }
        }

        //回复成原来的版本
        function recovery(obj) {
            var te = $(obj).prev().prev().html();
            $.ajax({
                url: '../recovery'
                , type: 'POST'
                , data: {"text": te}
                , success: function (cul) {
                    //alert(json.ctext)
                    var child = $("#edit").children();
                    var t = cul.ctext;
                    child.remove();
                    $("#edit").append(cul.ctext);
                    alert("恢复成功")
                }
            })
        }

        //layer.msg("hello word")
        //保存总页数
        var size = 0;

        function repeat(number) {
            if (number == '')
                number = 1;
            $("#timeline").children().remove();
            $("#timeline").children().html("");
            $.ajax({
                url: '../showhis'
                , type: 'POST'
                , data: {'num': number}
                , success: function (his) {
                    //alert("this is his:"+his.list)
                    if(his.list==''||his.list==null)
                    {
                        $("#page").children().hide();
                    }
                    else
                        $("#page").children().show();
                    var list = his.list;
                    size = his.size;
                    for (var i = 0; i < list.length; i++) {
                      // alert(list[i].htext)
                        var add = "<div class='timeline-box'>"
                            + "<div class='timeline-icon bg-primary'>"
                            + "<i class=' fa fa-file'></i>"
                            + "</div>"
                            + "<div class='timeline-content'>"
                            + "<h4 class='tl-title' >公司简介" + (i+1) + "</h4>"
                            + " 修改人:" + list[i].hname + " <br> 更改地址：" + list[i].haddress + "<br> 更改时间:" + list[i].htime + ""
                            + "</div> "
                            + " <div class='timeline-footer'>"
                            + "<span >修改内容:<a href='javascript:void(0)'  title='点击查看历史修改记录' onclick=showhis(this)>详情</a>"
                            + "</br><div name='showinfo' style='display: none'><span>" + list[i].htext + "</span></br>"
                            + "<button  class='btn btn-wide btn-warning' onclick='recovery(this)' >恢复这个版本</button></div></span>"
                            + "</div>"
                            + "</div>"
                        $("#timeline").append(add);
                    }

                }
            })
        }


        function perv() {

            num -= 1;
            if (num < 1) {
                num = 1;
                return;
            }


            repeat(num)
        }

        function next() {
            num += 1;
            if (num > size) {
                num = size;
                return;
            }

            repeat(num)
        }

    </script>
</head>

<body>
<div class="wrap">
    <div class="page-header">
        <%--头部--%>
        <div class="leftside-header">
            <div class="logo">
                <h3><a href="index.jsp" style="color:white;">
                    天 能 物 业
                </a></h3>
            </div>
            <div id="menu-toggle" class="visible-xs toggle-left-sidebar" data-toggle-class="left-sidebar-open"
                 data-target="html">
                <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
            </div>
        </div>
        <div class="rightside-header">
            <div class="header-middle"></div>
            <%--搜索框--%>
            <div class="header-section" id="search-headerbox">

            </div>

            <div class="header-section hidden-xs" id="notice-headerbox">
                <div class="notice" id="checklist-notice">
                    <%--钩钩框--%>

                </div>
            </div>

            <%--登录头像信息--%>
            <div class="header-section" id="user-headerbox">
                <div class="user-header-wrap">
                    <div class="user-photo">
                        <img src="images/${sessionScope.get("userinfo").uimg}"
                             alt="${sessionScope.get("userinfo").uname}"/>
                    </div>
                    <div class="user-info">
                        <span class="user-name">${sessionScope.get("userinfo").uname}</span>
                        <span class="user-profile">${sessionScope.get("userinfo").uemail}</span>
                    </div>
                    <i class="fa fa-plus icon-open" aria-hidden="true"></i>
                    <i class="fa fa-minus icon-close" aria-hidden="true"></i>
                </div>
                <div class="user-options dropdown-box">
                    <div class="drop-content basic">
                        <ul>
                            <li><a href="person.jsp"><i class="fa fa-user" aria-hidden="true"></i> 个人信息</a>
                            </li>
                            <li><a href="../backlogin"><i class="fa fa-lock" aria-hidden="true"></i> 退出登录</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="header-separator"></div>
            <div class="header-section">
                <a href="../backlogin"><i class="fa fa-sign-out log-out" aria-hidden="true"></i></a>
            </div>
        </div>
    </div>

    <div class="page-body">
        <div class="left-sidebar">
            <div class="left-sidebar-header">
                <div class="left-sidebar-title">导 航 条</div>
                <div class="left-sidebar-toggle c-hamburger c-hamburger--htla hidden-xs"
                     data-toggle-class="left-sidebar-collapsed" data-target="html">
                    <span></span>
                </div>
            </div>
            <div id="left-nav" class="nano">
                <div class="nano-content">
                    <nav>
                        <ul class="nav" id="main-nav">
                            <li class="active-item"><a href="index.jsp"><i class="fa fa-home"
                                                                           aria-hidden="true"></i><span>首页</span></a>
                            </li>
                            <li class="has-child-item close-item">
                                <a><i class="fa fa-cubes" aria-hidden="true"></i><span>关于我们</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="ui-elements_panels.jsp">公司简介</a></li>
                                    <li><a href="ui-elements_accordions.jsp">公司文化</a></li>
                                    <li><a href="ui-elements_history.jsp">发展历史</a></li>
                                    <li><a href="ui-elements_leader.jsp">领导致辞</a></li>
                                </ul>
                            </li>

                            <li class="has-child-item close-item">
                                <a><i class="fa fa-pie-chart" aria-hidden="true"></i><span>公司动态</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="action1.jsp">公司新闻</a></li>
                                    <li><a href="action2.jsp">行业新闻</a></li>
                                    <li><a href="action3.jsp">公司大事记</a></li>
                                </ul>
                            </li>

                            <li class="has-child-item close-item">
                                <a><i class="fa fa-columns" aria-hidden="true"></i><span>人事管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="deptinfo.jsp">人才招聘</a></li>
                                    <li><a href="contact.jsp">联系我们</a></li>
                                </ul>
                            </li>

                            <li class="has-child-item close-item">
                                <a><i class="fa fa-paper-plane" aria-hidden="true"></i><span>项目案例管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="project.jsp">项目信息</a></li>
                                </ul>
                            </li>

                            <li class="has-child-item close-item">
                                <a><i class="fa fa-table" aria-hidden="true"></i><span>员工信息管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="person.jsp">个人信息管理</a></li>
                                </ul>
                            </li>

                        </ul>
                    </nav>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="content-header">
                <div class="leftside-content-header">
                    <ul class="breadcrumbs">
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="index.jsp">首页</a></li>
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">关于我们</a></li>
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">公司简介</a></li>
                    </ul>
                </div>
            </div>
            <div class="row animated fadeInUp">
                <div class="col-sm-12 col-lg-9">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="panel">
                                <div class="panel-header">
                                    <button class="btn btn-wide btn-primary" id="update">修 改</button>
                                    <div>
                                        <button id='ok' class="btn btn-wide btn-success" style='margin-left: 320px'>提交</button>
                                    </div>
                                </div>
                                <div class="panel-content" id="edit">
                                    <p id="culture">
                                        <%--内容--%>
                                    </p>

                                </div>
                                <div class="panel-footer">
                                    <span class="code"><font style="size: 17px;font-style: oblique">万科物业</font></span>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="row"></div>
                    <div class="row"></div>


                </div>
                <div class="col-sm-12 col-lg-3">
                    <div class="timeline" id="timeline">


                    </div>
                    <div id="page">
                        <h4>
                            <center><a href="javascript:void(0);" onclick="perv()"><<<</a>&nbsp;&nbsp;
                                <a href="javascript:void(0);" onclick="next()">>>></a></center>
                        </h4>
                    </div>
                </div>
            </div>
        </div>

        <div class="right-sidebar">
            <div class="right-sidebar-toggle" data-toggle-class="right-sidebar-opened" data-target="html">
                <i class="fa fa-cog fa-spin" aria-hidden="true"></i>
            </div>
            <div id="right-nav" class="nano">
                <div class="nano-content">
                    <div class="template-settings">
                        <h4 class="text-center">全局修改</h4>
                        <ul class="toggle-settings pv-xlg">
                            <li>
                                <h6 class="text">头部固定</h6>
                                <label class="switch">
                                    <input id="header-fixed" type="checkbox" checked>
                                    <span class="slider round"></span>
                                </label>
                            </li>
                            <li>
                                <h6 class="text">左面导航条固定</h6>
                                <label class="switch">
                                    <input id="left-sidebar-fixed" type="checkbox" checked>
                                    <span class="slider round"></span>
                                </label>
                            </li>
                            <li>
                                <h6 class="text">左面导航条内收</h6>
                                <label class="switch">
                                    <input id="left-sidebar-collapsed" type="checkbox">
                                    <span class="slider round"></span>
                                </label>
                            </li>
                            <li>
                                <h6 class="text">内容头部固定</h6>
                                <label class="switch">
                                    <input id="content-header-fixed" type="checkbox" checked>
                                    <span class="slider round"></span>
                                </label>
                            </li>
                        </ul>
                        <h4 class="text-center">Template Colors</h4>
                        <ul class="toggle-colors">
                            <li>
                                <a href="index.html" class="on-click"> <img alt="Helsinki-green"
                                                                            src="images/logo.png"/></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" class="scroll-to-top"><i class="fa fa-angle-double-up"></i></a>
    </div>
</div>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/nano-scroller/nano-scroller.js"></script>
<script src="javascripts/template-script.min.js"></script>
<script src="javascripts/template-init.min.js"></script>
<script src="vendor/toastr/toastr.min.js"></script>
<script src="vendor/chart-js/chart.min.js"></script>
<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="javascripts/examples/dashboard.js"></script>
</body>

</html>
