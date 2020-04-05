package com.zb.controller;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import com.zb.entity.Auction;
import com.zb.service.AuctionService;
import com.zb.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@Controller
public class AuctionController {
    @Autowired
    private AuctionService auctionService;

    @RequestMapping(value = "/page")
    @ResponseBody
    // String auctionName, String auctionDesc, String auctionStartTime, String auctionEndTime, Float auctionStartPrice
    public String page(@RequestParam(value = "index", defaultValue = "1") Integer index, @RequestParam(value = "size", defaultValue = "4") Integer size, Auction auction) {
//        Auction auction = new Auction();
//        auction.setAuctionName(auctionName);
//        auction.setAuctionDesc(auctionDesc);
//        auction.setAuctionStartTime(auctionStartTime);
//        auction.setAuctionEndTime(auctionEndTime);
//        auction.setAuctionStartPrice(auctionStartPrice);
        PageUtil<Auction> page = auctionService.findAuctionPage(index, size, auction);
        return JSON.toJSONString(page);
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Auction auction, HttpServletRequest request, MultipartFile file) {
        try {
            dofile(file, request, auction);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int num = auctionService.insertAuction(auction);
        if (num > 0) {
            request.setAttribute("msg", "<script>alert('添加成功')</script>");
        } else {
            request.setAttribute("msg", "<script>alert('添加失败')</script>");
        }
        return "adminmain";
    }

    @RequestMapping(value = "/del")
    @ResponseBody
    public String del(Integer id) {
        int num = auctionService.deleteAuction(id);
        return JSON.toJSONString(num);
    }

    @RequestMapping(value = "/findbyid")
    @ResponseBody
    public String findbyid(Integer id) {
        Auction auction = auctionService.findAuctionById(id);
        return JSON.toJSONString(auction);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Auction auction, HttpServletRequest request, MultipartFile file) {
        try {
            dofile(file, request, auction);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int num = auctionService.updateAuction(auction);
        if (num > 0) {
            request.setAttribute("msg", "<script>alert('修改成功')</script>");
        } else {
            request.setAttribute("msg", "<script>alert('修改失败')</script>");
        }
        return "adminmain";
    }

    @RequestMapping(value = "/startlist")
    @ResponseBody
    public String startlist() {
        List<Auction> list = auctionService.startAuctionList();
        return JSON.toJSONString(list);
    }


    public void dofile(MultipartFile file, HttpServletRequest request, Auction auction) throws Exception {
        if (file != null) {
            String path = request.getSession().getServletContext().getRealPath("/statics/images");
            String filename = System.currentTimeMillis() + file.getOriginalFilename();
            File myFile = new File(path, filename);
            file.transferTo(myFile);

            /****************云服务器start*****************/
            //构造一个带指定 Region 对象的配置类
            Configuration cfg = new Configuration(Zone.autoZone());
            //...其他参数参考类注释
            UploadManager uploadManager = new UploadManager(cfg);
            //...生成上传凭证，然后准备上传
            String accessKey = "zEG1N2071CBd323XFSuYkl0O1l5d5vzVU4_YnVii";
            String secretKey = "wVpcjgUnXWGMlPkMmwNBWEvkHnF72jyggcrp7jd3";
            String bucket = "zmz63";
            //如果是Windows情况下，格式是 D:\\qiniu\\test.png
            String localFilePath = myFile.getAbsolutePath();
            //默认不指定key的情况下，以文件内容的hash值作为文件名
            String key = null;
            Auth auth = Auth.create(accessKey, secretKey);
            String upToken = auth.uploadToken(bucket);

            Response response = uploadManager.put(localFilePath, key, upToken);
            //解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            System.out.println(putRet.key);
            System.out.println(putRet.hash);
            /****************云服务器end *****************/
            auction.setAuctionPic("http://q7zvsxcqb.bkt.clouddn.com/" + putRet.hash);
        }
    }
}

