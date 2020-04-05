package com.zb.service.impl;

import com.zb.entity.Auction;
import com.zb.mapper.AuctionMapper;
import com.zb.service.AuctionService;
import com.zb.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AuctionServiceImpl implements AuctionService {
    @Autowired
    AuctionMapper auctionMapper;

    @Override
    public PageUtil<Auction> findAuctionPage(Integer index, Integer size, Auction auction) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", (index - 1) * size);
        params.put("size", size);
        params.put("auctionName", auction.getAuctionName());
        params.put("auctionDesc", auction.getAuctionDesc());
        params.put("auctionStartTime", auction.getAuctionStartTime());
        params.put("auctionEndTime", auction.getAuctionEndTime());
        params.put("auctionStartPrice", auction.getAuctionStartPrice());
        PageUtil<Auction> page = new PageUtil<>();
        page.setIndex(index);
        page.setSize(size);
        page.setCount(auctionMapper.findAuctionCount(params));
        page.setData(auctionMapper.findAuctionPage(params));
        return page;
    }

    @Override
    public int insertAuction(Auction auction) {
        return auctionMapper.insertAuction(auction);
    }

    @Override
    public int deleteAuction(Integer id) {
        return auctionMapper.deleteAuction(id);
    }

    @Override
    public Auction findAuctionById(Integer id) {
        return auctionMapper.findAuctionById(id);
    }

    @Override
    public int updateAuction(Auction auction) {
        return auctionMapper.updateAuction(auction);
    }

    @Override
    public List<Auction> startAuctionList() {
        return auctionMapper.startAuctionList();
    }


}
