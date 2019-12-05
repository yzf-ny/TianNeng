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
        // layer.msg("asdfasga")
        //保存页数
        var num = 1;
        //保存总页数
        var size = 1;
        //每页条数
        var count=2;
        //哪一种状态
        var type=1;
        $(function () {
                repeat1();
        });

        //分页,分页数数组,总条数


        //分页查询或首次加载数据
        function repeat1() {
               //alert(${sessionScope.get("userinfo").uname});
                    //追加分页
                    $("#tbody").html("");
                    $("#tbody").children().remove();
                    var name="${sessionScope.get("userinfo").uname}";
                    var sex=${sessionScope.get("userinfo").usex};
                    var age=${sessionScope.get('userinfo').uage};
                    var img="${sessionScope.get('userinfo').uimg}";
                    var phone="${sessionScope.get('userinfo').uphone}";
                    var pwd="${sessionScope.get('userinfo').upwd}";
                    var email="${sessionScope.get('userinfo').uemail}";
                       if(sex==0)
                         sex='男'
                       else
                           sex='女'
                        var add =
                            "<tr ><td></td> <td></td> <td rowspan='9' style='width:20px' >"
                            + "<div style='margin-top: 150px'><button class='btn btn-transparent' onclick='update()'><i class='fa fa-pencil'></i> </button>"
                            + " </div></td></tr>"
                            + "<tr><td style='width: 80px'>姓名：</td>"
                            + "<td >"+name+"</td></tr>"
                            + "<tr><td >性别：</td>"
                            + "<td >" + sex + "</td></tr>"
                            + "<tr><td >年龄：</td>"
                            + "<td >" + age + "</td></tr>"
                            + "<tr><td >电话：</td>"
                            + "<td >" + phone + "</td></tr>"
                            + "<tr><td >Email：</td>"
                            + "<td >" + email + "</td></tr>"
                            + "<tr><td >密码：</td>"
                            + "<td >" + pwd + "</td></tr>"
                            + "<tr><td >头像：</td>"
                            + "<td ><img src='images/"+img+"'></td></tr>";

                        $("#tbody").append(add);


        }


        //修改
        function update(cid)
        {
            //全局弹出层属性
            layer.config({
                anim: 4, //默认动画风格
                skin: 'layui-layer-molv' //默认皮肤
            });
            layer.open({
                type: 2,
                title:"修改个人信息",
                area: ['600px', '550px'],
                fixed: false, //不固定
                maxmin: true,
                content: ["history/updatePerson.jsp?num="+num+"&cid="+cid,"no"]
            });

        }

        function back() {
            location.href="../backlogin";
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
                <div class="left-sidebar-title">Navigation</div>
                <div class="left-sidebar-toggle c-hamburger c-hamburger--htla hidden-xs"
                     data-toggle-class="left-sidebar-collapsed" data-target="html">
                    <span></span>
                </div>
            </div>
            <div id="left-nav" class="nano">
                <div class="nano-content">
                    <nav>
                        <ul class="nav" id="main-nav">
                            <li class="active-item"><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i><span>首页</span></a>
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
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">员工信息管理</a></li>
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">个人信息管理</a></li>
                    </ul>
                </div>
            </div>

            <div class="row animated fadeInUp">
                <div class="col-sm-12 col-lg-12">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">

                            <h4 class="section-subtitle"><b>个人信息表</b></h4>
                            <div class="panel">
                                <div class="panel-header">

                                </div>
                                <div class="panel-content">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover table-bordered text-center">

                                            <tbody id="tbody">

                                            </tbody>
                                        </table>
                                    </div>

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
        <a href="#" class="scroll-to-top"><i class="fa fa-angle-double-up"></i></a>
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
