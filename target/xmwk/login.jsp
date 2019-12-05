<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <title>天 能 物 业</title>
    <link type="text/css" rel="stylesheet" href="backstage/stylesheets/css/style1.css">

    <script src="backstage/vendor/js/img_ver.js"></script>
    <script src="backstage/vendor/js/Jquery-3.4.1.min.js"></script>

    <style>
        .bxs-row {
            margin-bottom:12px;
        }
        .logo-box {
            width:404px;
            margin:120px auto;
            border:1px solid #e5e5e5;
            border-radius:4px;
            box-shadow:0 4px 18px rgba(0,0,0,0.2);
            position:relative;
            overflow:hidden;
            height:360px;
        }
        .login
        {
            position:absolute;
            width:320px;left:0;
            top:0;
            padding: 42px 42px 36px;
            transition:all 0.8s;
        }
        .username,.password,.btn {
            height: 44px;
            width: 100%;
            padding: 0 10px;
            border: 1px solid #9da3a6;
            background: #fff;
            text-overflow: ellipsis;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -khtml-border-radius: 4px;
            border-radius: 4px;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            color: #000;
            font-size: 1em;
            font-family: Helvetica,Arial,sans-serif;
            font-weight: 400;
            direction: ltr;
            font-size:13px;
        }
        .submit {
            background-color: #0070ba;
            color:#fff;
            border:1px solid #0070ba;
        }
        .submit:hover {
            background-color:#005ea6;
        }
        .verBox {
            position:absolute;
            width:100%;
            text-align:center;
            left:404px;
            top:0;
            opacity:1;
            transition:all 0.8s;
            padding-top:55px;
        }
        .err {
            margin:12px 0 0;
            line-height:12px;
            height:12px;
            font-size:12px;
            color:red;
        }

    </style>
</head>
<body>
	<div style="margin-left: 37%;height:100px;width:300px;margin-bottom:-150px;margin-top: 20px"  >
		<img style="text-align: center" alt="meiyou" src="backstage/images/logo.png" width="320px" />
	</div>
    <div class="logo-box" style="text-align: center">
        <div class="login" style="">
            <div class="bxs-row" style="text-align:center;">
                <img id="logo" src="" style="width:72px;" alt=""><span class="tips" style="color:red;"></span>
            </div>
            <div style="text-align: center" class="bxs-row">
                <label style="margin-right: 35px">
                    邮箱：<input style="width: 250px;" type="email" class="username" id="email" name="email" value="123456@qq.com" placeholder="用户名">
                </label>
                <p class=" err err-username"></p>
            </div>
            <div class="bxs-row" style="margin-right: 20px">
                <label>
                    密码：<input style="width: 250px" type="password" name="pwd" class="password" value="123456" placeholder="密码">
                </label>
                <p class="err err-password"></p>
            </div>
            <div class="bxs-row"style="margin-left: 30px">
                <input type="button" style="width: 250px" class="submit btn" value="登录">
            </div>
        </div>
        <div class="verBox">
            <div id="imgVer" style="display:inline-block;"></div>
        </div>
    </div>

    <script>

        var email;
        var pwd;
        var token;
        var i="";
        imgVer({
            el:'$("#imgVer")',
            width:'260',
            height:'116',
            img:[
                'backstage/images/ver.png',
                'backstage/images/ver-1.png',
                'backstage/images/ver-2.png',
                'backstage/images/ver-3.png'
            ],

            success:function () {

                // email=$("#email").val();
                // pwd=$(".password").val();
               // alert("email: "+email+",pwd: "+pwd);

                location.href="jumpindex";

                // $.ajax({     // 在这里验证验证码
                //     url:'islogin', //验证验证码的接口
                //     type:'POST',
                //     data:{
                //         'email':email,'pwd':pwd
                //     },
                //     success:function () { //验证码验证成功后执行登录函数
                //        alert("success")
                //     },
                //     error:function () {
                //         repeat("error");
                //     }
                //
                // });

             },
         });

        function repeat()
        {
            $(".login").css({
                "left": "-404px",
                "opacity": "0"
            });
            $(".verBox").css({
                "left": "0",
                "opacity": "1"
            });
        }

        $(".submit").on('click',function () {
            $(".tips").html("");
            var emil=$(".username").val();
            pwd=$(".password").val();
            if( emil=== '') {
                $(".tips").html('兄弟！你用户名呢！？？？');
                $("#logo").attr("src",'backstage/images/null-username.jpg')
            } else if ($(".password").val() === '') {
                $(".tips").html('兄弟！！你密码呢！？？？');
                $("#logo").attr("src", 'backstage/images/null-password.jpg')
            } else {

                var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
                if (!reg.test(emil))
                {
                   $(".tips").html("邮箱格式不正确");
                    return;
                }
                // 初始请求验证码
                $.ajax({     // 在这里验证验证码
                    url:'islogin', //验证验证码的接口
                    type:'POST',
                    data:{
                        'email':emil,'pwd':pwd
                    },
                    success:function (res) { //验证码验证成功后执行登录函数
                       // alert("res="+res);

                        if(res==1)
                        {
                            repeat();
                        }
                        else
                        {
                            $(".tips").html("邮箱或密码错误");
                        }
                    },
                    error:function () {
                        $(".tips").html("邮箱或密码错误");
                    }
                });


            }
        })
    </script>
</body>
</html>
