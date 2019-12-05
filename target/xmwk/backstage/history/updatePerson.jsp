<%--
  Created by IntelliJ IDEA.
  User: yzf
  Date: 2019/11/13
  Time: 14:27
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
    <script type="text/javascript" src="vendor/js/Jquery-3.4.1.js"></script>
    <script src="layer-v3.1.1/layer/layer.js"></script>

    <script src="vendor/input-masked/phone-codes/phone.js"></script>
    <script src="vendor/bootstrap_date-picker/js/bootstrap-datepicker.min.js"></script>
    <script src="vendor/bootstrap_time-picker/js/bootstrap-timepicker.js"></script>
    <script src="vendor/bootstrap_color-picker/js/bootstrap-colorpicker.min.js"></script>
    <script src="javascripts/examples/forms/advanced.js"></script>
    <script src="layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="layui/css/layui.css" />
</head>
<body>

<div>
    <div>
        <div class="layui-inline">
            <span><label>姓名:<input class="form-control" type="text" placeholder="如果不填写,默认原来的名字" maxlength="10"
                                   style="width: 600px" id="uname"></label> </span>
            <span><label>性别:<input type="radio" name="sex" value="男"> 男 &nbsp;<input type="radio" name="sex" value="女"> 女  </label> </span>

            <span><label>电话:<input class="form-control" type="text" placeholder="如果不填写,默认原来的电话" maxlength="11"
                                   style="width: 600px" id="phone-mask" value="49"></label> </span>

            <span><label>年龄:<input class="form-control" type="text" maxlength="3" placeholder="如果不填写,默认原来的年龄"
                                   style="width: 600px" id="age"></label> </span>
            <span><label>Email:<input class="form-control" type="text" placeholder="如果不填写,默认原来的Email" maxlength="30"
                                      style="width: 600px" id="email"></label> </span>
            <span><label>密码:<input class="form-control" type="text" placeholder="如果不填写,默认原来的密码" maxlength="20"
                                   style="width: 600px" id="pwd"></label> </span>
        </div>
    </div>
    <br>

    <script src="layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="layui/css/layui.css"/>

    <script type="text/javascript">


        $(function () {

            layer.msg("温馨提示:修改后要重新登录",{icon:1,time:5000});

            var name = "${sessionScope.get("userinfo").uname}";
            var sex =${sessionScope.get("userinfo").usex};
            var age =${sessionScope.get('userinfo').uage};
            var img = "${sessionScope.get('userinfo').uimg}";
            var phone = "${sessionScope.get('userinfo').uphone}";
            var pwd = "${sessionScope.get('userinfo').upwd}";
            var email = "${sessionScope.get('userinfo').uemail}";

            $("#uname").val(name);
            $("#phone-mask").val(phone);
            $("#age").val(age);
            $("#pwd").val(pwd);
            $("#email").val(email);
            $("#filename").html(img);

            var se=$("input[name='sex']");
            $.each(se,function (i,v) {
                if(i==sex)
                {
                     $(this).prop("checked","checked");
                }
            })
        });

        //通过
        function ok() {
            //String phone, String fac,String qq,String email,String https,String coperats,String address,int cid
            var name=$("#uname").val();
            var phone= $("#phone-mask").val();
            var age = $("#age").val();
            var pwd= $("#pwd").val();
            var email= $("#email").val();
            var filename=$("#filename").html();

            var t_phone = /[1-9]{11,}/;
            //alert(!t_phone.test(phone));
            if (!t_phone.test(phone) ) {
                layer.msg("电话号码格式错误");
                return;
            }

            if (name.length > 10) {
                layer.msg("姓名长度有错，只能在10个字符内");
                return;
            }

            var t_qq = /[1-9]{2,}/;
            //alert(!t_qq.test(age));
            if (!t_qq.test(age)) {
                layer.msg("年龄格式有错");
                return;
            }

            var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            if (!reg.test(email)) {
                layer.msg("邮箱格式不正确");
                return;
            }

            var img=$("#filename").html();
            var se=$("input[name='sex']");
            var sex=""
            $.each(se,function (i,v) {
               if($(this).is(":checked"))
               {
                 sex=i;
               }
               alert(sex);
            });

            repeat(sex,age,img, pwd,phone,email, name );
        }

        function repeat(sex,age,img, pwd,phone,email, name) {

            $.ajax({
                url: '../updateInfo'
                ,
                type: 'POST'
                ,
                data: {
                    'phone': phone,
                    'name': name,
                    'sex':sex,
                    'email': email,
                    'age': age,
                    'img': img,
                    'pwd': pwd,
                    'uid':${sessionScope.get("userinfo").uid}
                }
                ,
                success: function (i) {

                    var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                    parent.repeat1(${param.num});//刷新父页面
                    parent.back();
                    parent.layer.close(index); //再执行关闭


                }
            });
        }

        layui.use('upload', function(){
            var upload = layui.upload;
            upload.render({
                elem: '#test8'
                ,url: '../upload'
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
        });


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
