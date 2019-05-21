 //app.js
 //1:复制服务器端模块
 //2:引入第三方模块
 //  mysql/express/
 const express = require("express");
 const bodyparser=require("body-parser")
 const pool=require("./pool")
 const session=require("express-session");
 //1.1引入跨域模块
 const cors=require("cors");
 /*引入路由模块*/
 var user=require("./router/user");
 //4:创建express对象
 var server = express(); 
//  配置session
server.use(session({
  secret:"128为字符串",
  resave:true,
  saveUninitialized:true
}))
 //1.2配置运行列表3000运行8080脚手架访问
 //credentials:true提高安全级别每次访问验证
 //origin允许访问的地址
 server.use(cors({origin:["http://127.0.0.1:8080","http://localhost:8080"],credentials:true}))
 //5:绑定监听端口 3000
 server.listen(3000,function(){
  console.log("服务器启动")
});
//使用body-parser中间件
server.use(bodyparser.urlencoded({extended:false}));
//托管静态资源到public目录下
 server.use(express.static("public"));
 server.use("/user",user);
  //Index数据
  //轮播图
  server.get("/imglist",(req,res)=>{
    // 3.创建数据发送客户
    var sql="SELECT cid,title,img FROM tea_index_carousel";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result}); 
    })
  });
  //菜单
  server.get("/menu",(req,res)=>{
    // 3.创建数据发送客户
    var sql="SELECT mid,title,img FROM tea_index_menu";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result}); 
    })
  });
  //主体内容
  server.get("/sale",(req,res)=>{
    var sql="SELECT pid,lid,pimg,details,type,pic,price,href,pri FROM tea_index_product";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result});
    })
  })
  //分类
  server.get("/class",(req,res)=>{
    var sql="SELECT fid,tfid,fimg,fname,type,href FROM tea_laptop_family";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result});
    })
  })
  //details 
  server.get("/details",(req,res)=>{
    var sql="SELECT lid,type,limg1,limg2,limg3,limg4,title,price ,promise,limg5,limg6,limg7,href FROM tea_laptop";
    pool.query(sql,(err,result)=>{
      if(err) throw err;
      res.send({code:1,data:result,msg:"商品点击数量增加"});
    })
  })
   //details 
  server.get("/det",(req,res)=>{
    var lid=req.query.lid;
    var sql="SELECT lid,type,limg1,limg2,limg3,limg4,title,price ,promise,limg5,limg6,limg7,href FROM tea_laptop WHERE lid=?";
    pool.query(sql,[lid],(err,result)=>{
      if(err) throw err;
         res.send({code:1,data:result});
    })
  })
  //Refer数据
  //refer内容
   server.get("/refer",(req,res)=>{
    var key=req.query.key;
    console.log(key)
    var pno=req.query.pno;
    var ps=req.query.pageSize;
    if(!pno){pno=1}
    if(!ps){ps=5}
    //2.sql
    var sql="SELECT lid,type,limg1,limg2,limg3,limg4,title,price ,promise,limg5,limg6,limg7,href FROM tea_laptop WHERE type LIKE concat('%',?,'%') LIMIT ?,?"
    //3.发送sql
    var offset=(pno-1)*ps;
    pool.query(sql,[key,offset,ps],(err,result)=>{
      if(err) throw err
      res.send({code:1,data:result})
    })
  })
  //用户
  server.get("/login",(req,res)=>{
    var uid=req.query.uid;
    var uimg=req.query.uimg;
    console.log(uimg);
    var uname=req.query.uname;
    console.log(uname)
    var sql="SELECT uid,uimg,uname FROM tea_user WHERE uimg=? AND uname=?"
    pool.query(sql,[uimg,uname],(err,result)=>{
      if(err) throw err
      if(result.length>0){
        res.send({code:"1",data:result});
      }else{
        var sql1="INSERT INTO tea_user SET uimg=? AND uname=?"
        pool.query(sql1,[uimg,uname],(err,result)=>{
          if(err) throw err
          if(result.affectedRows>0){
            res.send({code:"2",data:result});
          }
        })
      }
    })
  })
  //用户订单
  // server.get('/order',(req,res)=>{
  //   var did=req.query.did;
  //   var productId=req.query.productId;
  //   var count=req.query.count;
  //   var sql="INSERT INTO tea_order_detail SET productId=? AND count=?"
  //   pool.query(sql,[productId,count],(err,resylt)=>{
  //     if(err) throw err
  //     if(result.affectedRows>0){
  //       res.send({code:"1",data:result});
  //     }
  //   })
  // }) 