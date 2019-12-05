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
    <script type="text/javascript" src="vendor/js/Jquery-3.4.1.js"></script>
    <script src="layer-v3.1.1/layer/layer.js"></script>

    <script src="vendor/input-masked/phone-codes/phone.js"></script>
    <script src="vendor/bootstrap_date-picker/js/bootstrap-datepicker.min.js"></script>
    <script src="vendor/bootstrap_time-picker/js/bootstrap-timepicker.js"></script>
    <script src="vendor/bootstrap_color-picker/js/bootstrap-colorpicker.min.js"></script>
    <script src="javascripts/examples/forms/advanced.js"></script>

</head>
<body>

<div>
    <div>
        <div class="layui-inline">
            <span><label >电话:<input class="form-control" type="text" placeholder="如果不填写,默认原来的电话" maxlength="13" style="width: 600px" id="phone-mask" value="49" ></label> </span>

            <span><label >联系人姓名:<input  class="form-control" type="text" maxlength="20" placeholder="如果不填写,默认原来的姓名" style="width: 600px" id="name" ></label> </span>
            <span><label >传真:<input class="form-control" type="text" placeholder="如果不填写,默认原来的传真" maxlength="13" style="width: 600px" id="fac"  ></label> </span>
            <span><label >QQ:<input class="form-control" type="text" placeholder="如果不填写,默认原来的QQ" maxlength="11" style="width: 600px" id="qq" ></label> </span>
            <span><label >Email:<input class="form-control" type="text" placeholder="如果不填写,默认原来的Email"  maxlength="50" style="width: 600px" id="email" ></label> </span>
            <span><label >官网地址:<input class="form-control" type="text" placeholder="如果不填写,默认原来的官网地址"  maxlength="100" style="width: 600px" id="https" ></label> </span>
            <span><label >地址:<input class="form-control" type="text" placeholder="如果不填写,默认原来的地址" maxlength="200" style="width: 600px" id="address" ></label> </span>
        </div>
    </div>
    <br>

    <script src="layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="layui/css/layui.css" />

    <script type="text/javascript">


        $(function () {
            var cid = ${param.cid}
                $.ajax({
                    url: '../contact/upShow'
                    , type: 'POST'
                    , data: {'cid': cid}
                    , success: function (json) {
                        $("#name").val(json.coperate);
                        $("#phone-mask").val(json.cphone);
                        $("#fac").val(json.cfac);
                        $("#qq").val(json.cqq);
                        $("#address").val(json.caddress);
                        $("#email").val(json.cemail);
                        $("#https").val(json.chttps);
                    }
                })
        });
        //通过
        function ok() {
          //String phone, String fac,String qq,String email,String https,String coperats,String address,int cid
           var name= $("#name").val();
            var phone= $("#phone-mask").val();
            var fac= $("#fac").val();
            var qq= $("#qq").val();
            var address= $("#address").val();
            var email= $("#email").val();
            var https=$("#https").val();

            var t_phone=/\d{3}-\d{8}|\d{4}-\{7,8}/;
             if(!t_phone.test(phone)||phone.length>13)
             {
                 layer.msg("电话号码格式错误");
                 return;
             }
            if(!t_phone.test(fac)||fac.length>13)
            {
                layer.msg("传真格式错误");
                return;
            }
             if(name.length>10)
             {
                 layer.msg("姓名长度有错，只能在10个字符内");
                 return;
             }

             var t_qq=/[0-9]{11,}/;
             if(!t_qq.test(qq)){
                 layer.msg("qq格式有错");
                 return;
             }

            var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            if (!reg.test(email))
            {
                layer.msg("邮箱格式不正确");
                return;
            }

            var t_https=/[a-zA-z]+:\/\/[^s]*/;
            if(!t_https.test(https))
            {
                layer.msg("网址格式不正确");
                return;
            }

            repeat(phone,fac,qq,email,https,name,address);
        }
        function repeat(phone,fac,qq,email,https,name,address) {

            $.ajax({
                url: '../contact/update'
                , type: 'POST'
                , data: {'phone': phone, 'fac':fac,'qq': qq, 'email':email,'https':https,'coperats':name,'address':address,'cid':${param.cid}}
                , success: function (i) {
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
