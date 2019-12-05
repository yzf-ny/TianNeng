<%--
  Created by IntelliJ IDEA.
  User: yzf
  Date: 2019/11/5
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<html>
<head>
    <base href="../">
    <title>Title</title>

    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
    <link rel="stylesheet" href="vendor/animate.css/animate.css">
    <link rel="stylesheet" href="vendor/toastr/toastr.min.css">
    <link rel="stylesheet" href="vendor/magnific-popup/magnific-popup.css">
</head>
<body>

<div>
    <div>
        <div class="layui-inline">
            <label class="layui-form-label">历程日期:</label>
            <input type="date" id="date" placeholder="yyyy-MM-dd">
        </div>
    </div>
    <br>
    <div id="div1" class="toolbar">
    </div>
    <div style="padding: 10px 0; color:#9dc1d3"></div>
    <div id="div2" class="text" style="height:350px;border:1px solid #cccccc"> <!--可使用 min-height 实现编辑区域自动增加高度-->
        <p id="txt"></p>
    </div>
    <script type="text/javascript" src="vendor/js/Jquery-3.4.1.js"></script>
    <script src="layer-v3.1.1/layer/layer.js"></script>
    <script type="text/javascript" src="release/wangEditor.min.js"></script>

    <script type="text/javascript">

        $(function () {
            var hid = ${param.hid}
            $.ajax({
                url: '../history/upShow'
                , type: 'POST'
                , data: {'hid': hid}
                , success: function (json) {
                    // alert(json.htime)
                    $("#date").val(json.htime)
                    $("#txt").html(json.htext);
                }
            })
        })

        var E = window.wangEditor;
        var editor = new E('#div1', '#div2'); // 两个参数也可以传入 elem 对象，class 选择器
        editor.create();

        var ba=true;
        //通过
        function ok() {
            var txt = editor.txt.text();
             //alert(txt);
            //alert("txt="+txt)
            if (txt == "" || txt == null) {
               // alert("");
                layer.msg("内容不能为空",{icon:2,time:3000});
                return;
            }

            var mydate = new Date();
            //当前日期
            var time = mydate.toLocaleDateString();

            //选择日期
            var time1 = $("#date").val();
            //alert(time1)
            if (time1 == '') {
                layer.msg("请选择一个小于或等于当前的日期",{icon:2,time:3000});
                return;
            }
            if (Date.parse(time) < Date.parse(time1)) {
                layer.msg("请重新选择时间,且不能大于当前时间",{icon:2,time:3000});
                return;
            }
            if(ba)
            {
                repeat(txt, time1);
                ba=false;
            }
        };

        function repeat(txt, time) {
            $.ajax({
                url: '../history/update'
                , type: 'POST'
                , data: {'txt': txt, 'time': time, 'hid':${param.hid}}
                , success: function (i) {
                    if (i>0)
                    layer.msg("修改成功",{icon:1,time:3000});
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.repeat1(${param.num});//刷新父页面
                    parent.layer.close(index); //再执行关闭
                }
            });
        }
    </script>
    <div style="text-align: center;margin-top: 10px"><span><button class='btn btn-primary' onclick='ok()'>确 定</button> &nbsp;&nbsp;</span>
    </div>
</div>


</body>
</html>
