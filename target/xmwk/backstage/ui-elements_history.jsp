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

        //保存页数
        var num = 1;
        //保存总页数
        var size = 1;
        //每页条数
        var count=5;
        $(function () {
            repeat1(num)

            //保存初始内容定义
            $("#select").change(function () {
                var a=$(this).val();
               count=a;
                repeat1(num);
            })

            $("#add").click(function () {
                //location.href="history/addHistory.jsp"
                //全局弹出层属性
                layer.config({
                    anim: 4, //默认动画风格
                    skin: 'layui-layer-molv' //默认皮肤
                });
                layer.open({
                    type: 2,
                    title:"添加历程",
                    area: ['600px', '600px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: ["history/addHistory.jsp","no"]
                });
            })

            //多项删除
            $("#dels").click(function () {
                var v="";
                var tage=false;
                //传值
                var check=$("input[name='singlecheck']");
                $.each(check,function () {
                    //赋值
                    if($(this).is(":checked"))
                    {
                        var a=$(this).val();
                        v+=a+",";
                        //判断是否选择了
                        tage=true;
                    }
                })

                if(tage)
                {
                    layer.confirm('确定要删除',{
                            btn: ['删除','算了'] //按钮
                        },function(index){
                            $.ajax({
                                url:'../history/deletes'
                                ,type:'POST'
                                ,data:{'hids':v}
                                ,success:function(i){
                                    if(i>0)
                                        layer.msg("删除成功")
                                    repeat1(num);
                                }
                            })
                            layer.close(index)
                        }
                        ,function(index){
                            layer.close(index)
                        });
                }
                else
                    layer.msg("请选择删除项")
                if($("#allcheck").is(":checked"))
                {
                    $("#allcheck").prop("checked",!"checked")
                }

            })

            $("#allcheck").click(function () {
                var check=$("input[name='singlecheck']");
                $.each(check,function () {
                    $(this).prop("checked",$("#allcheck").is(":checked"))
                })
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


        //追加预览
        function repeat(list) {
            var add = "<div class='timeline-box'>"
                + "<div class='timeline-icon bg-primary'>"
                + "<a name='" + list.htime + "'></a>"
                + "<i class=' fa fa-file'></i>"
                + "</div>"
                + "<div class='timeline-content'>"
                + "<h4 class='tl-title' >" + list.htime + "</h4>"
                + list.htext
                + "</div> "
                + "</div>"
            $("#timeline").append(add);
        }

        //分页查询或首次加载数据
        function repeat1(num1) {
            $.ajax({
                url: "../history/showinfo"
                , type: 'POST'
                , data: {'num': num1,'count':count}
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
                        var add = "<tr>"
                            + "<td><input type='checkbox' name='singlecheck' value='"+list[i].hid+"'></td>"
                            + "<td>" + (i+1) + "</td>"
                            + "<td>" + list[i].htime + "</td>"
                            + "<td>" + list[i].htext + "</td>"
                            + "<td>"
                            + "<div class='btn-group btn-group-xs'>"
                            + "<a href='#" + list[i].htime + "' class='btn btn-transparent' ><i class='fa fa-eye'></i>"
                            + "  </a>"
                            + "<button class='btn btn-transparent' onclick='update("+list[i].hid+")'><i class='fa fa-pencil'></i> </button>"
                            + "<button class='btn btn-transparent' onclick='deletes("+list[i].hid+")'><i class='fa fa-times'></i> </button>"
                            + " </div></td></tr>";
                        $("#tbody").append(add);
                        //追加历史记录
                        repeat(list[i])
                    }

                }
            });
        };
        function update(hid)
        {
            //alert(hid);
           // location.href="history/updateHistory.jsp?hid="+hid;
            //全局弹出层属性
            layer.config({
                anim: 4, //默认动画风格
                skin: 'layui-layer-molv' //默认皮肤
            });
            layer.open({
                type: 2,
                title:"修改历程",
                area: ['600px', '600px'],
                fixed: false, //不固定
                maxmin: true,
                content: ["history/updateHistory.jsp?num="+num+"&hid="+hid,"no"]
            });
        }

        function deletes(hid)
        {
            layer.confirm('确定要删除',{
                    btn: ['删除','算了'] //按钮
                },function(index){
                    $.ajax({
                        url:'../history/delete'
                        ,type:'POST'
                        ,data:{'hid':hid}
                        ,success:function(num1){
                            repeat1(num);
                        }
                    });
                    layer.close(index)
                }
                ,function(index){
                    layer.close(index)
                })

          // layer.msg("asdgwe");

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
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">关于我们</a></li>
                        <li><i class="fa fa-home" aria-hidden="true"></i><a href="#">发展历史</a></li>
                    </ul>
                </div>
            </div>

            <div class="row animated fadeInUp">
                <div class="col-sm-12 col-lg-9">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">

                            <h4 class="section-subtitle"><b>历程信息表</b></h4>
                            <div class="panel">
                                <div class="panel-header">
                                    <span>显示(页/条数):</span><span class="code"><select id="select">
                                        <option>10</option>
                                        <option>20</option>
                                        <option>30</option>
                                        <option>50</option>
                                    </select> </span><span style="margin-left: 65%" >
                                    <button id="dels" class="btn btn-warning">删 除</button>
                                    <button id="add" class="btn btn-primary">添 加</button></span>
                                </div>
                                <div class="panel-content">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-hover table-bordered text-center">
                                            <thead>
                                            <tr>
                                                <th><input type="checkbox" id="allcheck"></th>
                                                <th>编号</th>
                                                <th>时间</th>
                                                <th>内容</th>
                                            </tr>
                                            </thead>
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
                <div class="col-sm-12 col-lg-3">
                    <div class="timeline" id="timeline">


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
