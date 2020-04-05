package com.zb.controller;

import com.alibaba.fastjson.JSON;
import com.zb.entity.Auction;
import com.zb.entity.AuctionRecord;
import com.zb.entity.User;
import com.zb.service.AuctionRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AuctionRecordController {
    @Autowired
    private AuctionRecordService auctionRecordService;

    @RequestMapping(value = "/record")
    @ResponseBody
    public String record(Integer id) {
        List<AuctionRecord> list = auctionRecordService.findAuctionRecord(id);
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/insertrecord")
    @ResponseBody
    public String insertrecord(Integer id, Float sale, HttpSession session) {
        int price = auctionRecordService.findMaxPrice(id);
        int num = 0;
        User user = (User) session.getAttribute("sys_user");
        if (user == null) {
            return JSON.toJSONString(num);
        }
        if (price >= sale) {
            return JSON.toJSONString(num);
        }
        AuctionRecord auctionRecord = new AuctionRecord();
        Auction auction = new Auction();
        auctionRecord.setUser(user);
        auction.setAuctionId(id);
        auctionRecord.setAuction(auction);
        auctionRecord.setAuctionPrice(sale);
        num = auctionRecordService.insertAuctionRecord(auctionRecord);
        return JSON.toJSONString(num);
    }

    @RequestMapping(value = "/findend")
    @ResponseBody
    public String findend() {
        List<AuctionRecord> list = auctionRecordService.findEndList();
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/findrecordbyid")
    @ResponseBody
    public String findrecordbyid(Integer aid) {
        List<AuctionRecord> list = auctionRecordService.findAuctionByAid(aid);
        return JSON.toJSONString(list);
    }

}
