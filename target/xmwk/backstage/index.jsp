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
    <script src="release/wangEditor.min.js"></script>
    <script src="layer-v3.1.1/layer/layer.js"></script>
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
                   // repeat(num);
                }
            });
        });
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
                                <a><i class="fa fa-paper-plane" aria-hidden="true"></i><span>项目案例管理</span></a>
                                <ul class="nav child-nav level-1">
                                    <li><a href="project.jsp">项目信息</a></li>
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
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">首页</a></li>
                    </ul>
                </div>
            </div>

            <div class="row animated fadeInUp">
                <div class="col-sm-12 col-lg-12">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="panel">
                                <div class="panel-header">
                                </div>
                                <div class="panel-content" id="edit">
                                    <p id="culture">
                                        <%--内容--%>
                                    </p>
                                </div>
                                <div class="panel-footer">
                                    <span class="code"><font style="size: 17px;font-style: oblique">天能物业</font></span>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="row"></div>
                    <div class="row"></div>


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
    </div>
</div>

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
