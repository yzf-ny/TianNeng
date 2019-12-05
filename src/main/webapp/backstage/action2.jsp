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

    <script>
        // layer.msg("asdfasga")
        //保存页数
        var num = 1;
        //保存总页数
        var size = 1;
        //每页条数
        var count=2;
        //哪一种新闻
        var type=2;
        $(function () {
            repeat1(num)
            $("#select").change(function () {
                var a=$(this).val();
                count=a;
                repeat1(num);
            })

            $("#add").click(function () {

                //全局弹出层属性
                layer.config({
                    anim: 4, //默认动画风格
                    skin: 'layui-layer-molv' //默认皮肤
                });
                layer.open({
                    type: 2,
                    title:"添加行业新闻",
                    area: ['700px', '700px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: ["action/addAction1.jsp?type="+type,"no"]
                });
            })


        });

        //分页,分页数数组,总条数
        function pageing(arr,countRow) {

            $("#paging").html("");
            if(num==1)
            {
                var add = "<button  class='btn   btn-primary ' onclick='actionNum(1)' disabled='disabled'>首 页</button>&nbsp;<button  class='btn   btn-primary ' onclick='perv()' disabled='disabled'><<<</button>&nbsp;";
            }
            else
                var add = "<button  class='btn   btn-primary ' onclick='actionNum(1)'>首 页</button>&nbsp;<button  class='btn   btn-primary ' onclick='perv()'><<<</button>&nbsp;";
            for (var i = 0; i < arr.length; i++) {
                if (num == arr[i])
                    add += "<button  class='btn  btn-primary ' onclick='actionNum(" + arr[i] + ")'>" + arr[i] + "</button>&nbsp;"
                else
                    add += "<button  class='btn btn-o  btn-info ' onclick='actionNum(" + arr[i] + ")'>" + arr[i] + "</button>&nbsp;"
            }
            //是否禁用按钮
            if (num == size)
                add += "<button  class='btn   btn-primary ' onclick='next()' disabled='disabled'>>>></button>&nbsp;<button  class='btn  btn-primary' onclick='actionNum(" + size + ")' disabled='disabled'>尾 页</button>&nbsp;";
            else
                add += "<button  class='btn   btn-primary ' onclick='next()'>>>></button>&nbsp;<button  class='btn  btn-primary' onclick='actionNum(" + size + ")'>尾 页</button>&nbsp;";
            add+="&nbsp;&nbsp;<span style='margin-left: 100px'>共有"+size+"页,有"+countRow+"条数据</span>"
            $("#paging").append(add);
        }

        //分页查询或首次加载数据
        function repeat1(num1) {
            $.ajax({
                url: "../action/showinfo"
                , type: 'POST'
                , data: {'num': num1,'count':count,'atype':type}
                , success: function (json) {
                    num = json.pagenum;
                    var list = json.list;
                    size = json.size;

                    //删除显示预览时间线
                    $("#timeline").children().remove();
                    $("#timeline").children().html("");

                    //追加分页
                    pageing(json.arr,json.row);

                    $("#tbody").html("");
                    $("#tbody").children().remove();
                    for (var i = 0; i < list.length; i++) {
                        var add =
                            "<tr ><td>----------------</td> <td>------------------</td> <td rowspan='6'  style='text-align: center'>"
                            + "<div class='btn-group btn-group-xs' style='width: 70px;text-align: center;margin-top:  50%'>"
                            + "<button class='btn btn-transparent' onclick='update("+list[i].aid+")'><i class='fa fa-pencil'></i> </button>"
                            + "<button class='btn btn-transparent' onclick='deletes("+list[i].aid+")'><i class='fa fa-times'></i> </button>"
                            + " </div></td></tr>"

                            + "<tr><td style='width: 50px;text-align: center'>编号:</td>"
                            + "<td >" + (i+1) + "</td></tr>"
                            + "<tr><td style='text-align: center'>标题：</td>"
                            + "<td style='text-align: center'>" + list[i].atitle + "</td></tr>"
                            + "<tr><td style='text-align: center'>来源：</td>"
                            + "<td style='text-align: center'>" + list[i].asource + "</td></tr>"
                            + "<tr><td style='text-align: center'>时间：</td>"
                            + "<td style='text-align: center'>" + list[i].atime + "</td></tr>"
                            + "<tr><td style='text-align: center'>内容：</td>"
                            + "<td style='text-align: center'>" + list[i].atext + "</td></tr>"



                        $("#tbody").append(add);
                    }
                }
            });
        }
        //修改
        function update(aid)
        {
            //全局弹出层属性
            layer.config({
                anim: 4, //默认动画风格
                skin: 'layui-layer-molv' //默认皮肤
            });
            layer.open({
                type: 2,
                title:"修改行业新闻",
                area: ['700px', '700px'],
                fixed: false, //不固定
                maxmin: true,
                content: ["action/updateAction1.jsp?type="+type+"&num="+num+"&aid="+aid,"no"]
            });

        }

        function deletes(aid)
        {
                    $.ajax({
                        url:'../action/delete'
                        ,type:'POST'
                        ,data:{'aid':aid}
                        ,success:function(num1){
                            if(num1>0)
                            //    layer.msg("删除成功");
                            alert("删除成功")
                                repeat1(num);
                        }
                    })
        }
        function actionNum(obj) {
            //防止重复提交相同的页数
            if (num == obj) {
                return;
            }
            repeat1(obj);
        }
        //上一页
        function perv() {
            num -= 1;
            if (num < 1) {
                num = 1;
                return;
            }
            repeat1(num)
        }


        //下一页
        function next() {
            num += 1;
            if (num > size) {
                num = size;
                return;
            }
            repeat1(num)
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
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">项目案例管理</a></li>
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">行业新闻</a></li>
                    </ul>
                </div>
            </div>

            <div class="row animated fadeInUp">
                <div class="col-sm-12 col-lg-12">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">

                            <h4 class="section-subtitle"><b>行业新闻信息表</b></h4>
                            <div class="panel">
                                <div class="panel-header">
                                    <%--                                    <span>显示(页/条数):</span><span class="code"><select id="select">--%>
                                    <%--                                        <option>10</option>--%>
                                    <%--                                        <option>20</option>--%>
                                    <%--                                        <option>30</option>--%>
                                    <%--                                        <option>50</option>--%>
                                    <%--                                    </select> </span>--%>
                                    <span style="margin-left: 93%" >
                                    <button id="add" class="btn btn-primary">添 加</button></span>
                                </div>
                                <div class="panel-content">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover table-bordered text-center">
                                            <%--                                            <thead>--%>
                                            <%--                                        <tr>--%>
                                            <%--                                            <th><input type="checkbox" id="allcheck"></th>--%>
                                            <%--                                            <th>编号</th>--%>
                                            <%--                                            <th>标题</th>--%>
                                            <%--                                            <th>来源</th>--%>
                                            <%--                                            <th>时间</th>--%>
                                            <%--                                            <th>内容</th>--%>
                                            <%--                                        </tr>--%>
                                            <%--                                        </thead>--%>
                                            <tbody id="tbody">

                                            </tbody>
                                        </table>
                                    </div>
                                    <%--分页--%>
                                    <div>
                                        <span id="paging"></span>
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
