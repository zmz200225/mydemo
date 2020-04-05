package com.zb.service;

import com.zb.entity.Auction;
import com.zb.util.PageUtil;

import java.util.List;

public interface AuctionService {
    public PageUtil<Auction> findAuctionPage(Integer index, Integer size, Auction auction);

    public int insertAuction(Auction auction);

    public int deleteAuction(Integer id);

    public Auction findAuctionById(Integer id);

    public int updateAuction(Auction auction);

    public List<Auction> startAuctionList();
}
