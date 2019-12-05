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
            <span><label  style="margin-left: 0%">职位名称:</label><input class="form-control" type="text" style="width: 600px" id="proname"></span>
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

    <script src="layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="layui/css/layui.css" />

    <script type="text/javascript">

        $("#filename").html("支持 jpg|png图片类型");

        $(function () {
            var pid = ${param.id}
                // alert("pid:"+pid)
                $.ajax({
                    url: '../deptinfo/upShow'
                    , type: 'POST'
                    , data: {'id': pid}
                    , success: function (json) {
                        $("#proname").val(json.dname);
                        $("#txt").html(json.duty);
                    }
                })
        });

        var E = window.wangEditor;
        var editor = new E('#div1', '#div2'); // 两个参数也可以传入 elem 对象，class 选择器
        editor.create();
        var bal=true;
        //通过
        function ok() {
            var txt = editor.txt.text();
            if (txt == "" || txt == null) {
                layer.msg("内容不能为空",{icon:2,time:3000});
                return;
            }
            var proname=$("#proname").val();
            if(proname==null||proname=="")
            {
                layer.msg("职称不能为空",{icon:2,time:3000});
                return ;
            }
            if(bal)
            {
                repeat(txt,proname);
                bal=false;
            }

        }
        function repeat(txt, proname) {
            $.ajax({
                url: '../deptinfo/update'
                , type: 'POST'
                , data: {'txt': txt, 'dname':proname,'id':${param.id}}
                , success: function (i) {
                    if(i>0)
                    layer.msg("修改成功")
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
