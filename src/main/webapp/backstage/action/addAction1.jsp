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
            <span><label >来源:</label>
            <input class="form-control" type="text" id="source" ></span>
            <span><label  style="margin-left: 0%">标题:</label><input class="form-control" type="text" style="width: 600px" id="proname"></span>
        </div>
    </div>
    <br>
    <div id="div1" class="toolbar">
    </div>
    <div style="padding: 10px 0; color:#9dc1d3"></div>
    <div id="div2" class="text" style="height:350px;border:1px solid #cccccc"> <!--可使用 min-height 实现编辑区域自动增加高度-->

    </div>
    <script type="text/javascript" src="vendor/js/Jquery-3.4.1.js"></script>
    <script src="layer-v3.1.1/layer/layer.js"></script>
    <script type="text/javascript" src="release/wangEditor.min.js"></script>


    <script src="layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="layui/css/layui.css" />
    <script type="text/javascript">

        var E = window.wangEditor;
        var editor = new E('#div1', '#div2'); // 两个参数也可以传入 elem 对象，class 选择器
        editor.create();
        var type=${param.type};
        var a=false;
        //通过
        function ok() {
              var txt=editor.txt.html();
            if (txt == "" || txt == null) {
               // alert("内容不能为空");
                layer.msg("内容不能为空",{icon:2,time:3000});
                return;
            }

            var proname=$("#proname").val();
            if(proname==null||proname=="")
            {
                layer.msg("项目名称不能为空",{icon:2,time:3000});
                return ;
            }

            var source=$("#source").val();
            if(source==null||source=="")
            {
                layer.msg("来源不能为空",{icon:2,time:3000});
                return;
            }
            var filename=$("#filename").html();
            if(a==false)
            {
                repeat(txt,proname,source,filename)
                a=true;
            }
        }

        // layer.msg("支持 jpg|png图片类型",{icon:2,time:5000})
        function repeat(txt,title,source,filename) {
            $.ajax({
                url:'../action/insert' //String txt, String source, String title, String aimg,int type
                ,type:'POST'
                ,data:{'txt':txt,'source':source,'title':title,'aimg':filename,'type':type }
                ,success:function (i) {
                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.repeat1(1);//刷新父页面
                    parent.layer.close(index); //再执行关闭
                }
            });
        }

        layui.use('upload', function(){
            var upload = layui.upload;
            upload.render({
                elem: '#test8'
                ,url: '../action/upload'
                ,auto: false
                ,accept:'images'//文件上传类型(images（图片）、file（所有文件）、video（视频）、audio（音频）)
                ,size: 2000 //最大允许上传的文件大小kb
                ,exts: 'jpg|png' //只允许上传文件后缀
                ,bindAction: '#test9'
                ,choose:function(obj){
                    obj.preview(function(index,file,result){
                        var date=new Date();
                        var year=date.getFullYear();//年份
                        var month=date.getMonth()+1;//月份(0-11)
                        var day=date.getDate();//当前日期
                        var time=date.getTime();//获取从1970到当前的毫秒数
                        var filename=year+"-"+month+"-"+day+""+time+""+file.name;
                        // $("#filename").prop("href","");
                        obj.resetFile(index, file,filename); //重命名文件名，
                        $("#filename").html(filename);
                    })
                }
                ,done: function(res){//return success function
                    layer.msg("成功上传",{icon:1,time:3000});
                    $("#test9").prop("disabled","disabled");
                    $("#test8").prop("disabled","disabled");
                }
                ,error:function(res){
                    layer.msg("上传失败",{icon:2,time:3000});
                }
            });
        })


    </script>
    <div>
        <form action="upload" method="post" onsubmit="return false" enctype="multipart/form-data" >
            <div class="layui-upload">
                <button type="button" name="file" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
                <button type="submit" class="layui-btn" id="test9" >开始上传</button>
                文件名:<a id="filename" style="margin-top:10px;margin-left: 0px" href="javascript:void(0)" ></a>
            </div>
        </form>
    </div>
    <div style="text-align: center;margin-top: 10px"><span><button class='btn btn-primary' onclick='ok()'>确 定</button> &nbsp;&nbsp;</span>
    </div>
</div>


</body>
</html>
